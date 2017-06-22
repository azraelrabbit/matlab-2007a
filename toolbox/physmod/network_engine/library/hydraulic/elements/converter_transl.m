function converter_transl(root, schema)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    schema.descriptor = 'Translational Hydro-Mechanical Converter';
    % 17 19
    % 18 19
    C = schema.terminal('C');
    C.description = 'Case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Left';[0.25]};
    % 23 24
    A = schema.terminal('A');
    A.description = 'Hydraulic inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 28 29
    R = schema.terminal('R');
    R.description = 'Rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Right';[0.5]};
    % 33 35
    % 34 35
    area = schema.parameter('area');
    area.description = 'Piston area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0005;
    % 39 40
    or = schema.parameter('or');
    or.description = 'Converter orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 44 46
    % 45 46
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate into the chamber (m^3/s)';
    % 48 49
    var_int_pr = schema.local_variable('pressure');
    var_int_pr.description = 'Pressure at the inlet (Pa)';
    % 51 52
    var_int_Re = schema.local_variable('force');
    var_int_Re.description = 'Output force (N)';
    % 54 55
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 57 58
    schema.setup(@setup);
    % 59 60
end % function
function setup(root, conv_transl)
    % 62 64
    % 63 64
    conv_transl.branch_across('p', conv_transl.A.p, []);
    conv_transl.branch_through('q', conv_transl.A.q, []);
    % 66 67
    conv_transl.branch_across('v', conv_transl.R.v, conv_transl.C.v);
    conv_transl.branch_through('f', conv_transl.C.f, conv_transl.R.f);
    % 69 71
    % 70 71
    conv_transl.parameter('x_area', conv_transl.area.check('>', 0.0));
    x_or = conv_transl.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    conv_transl.parameter('x_or', x_or);
    % 77 80
    % 78 80
    % 79 80
    conv_transl.equation(@equation);
end % function
function e = equation(sys, conv_transl)
    % 83 85
    % 84 85
    e = sys.equation;
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    area = conv_transl.x_area;
    or = conv_transl.x_or;
    % 92 94
    % 93 94
    pressure = conv_transl.p;
    % 95 96
    force = mtimes(mtimes(area, pressure), or);
    flow_rate = mtimes(mtimes(area, conv_transl.v), or);
    power = mtimes(mtimes(force, conv_transl.v), or);
    % 99 101
    % 100 101
    e(1.0) = minus(conv_transl.f, force);
    e(2.0) = minus(conv_transl.q, flow_rate);
    % 103 104
end % function
