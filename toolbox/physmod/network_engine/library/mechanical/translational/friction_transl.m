function friction_transl(root, schema)
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
    schema.descriptor = 'Translational Friction';
    % 19 22
    % 20 22
    R = schema.terminal('R');
    R.description = 'Friction rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 25 27
    C = schema.terminal('C');
    C.description = 'Friction case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.5]};
    % 30 33
    % 31 33
    brkwy_frc = schema.parameter('brkwy_frc');
    brkwy_frc.description = 'Breakaway friction force';
    brkwy_frc.type = ne_type('real', [1.0 1.0], 'N');
    brkwy_frc.default = 25.0;
    % 36 38
    Col_frc = schema.parameter('Col_frc');
    Col_frc.description = 'Coulomb friction force';
    Col_frc.type = ne_type('real', [1.0 1.0], 'N');
    Col_frc.default = 20.0;
    % 41 43
    visc_coef = schema.parameter('visc_coef');
    visc_coef.description = 'Viscous friction coefficient';
    visc_coef.type = ne_type('real', [1.0 1.0], 'N*s/m');
    visc_coef.default = 100.0;
    % 46 48
    trans_coef = schema.parameter('trans_coef');
    trans_coef.description = 'Transition approximation coefficient';
    trans_coef.type = ne_type('real', [1.0 1.0], 's/m');
    trans_coef.default = 10.0;
    % 51 53
    vel_thr = schema.parameter('vel_thr');
    vel_thr.description = 'Linear region velocity threshold';
    vel_thr.type = ne_type('real', [1.0 1.0], 'm/s');
    vel_thr.default = .0001;
    % 56 59
    % 57 59
    var_int_f = schema.local_variable('friction_force');
    var_int_f.description = 'Friction force (N)';
    % 60 62
    var_int_v = schema.local_variable('rel_velocity');
    var_int_v.description = 'Relative velocity (m/s)';
    % 63 65
    var_int_p = schema.local_variable('power');
    var_int_p.description = 'Power (W)';
    % 66 68
    schema.setup(@setup);
    % 68 70
end % function
function setup(root, fr_transl)
    % 71 74
    % 72 74
    fr_transl.branch_across('v', fr_transl.R.v, fr_transl.C.v);
    fr_transl.branch_through('f', fr_transl.R.f, fr_transl.C.f);
    % 75 78
    % 76 78
    fr_transl.parameter('x_brkwy_frc', fr_transl.brkwy_frc.check('>', 0.0));
    fr_transl.parameter('x_Col_frc', fr_transl.Col_frc.check('>', 0.0).check('<=', fr_transl.brkwy_frc, fr_transl.brkwy_frc));
    % 79 81
    fr_transl.parameter('x_visc_coef', fr_transl.visc_coef.check('>=', 0.0, fr_transl.visc_coef.default));
    fr_transl.parameter('x_trans_coef', fr_transl.trans_coef.check('>', 0.0));
    fr_transl.parameter('x_vel_thr', fr_transl.vel_thr.check('>', 0.0));
    % 83 85
    fr_transl.equation(@equation);
end % function
function e = equation(sys, fr_transl)
    % 87 90
    % 88 90
    e = sys.equation;
    % 90 93
    % 91 93
    brkwy_frc = fr_transl.x_brkwy_frc;
    Col_frc = fr_transl.x_Col_frc;
    visc_coef = fr_transl.x_visc_coef;
    trans_coef = fr_transl.x_trans_coef;
    vel_thr = fr_transl.x_vel_thr;
    % 97 101
    % 98 101
    % 99 101
    brkwy_frc_th = plus(plus(mtimes(visc_coef, vel_thr), Col_frc), mtimes(minus(brkwy_frc, Col_frc), exp(mtimes(uminus(trans_coef), vel_thr))));
    % 101 103
    gain = mrdivide(brkwy_frc_th, vel_thr);
    % 103 106
    % 104 106
    rel_velocity = fr_transl.v;
    % 106 108
    if le(abs(rel_velocity), vel_thr)
        % 108 110
        friction_force = mtimes(gain, rel_velocity);
    else
        if gt(rel_velocity, 0.0)
            friction_force = plus(plus(mtimes(visc_coef, rel_velocity), Col_frc), mtimes(minus(brkwy_frc, Col_frc), exp(mtimes(uminus(trans_coef), rel_velocity))));
        else
            friction_force = minus(minus(mtimes(visc_coef, rel_velocity), Col_frc), mtimes(minus(brkwy_frc, Col_frc), exp(mtimes(uminus(trans_coef), abs(rel_velocity)))));
            % 115 117
        end % if
    end % if
    power = mtimes(rel_velocity, friction_force);
    e = minus(friction_force, fr_transl.f);
    % 120 122
end % function
