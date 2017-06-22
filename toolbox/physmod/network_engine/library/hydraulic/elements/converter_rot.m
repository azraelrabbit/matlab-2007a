function converter_rot(root, schema)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.descriptor = 'Rotational Hydro-Mechanical Converter';
    % 20 22
    % 21 22
    C = schema.terminal('C');
    C.description = 'Case';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Left';[0.25]};
    % 26 27
    A = schema.terminal('A');
    A.description = 'Hydraulic inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 31 32
    R = schema.terminal('S');
    R.description = 'Shaft';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Right';[0.5]};
    % 36 38
    % 37 38
    disp = schema.parameter('D');
    disp.description = 'Displacement';
    disp.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    disp.default = .00012;
    % 42 43
    or = schema.parameter('or');
    % 44 46
    % 45 46
    or.description = 'Converter orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 49 51
    % 50 51
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate into the chamber (m^3/s)';
    % 53 54
    var_int_pr = schema.local_variable('pressure');
    var_int_pr.description = 'Pressure at the inlet (Pa)';
    % 56 57
    var_int_T = schema.local_variable('torque');
    var_int_T.description = 'Output torque (N*m)';
    % 59 60
    var_int_w = schema.local_variable('ang_velocity');
    var_int_w.description = 'Shaft angular velocity (rad/s)';
    % 62 63
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 65 66
    schema.setup(@setup);
    % 67 68
end % function
function setup(root, conv_rot)
    % 70 73
    % 71 73
    % 72 73
    conv_rot.branch_across('w_s', conv_rot.S.w, conv_rot.C.w);
    conv_rot.branch_through('t_s', conv_rot.S.t, conv_rot.C.t);
    % 75 76
    conv_rot.branch_across('p', conv_rot.A.p, []);
    conv_rot.branch_through('q', conv_rot.A.q, []);
    % 78 81
    % 79 81
    % 80 81
    conv_rot.parameter('x_D', conv_rot.D.check('>', 0.0));
    x_or = conv_rot.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    conv_rot.parameter('x_or', x_or);
    % 87 89
    % 88 89
    conv_rot.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 90 91
    conv_rot.equation(@equation);
end % function
function e = equation(sys, conv_rot)
    % 94 96
    % 95 96
    e = sys.equation;
    % 97 101
    % 98 101
    % 99 101
    % 100 101
    D = conv_rot.x_D;
    or = conv_rot.x_or;
    % 103 105
    % 104 105
    pressure = conv_rot.p;
    ang_vel = conv_rot.w_s;
    torque = mtimes(mtimes(D, pressure), or);
    flow_rate = mtimes(mtimes(D, ang_vel), or);
    power = mtimes(torque, ang_vel);
    % 110 111
    torque = mtimes(torque, conv_rot.adjust_torque_unit);
    % 112 114
    % 113 114
    e(1.0) = plus(conv_rot.t_s, torque);
    e(2.0) = minus(conv_rot.q, flow_rate);
    % 116 117
end % function
