function friction_rot(root, schema)
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
    schema.descriptor = 'Rotational Friction';
    % 19 22
    % 20 22
    R = schema.terminal('R');
    R.description = 'Friction rod';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Left';[0.5]};
    % 25 27
    C = schema.terminal('C');
    C.description = 'Friction case';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.5]};
    % 30 33
    % 31 33
    brkwy_trq = schema.parameter('brkwy_trq');
    brkwy_trq.description = 'Breakaway friction torque';
    brkwy_trq.type = ne_type('real', [1.0 1.0], 'N*m');
    brkwy_trq.default = 25.0;
    % 36 38
    Col_trq = schema.parameter('Col_trq');
    Col_trq.description = 'Coulomb friction torque';
    Col_trq.type = ne_type('real', [1.0 1.0], 'N*m');
    Col_trq.default = 20.0;
    % 41 43
    visc_coef = schema.parameter('visc_coef');
    visc_coef.description = 'Viscous friction coefficient';
    visc_coef.type = ne_type('real', [1.0 1.0], 'N*m*s/rad');
    visc_coef.default = .001;
    % 46 48
    trans_coef = schema.parameter('trans_coef');
    trans_coef.description = 'Transition approximation coefficient';
    trans_coef.type = ne_type('real', [1.0 1.0], 's/rad');
    trans_coef.default = 10.0;
    % 51 53
    vel_thr = schema.parameter('vel_thr');
    vel_thr.description = 'Linear region velocity threshold';
    vel_thr.type = ne_type('real', [1.0 1.0], 'rad/s');
    vel_thr.default = .0001;
    % 56 59
    % 57 59
    var_int_f = schema.local_variable('friction_torque');
    var_int_f.description = 'Friction torque (N*m)';
    % 60 62
    var_int_v = schema.local_variable('rel_velocity');
    var_int_v.description = 'Relative velocity (rad/s)';
    % 63 65
    var_int_p = schema.local_variable('power');
    var_int_p.description = 'Power (W)';
    % 66 68
    schema.setup(@setup);
    % 68 70
end % function
function setup(root, fr_rot)
    % 71 75
    % 72 75
    % 73 75
    fr_rot.branch_across('w', fr_rot.R.w, fr_rot.C.w);
    fr_rot.branch_through('t', fr_rot.R.t, fr_rot.C.t);
    % 76 79
    % 77 79
    fr_rot.parameter('x_brkwy_trq', fr_rot.brkwy_trq.check('>', 0.0));
    fr_rot.parameter('x_Col_trq', fr_rot.Col_trq.check('>', 0.0).check('<=', fr_rot.brkwy_trq, fr_rot.brkwy_trq));
    % 80 83
    % 81 83
    fr_rot.parameter('x_visc_coef', fr_rot.visc_coef.check('>=', 0.0, fr_rot.visc_coef.default));
    % 83 85
    fr_rot.parameter('x_trans_coef', fr_rot.trans_coef.check('>', 0.0));
    fr_rot.parameter('x_vel_thr', fr_rot.vel_thr.check('>', 0.0));
    % 86 88
    fr_rot.equation(@equation);
end % function
function e = equation(sys, fr_rot)
    % 90 93
    % 91 93
    e = sys.equation;
    % 93 96
    % 94 96
    brkwy_trq = fr_rot.x_brkwy_trq;
    Col_trq = fr_rot.x_Col_trq;
    visc_coef = fr_rot.x_visc_coef;
    trans_coef = fr_rot.x_trans_coef;
    vel_thr = fr_rot.x_vel_thr;
    % 100 104
    % 101 104
    % 102 104
    brkwy_trq_th = plus(plus(mtimes(visc_coef, vel_thr), Col_trq), mtimes(minus(brkwy_trq, Col_trq), exp(mtimes(uminus(trans_coef), vel_thr))));
    % 104 106
    gain = mrdivide(brkwy_trq_th, vel_thr);
    % 106 108
    rel_velocity = fr_rot.w;
    % 108 110
    if le(abs(rel_velocity), vel_thr)
        % 110 112
        friction_torque = mtimes(gain, rel_velocity);
    else
        if gt(rel_velocity, 0.0)
            friction_torque = plus(plus(mtimes(visc_coef, rel_velocity), Col_trq), mtimes(minus(brkwy_trq, Col_trq), exp(mtimes(uminus(trans_coef), rel_velocity))));
        else
            friction_torque = minus(minus(mtimes(visc_coef, rel_velocity), Col_trq), mtimes(minus(brkwy_trq, Col_trq), exp(mtimes(uminus(trans_coef), abs(rel_velocity)))));
            % 117 119
        end % if
    end % if
    power = mtimes(rel_velocity, friction_torque);
    e = minus(friction_torque, fr_rot.t);
    % 122 124
end % function
