function wheel_axle(root, schema)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.descriptor = 'Wheel and Axle';
    % 21 23
    % 22 23
    A = schema.terminal('A');
    A.description = 'Axle';
    A.domain = root.fl.mechanical.rotational.rotational;
    A.location = {'Left';[0.5]};
    % 27 28
    P = schema.terminal('P');
    P.description = 'Wheel periphery';
    P.domain = root.fl.mechanical.translational.translational;
    P.location = {'Right';[0.5]};
    % 32 34
    % 33 34
    R = schema.parameter('R');
    R.description = 'Wheel radius';
    R.type = ne_type('real', [1.0 1.0], 'm');
    R.default = .05;
    % 38 39
    or = schema.parameter('or');
    or.description = 'Mechanism orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 43 46
    % 44 46
    % 45 46
    var_int_A = schema.local_variable('torque_A');
    var_int_A.description = 'Axle torque (N*m)';
    % 48 49
    var_int_F = schema.local_variable('force_P');
    var_int_F.description = 'Periphery force (N)';
    % 51 52
    var_int_w = schema.local_variable('ang_velocity');
    var_int_w.description = 'Axle angular velocity (rad/s)';
    % 54 55
    var_int_v = schema.local_variable('velocity');
    var_int_v.description = 'Periphery velocity (m/s)';
    % 57 58
    schema.setup(@setup);
end % function
function setup(root, w_axle)
    % 61 63
    % 62 63
    w_axle.branch_across('w', w_axle.A.w, []);
    w_axle.branch_through('t', w_axle.A.t, []);
    % 65 66
    w_axle.branch_across('v', w_axle.P.v, []);
    w_axle.branch_through('f', w_axle.P.f, []);
    % 68 70
    % 69 70
    w_axle.parameter('x_R', w_axle.R.check('>', 0.0));
    if eq(w_axle.or, 2.0)
        orient = -1.0;
    else
        orient = 1.0;
    end % if
    w_axle.parameter('orient', orient);
    % 77 79
    % 78 79
    w_axle.parameter('adjust_w_unit', {[1.0],'1/rad'});
    % 80 81
    w_axle.equation(@equation);
end % function
function e = equation(sys, w_axle)
    % 84 86
    % 85 86
    e = sys.equation;
    % 87 89
    % 88 89
    R = w_axle.x_R;
    or = w_axle.orient;
    % 91 92
    torque_A = w_axle.t;
    force_P = w_axle.f;
    velocity = w_axle.v;
    ang_velocity = w_axle.w;
    % 96 98
    % 97 98
    ang_velocity = mtimes(ang_velocity, w_axle.adjust_w_unit);
    % 99 100
    e(1.0) = plus(w_axle.t, mtimes(mtimes(or, R), force_P));
    e(2.0) = minus(w_axle.v, mtimes(mtimes(or, R), ang_velocity));
    % 102 103
end % function
