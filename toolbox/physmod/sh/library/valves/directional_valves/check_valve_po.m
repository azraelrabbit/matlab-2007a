function check_valve_po(root, schema)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    schema.descriptor = 'Pilot-Operated Check Valve';
    % 23 26
    % 24 26
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 29 31
    X = schema.terminal('X');
    X.description = 'Pilot port';
    X.domain = root.fl.hydraulic.hydraulic;
    X.location = {'Left';[0.75]};
    % 34 36
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 39 42
    % 40 42
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 45 47
    pres_crack = schema.parameter('pres_crack');
    pres_crack.description = 'Cracking pressure';
    pres_crack.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_crack.default = 30000.0;
    % 50 52
    pres_max = schema.parameter('pres_max');
    pres_max.description = 'Maximum opening pressure';
    pres_max.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_max.default = 120000.0;
    % 55 57
    p_ratio = schema.parameter('p_ratio');
    p_ratio.description = 'Pilot ratio';
    p_ratio.type = ne_type('real', [1.0 1.0], '1');
    p_ratio.default = 5.0;
    % 60 62
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 65 67
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 70 72
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 75 79
    % 76 79
    % 77 79
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3/s)';
    % 80 82
    var_int_p = schema.local_variable('pr_drop');
    var_int_p.description = 'Pressure differential across the valve (Pa)';
    % 83 85
    var_int_pl = schema.local_variable('pr_pilot');
    var_int_pl.description = 'Pilot pressure (Pa)';
    % 86 88
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Hydraulic loss power (W)';
    % 89 91
    var_int_p = schema.local_variable('area');
    var_int_p.description = 'Instantaneous passage area (m^2)';
    % 92 94
    var_int_p = schema.local_variable('Re');
    var_int_p.description = 'Reynolds number';
    % 95 97
    schema.setup(@setup);
    % 97 99
end % function
function setup(root, check_vlv)
    % 100 104
    % 101 104
    % 102 104
    check_vlv.branch_across('p_m', check_vlv.A.p, check_vlv.B.p);
    check_vlv.branch_through('q_m', check_vlv.A.q, check_vlv.B.q);
    % 105 107
    check_vlv.branch_across('p_p', check_vlv.X.p, []);
    check_vlv.branch_through('q_p', check_vlv.X.q, []);
    % 108 111
    % 109 111
    check_vlv.parameter('x_area_max', check_vlv.area_max.check('>', 0.0));
    x_pres_crack = check_vlv.pres_crack.check('>', 0.0);
    check_vlv.parameter('x_pres_crack', x_pres_crack);
    check_vlv.parameter('x_pres_max', check_vlv.pres_max.check('>', x_pres_crack));
    check_vlv.parameter('x_C_d', check_vlv.C_d.check('>', 0.0, check_vlv.C_d.default));
    % 115 117
    check_vlv.parameter('x_p_ratio', check_vlv.p_ratio.check('>', 0.0));
    check_vlv.parameter('x_Re_cr', check_vlv.Re_cr.check('>', 0.0, check_vlv.Re_cr.default));
    % 118 120
    check_vlv.parameter('x_A_leak', check_vlv.A_leak.check('>=', 0.0, check_vlv.A_leak.default));
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    C_d_lam = mrdivide(mpower(check_vlv.C_d, 2.0), check_vlv.Re_cr);
    % 125 127
    gain = mrdivide(minus(check_vlv.area_max, check_vlv.A_leak), minus(check_vlv.pres_max, check_vlv.pres_crack));
    % 127 129
    check_vlv.parameter('C_d_lam', C_d_lam);
    check_vlv.parameter('gain', gain);
    % 130 132
    check_vlv.parameter('density', check_vlv.A.density);
    check_vlv.parameter('viscosity_kin', check_vlv.A.viscosity_kin);
    % 133 135
    check_vlv.equation(@equation);
end % function
function e = equation(sys, check_vlv)
    % 137 140
    % 138 140
    e = sys.equation;
    % 140 143
    % 141 143
    area_max = check_vlv.x_area_max;
    pres_crack = check_vlv.x_pres_crack;
    pres_max = check_vlv.x_pres_max;
    p_ratio = check_vlv.x_p_ratio;
    Re_cr = check_vlv.x_Re_cr;
    A_leak = check_vlv.x_A_leak;
    density = check_vlv.density;
    viscosity_kin = check_vlv.viscosity_kin;
    C_d = check_vlv.x_C_d;
    C_d_lam = check_vlv.C_d_lam;
    gain = check_vlv.gain;
    % 153 155
    pr_drop = check_vlv.p_m;
    pr_pilot = check_vlv.p_p;
    pr_e = plus(pr_drop, mtimes(p_ratio, pr_pilot));
    % 157 159
    if le(pr_e, pres_crack)
        area = A_leak;
    else
        if lt(pr_e, pres_max)
            area = plus(A_leak, mtimes(gain, minus(pr_e, pres_crack)));
        else
            area = area_max;
        end % if
    end % if
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 168 170
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(neabs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_drop))));
    end % if
    % 175 177
    power = mtimes(pr_drop, flow_rate);
    % 177 179
    e(1.0) = minus(check_vlv.q_m, flow_rate);
    e(2.0) = check_vlv.q_p;
    % 180 182
end % function
