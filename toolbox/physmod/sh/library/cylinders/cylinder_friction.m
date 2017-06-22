function cylinder_friction(root, schema)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    schema.descriptor = 'Cylinder Friction';
    % 26 29
    % 27 29
    % 28 29
    A = schema.terminal('A');
    A.description = 'Cylinder port';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 33 34
    C = schema.terminal('C');
    C.description = 'Cylinder case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Left';[0.75]};
    % 38 39
    B = schema.terminal('B');
    B.description = 'Cylinder port';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.25]};
    % 43 44
    R = schema.terminal('R');
    R.description = 'Cylinder rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Right',[0.75]};
    % 48 50
    % 49 50
    pr_frc = schema.parameter('frc_preload');
    pr_frc.description = 'Preload force';
    pr_frc.type = ne_type('real', [1.0 1.0], 'N');
    pr_frc.default = 10.0;
    % 54 55
    fr_coef = schema.parameter('fr_coef');
    fr_coef.description = 'Coulomb friction force coefficient';
    fr_coef.type = ne_type('real', [1.0 1.0], 'N/Pa');
    fr_coef.default = 1e-06;
    % 59 60
    brkwy_cnt = schema.parameter('frc_brkwy_coef');
    brkwy_cnt.description = 'Breakaway friction increase coefficient';
    brkwy_cnt.type = ne_type('real', [1.0 1.0], '1');
    brkwy_cnt.default = 1.0;
    % 64 65
    visc_coef = schema.parameter('visc_coef');
    visc_coef.description = 'Viscous friction coefficient';
    visc_coef.type = ne_type('real', [1.0 1.0], 'N*s/m');
    visc_coef.default = 100.0;
    % 69 70
    trans_coef = schema.parameter('trans_coef');
    trans_coef.description = 'Transition approximation coefficient';
    trans_coef.type = ne_type('real', [1.0 1.0], 's/m');
    trans_coef.default = 10.0;
    % 74 75
    vel_thr = schema.parameter('vel_thr');
    vel_thr.description = 'Linear region velocity threshold';
    vel_thr.type = ne_type('real', [1.0 1.0], 'm/s');
    vel_thr.default = .0001;
    % 79 81
    % 80 81
    var_int_f = schema.local_variable('friction_force');
    var_int_f.description = 'Friction force (N)';
    % 83 84
    var_int_v = schema.local_variable('rel_velocity');
    var_int_v.description = 'Relative velocity (m/s)';
    % 86 87
    var_int_p = schema.local_variable('power');
    var_int_p.description = 'Power (W)';
    % 89 90
    schema.setup(@setup);
    % 91 92
end % function
function setup(root, cyl_fr)
    % 94 96
    % 95 96
    cyl_fr.branch_across('pA', cyl_fr.A.p, []);
    cyl_fr.branch_through('qA', cyl_fr.A.q, []);
    cyl_fr.branch_across('pB', cyl_fr.B.p, []);
    cyl_fr.branch_through('qB', cyl_fr.B.q, []);
    % 100 101
    cyl_fr.branch_across('v', cyl_fr.R.v, cyl_fr.C.v);
    cyl_fr.branch_through('f', cyl_fr.R.f, cyl_fr.C.f);
    % 103 105
    % 104 105
    cyl_fr.parameter('x_frc_preload', cyl_fr.frc_preload.check('>=', 0.0));
    cyl_fr.parameter('x_fr_coef', cyl_fr.fr_coef.check('>=', 0.0));
    cyl_fr.parameter('x_frc_brkwy_coef', cyl_fr.frc_brkwy_coef.check('>=', 1.0));
    cyl_fr.parameter('x_visc_coef', cyl_fr.visc_coef.check('>=', 0.0, cyl_fr.visc_coef.default));
    % 109 110
    cyl_fr.parameter('x_trans_coef', cyl_fr.trans_coef.check('>', 0.0));
    cyl_fr.parameter('x_vel_thr', cyl_fr.vel_thr.check('>', 0.0));
    % 112 113
    cyl_fr.parameter('pr_zero', {[0.0],'Pa'});
    % 114 115
    cyl_fr.equation(@equation);
end % function
function e = equation(sys, cyl_fr)
    % 118 120
    % 119 120
    e = sys.equation;
    % 121 123
    % 122 123
    frc_preload = cyl_fr.x_frc_preload;
    fr_coef = cyl_fr.x_fr_coef;
    brkwy_coef = cyl_fr.x_frc_brkwy_coef;
    visc_coef = cyl_fr.x_visc_coef;
    trans_coef = cyl_fr.x_trans_coef;
    vel_thr = cyl_fr.x_vel_thr;
    % 129 130
    if le(cyl_fr.pA, 0.0)
        pr_A = cyl_fr.pr_zero;
    else
        pr_A = cyl_fr.pA;
    end % if
    % 135 136
    if le(cyl_fr.pB, 0.0)
        pr_B = cyl_fr.pr_zero;
    else
        pr_B = cyl_fr.pB;
    end % if
    % 141 142
    frc_coulomb = plus(frc_preload, mtimes(fr_coef, plus(pr_A, pr_B)));
    % 143 145
    % 144 145
    frc_brkwy = plus(mtimes(visc_coef, vel_thr), mtimes(frc_coulomb, plus(1.0, mtimes(minus(brkwy_coef, 1.0), exp(mtimes(uminus(trans_coef), vel_thr))))));
    % 146 147
    gain = mrdivide(frc_brkwy, vel_thr);
    % 148 149
    rel_velocity = cyl_fr.v;
    % 150 151
    if le(abs(rel_velocity), vel_thr)
        % 152 153
        friction_force = mtimes(gain, rel_velocity);
    else
        % 155 156
        friction_force = plus(mtimes(visc_coef, rel_velocity), mtimes(mtimes(frc_coulomb, plus(1.0, mtimes(minus(brkwy_coef, 1.0), exp(mtimes(uminus(trans_coef), neabs(rel_velocity)))))), sign(rel_velocity)));
        % 157 159
        % 158 159
    end % if
    power = mtimes(rel_velocity, friction_force);
    % 161 162
    e(1.0) = minus(friction_force, cyl_fr.f);
    e(2.0) = cyl_fr.qA;
    e(3.0) = cyl_fr.qB;
    % 165 166
end % function
