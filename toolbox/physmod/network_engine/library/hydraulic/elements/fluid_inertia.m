function fluid_inertia(root, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.descriptor = 'Fluid Inertia';
    % 15 17
    % 16 17
    A = schema.terminal('A');
    A.description = 'Element inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 21 22
    B = schema.terminal('B');
    B.description = 'Element outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 26 28
    % 27 28
    area = schema.parameter('area');
    area.description = 'Passage area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = 8e-05;
    % 32 33
    length = schema.parameter('length');
    length.description = 'Passage length';
    length.type = ne_type('real', [1.0 1.0], 'm');
    length.default = 1.0;
    % 37 38
    initial_flow_rate = schema.parameter('initial_flow_rate');
    initial_flow_rate.description = 'Initial flow rate';
    initial_flow_rate.type = ne_type('real', [1.0 1.0], 'm^3/s');
    initial_flow_rate.default = 0.0;
    % 42 44
    % 43 44
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the element (m^3/s)';
    % 46 47
    var_int_p = schema.local_variable('pr_drop');
    var_int_p.description = 'Pressure drop across the element (Pa)';
    % 49 50
    schema.setup(@setup);
    % 51 52
end % function
function setup(root, fl_inertia)
    % 54 56
    % 55 56
    fl_inertia.branch_across('p', fl_inertia.A.p, fl_inertia.B.p);
    fl_inertia.branch_through('q', fl_inertia.A.q, fl_inertia.B.q);
    % 58 60
    % 59 60
    fl_inertia.parameter('x_area', fl_inertia.area.check('>', 0.0));
    fl_inertia.parameter('x_length', fl_inertia.length.check('>', 0.0));
    % 62 63
    fl_inertia.parameter('density', fl_inertia.A.density);
    % 64 65
    fl_inertia.equation(@equation);
end % function
function e = equation(sys, fl_inertia)
    % 68 70
    % 69 70
    e = sys.equation;
    % 71 73
    % 72 73
    area = fl_inertia.x_area;
    length = fl_inertia.x_length;
    density = fl_inertia.density;
    initial_flow_rate = fl_inertia.initial_flow_rate;
    % 77 79
    % 78 79
    flow_rate = fl_inertia.q;
    pr_drop = mtimes(mrdivide(mtimes(density, length), area), fl_inertia.q.der);
    % 81 82
    if sys.dc
        e = minus(fl_inertia.q, initial_flow_rate);
    else
        e = minus(fl_inertia.p, pr_drop);
    end % if
    % 87 88
end % function
