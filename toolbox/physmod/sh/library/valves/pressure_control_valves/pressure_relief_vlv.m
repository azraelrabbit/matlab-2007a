function pressure_relief_vlv(root, schema)
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
    schema.descriptor = 'Pressure Relief Valve';
    % 21 24
    % 22 24
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.5]};
    % 27 29
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Bottom';[0.5]};
    % 32 35
    % 33 35
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 38 40
    pres_set = schema.parameter('pres_set');
    pres_set.description = 'Valve pressure setting';
    pres_set.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_set.default = 5e+06;
    % 43 45
    reg_range = schema.parameter('reg_range');
    reg_range.description = 'Valve regulation range';
    reg_range.type = ne_type('real', [1.0 1.0], 'Pa');
    reg_range.default = 500000.0;
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
function setup(root, pr_relief)
    % 85 89
    % 86 89
    % 87 89
    pr_relief.branch_across('p', pr_relief.A.p, pr_relief.B.p);
    % 89 91
    pr_relief.branch_through('q', pr_relief.A.q, pr_relief.B.q);
    % 91 95
    % 92 95
    % 93 95
    pr_relief.parameter('x_area_max', pr_relief.area_max.check('>', 0.0));
    pr_relief.parameter('x_pres_set', pr_relief.pres_set.check('>', 0.0));
    pr_relief.parameter('x_reg_range', pr_relief.reg_range.check('>', 0.0));
    pr_relief.parameter('x_C_d', pr_relief.C_d.check('>', 0.0, pr_relief.C_d.default));
    % 98 100
    pr_relief.parameter('x_Re_cr', pr_relief.Re_cr.check('>', 0.0, pr_relief.Re_cr.default));
    % 100 102
    pr_relief.parameter('x_A_leak', pr_relief.A_leak.check('>=', 0.0, pr_relief.A_leak.default));
    % 102 105
    % 103 105
    pr_relief.parameter('density', pr_relief.A.density);
    pr_relief.parameter('viscosity_kin', pr_relief.A.viscosity_kin);
    % 106 110
    % 107 110
    % 108 110
    C_d_lam = mrdivide(mtimes(pr_relief.C_d, pr_relief.C_d), pr_relief.Re_cr);
    gain = mrdivide(minus(pr_relief.area_max, pr_relief.A_leak), pr_relief.reg_range);
    % 111 113
    pr_max = plus(pr_relief.pres_set, pr_relief.reg_range);
    % 113 115
    pr_relief.parameter('C_d_lam', C_d_lam);
    pr_relief.parameter('gain', gain);
    pr_relief.parameter('pr_max', pr_max);
    % 117 119
    pr_relief.equation(@equation);
end % function
function e = equation(sys, pr_relief)
    % 121 124
    % 122 124
    e = sys.equation;
    % 124 127
    % 125 127
    area_max = pr_relief.x_area_max;
    pres_set = pr_relief.x_pres_set;
    reg_range = pr_relief.x_reg_range;
    Re_cr = pr_relief.x_Re_cr;
    C_d = pr_relief.x_C_d;
    A_leak = pr_relief.x_A_leak;
    % 132 134
    density = pr_relief.density;
    viscosity_kin = pr_relief.viscosity_kin;
    % 135 139
    % 136 139
    % 137 139
    C_d_lam = pr_relief.C_d_lam;
    gain = pr_relief.gain;
    % 140 142
    pr_max = pr_relief.pr_max;
    % 142 144
    pr_drop = pr_relief.p;
    % 144 146
    if le(pr_drop, pres_set)
        area = A_leak;
    else
        if lt(pr_drop, pr_max)
            area = plus(A_leak, mtimes(gain, minus(pr_drop, pres_set)));
        else
            area = area_max;
        end % if
    end % if
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(neabs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_drop))));
    end % if
    % 161 163
    power = mtimes(pr_drop, flow_rate);
    % 163 165
    e(1.0) = minus(pr_relief.q, flow_rate);
    % 165 167
end % function
