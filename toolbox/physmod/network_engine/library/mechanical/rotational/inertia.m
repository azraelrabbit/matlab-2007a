function inertia(root, schema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    schema.descriptor = 'Inertia';
    % 16 18
    % 17 18
    I = schema.terminal('I');
    I.description = 'Inertia';
    I.domain = root.fl.mechanical.rotational.rotational;
    I.location = {'Top';[0.5]};
    I.label = '';
    % 23 25
    % 24 25
    inertia = schema.parameter('inertia');
    inertia.description = 'Inertia';
    inertia.type = ne_type('real', [1.0 1.0], 'kg*m^2');
    inertia.default = .01;
    % 29 30
    initial_velocity = schema.parameter('initial_velocity');
    initial_velocity.description = 'Initial velocity';
    initial_velocity.type = ne_type('real', [1.0 1.0], 'rad/s');
    initial_velocity.default = 0.0;
    % 34 36
    % 35 36
    var_int_q = schema.local_variable('torque');
    var_int_q.description = 'Inertia torque (N*m)';
    % 38 39
    var_int_p = schema.local_variable('velocity');
    var_int_p.description = 'Inertia absolute velocity (rad/s)';
    % 41 42
    schema.setup(@setup);
    % 43 44
end % function
function setup(root, inertia)
    % 46 49
    % 47 49
    % 48 49
    inertia.branch_across('w', inertia.I.w, []);
    inertia.branch_through('t', inertia.I.t, []);
    % 51 53
    % 52 53
    inertia.parameter('x_inertia', inertia.inertia.check('>', 0.0));
    % 54 56
    % 55 56
    inertia.parameter('adjust_w_unit', {[1.0],'1/rad'});
    % 57 58
    inertia.equation(@equation);
    % 59 60
end % function
function e = equation(sys, inertia)
    % 62 64
    % 63 64
    e = sys.equation;
    % 65 68
    % 66 68
    % 67 68
    x_inertia = inertia.x_inertia;
    % 69 70
    velocity = inertia.w;
    % 71 72
    initial_velocity = inertia.initial_velocity;
    % 73 74
    velocity = mtimes(velocity, inertia.adjust_w_unit);
    % 75 76
    torque = inertia.t;
    % 77 78
    if sys.dc
        e = minus(velocity, mtimes(initial_velocity, inertia.adjust_w_unit));
    else
        e = minus(torque, mtimes(x_inertia, velocity.der));
    end % if
end % function
