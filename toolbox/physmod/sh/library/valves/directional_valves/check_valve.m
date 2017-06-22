function check_valve(root, schema)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    schema.descriptor = 'Check Valve';
    % 21 24
    % 22 24
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 27 29
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 32 35
    % 33 35
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 38 40
    pres_crack = schema.parameter('pres_crack');
    pres_crack.description = 'Cracking pressure';
    pres_crack.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_crack.default = 30000.0;
    % 43 45
    pres_max = schema.parameter('pres_max');
    pres_max.description = 'Maximum opening pressure';
    pres_max.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_max.default = 120000.0;
    % 48 50
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 53 55
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 58 60
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 63 67
    % 64 67
    % 65 67
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3/s)';
    % 68 70
    var_int_p = schema.local_variable('pr_drop');
    var_int_p.description = 'Pressure differential across the valve (Pa)';
    % 71 73
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Hydraulic loss power (W)';
    % 74 76
    var_int_p = schema.local_variable('area');
    var_int_p.description = 'Instantaneous passage area (m^2)';
    % 77 79
    var_int_p = schema.local_variable('Re');
    var_int_p.description = 'Reynolds number';
    % 80 82
    schema.setup(@setup);
    % 82 84
end % function
function setup(root, check_vlv)
    % 85 89
    % 86 89
    % 87 89
    check_vlv.branch_across('p', check_vlv.A.p, check_vlv.B.p);
    check_vlv.branch_through('q', check_vlv.A.q, check_vlv.B.q);
    % 90 93
    % 91 93
    check_vlv.parameter('x_area_max', check_vlv.area_max.check('>', 0.0));
    x_pres_crack = check_vlv.pres_crack.check('>', 0.0);
    check_vlv.parameter('x_pres_crack', x_pres_crack);
    check_vlv.parameter('x_pres_max', check_vlv.pres_max.check('>', x_pres_crack));
    check_vlv.parameter('x_C_d', check_vlv.C_d.check('>', 0.0, check_vlv.C_d.default));
    % 97 99
    check_vlv.parameter('x_Re_cr', check_vlv.Re_cr.check('>', 0.0, check_vlv.Re_cr.default));
    % 99 101
    check_vlv.parameter('x_A_leak', check_vlv.A_leak.check('>=', 0.0, check_vlv.A_leak.default));
    % 101 104
    % 102 104
    check_vlv.parameter('density', check_vlv.A.density);
    check_vlv.parameter('viscosity_kin', check_vlv.A.viscosity_kin);
    % 105 109
    % 106 109
    % 107 109
    C_d_lam = mrdivide(mpower(check_vlv.C_d, 2.0), check_vlv.Re_cr);
    % 109 111
    gain = mrdivide(minus(check_vlv.area_max, check_vlv.A_leak), minus(check_vlv.pres_max, check_vlv.pres_crack));
    % 111 114
    % 112 114
    check_vlv.parameter('C_d_lam', C_d_lam);
    check_vlv.parameter('gain', gain);
    % 115 117
    check_vlv.equation(@equation);
end % function
function e = equation(sys, check_vlv)
    % 119 122
    % 120 122
    e = sys.equation;
    % 122 125
    % 123 125
    area_max = check_vlv.x_area_max;
    pres_crack = check_vlv.x_pres_crack;
    pres_max = check_vlv.x_pres_max;
    Re_cr = check_vlv.x_Re_cr;
    A_leak = check_vlv.x_A_leak;
    density = check_vlv.density;
    viscosity_kin = check_vlv.viscosity_kin;
    C_d = check_vlv.x_C_d;
    C_d_lam = check_vlv.C_d_lam;
    gain = check_vlv.gain;
    % 134 136
    pr_drop = check_vlv.p;
    % 136 138
    if le(pr_drop, pres_crack)
        area = A_leak;
    else
        if lt(pr_drop, pres_max)
            area = plus(A_leak, mtimes(gain, minus(pr_drop, pres_crack)));
        else
            area = area_max;
        end % if
    end % if
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 147 149
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(neabs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_drop))));
    end % if
    % 154 156
    power = mtimes(pr_drop, flow_rate);
    % 156 158
    e = minus(check_vlv.q, flow_rate);
    % 158 160
end % function
