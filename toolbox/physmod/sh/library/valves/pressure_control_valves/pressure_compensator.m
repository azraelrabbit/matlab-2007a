function pressure_compensator(root, schema)
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
    schema.descriptor = 'Pressure Compensator';
    % 19 22
    % 20 22
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 25 27
    X = schema.terminal('X');
    X.description = 'Valve control port';
    X.domain = root.fl.hydraulic.hydraulic;
    X.location = {'Right';[0.25]};
    % 30 32
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 35 37
    Y = schema.terminal('Y');
    Y.description = 'Valve control port';
    Y.domain = root.fl.hydraulic.hydraulic;
    Y.location = {'Right';[0.75]};
    % 40 43
    % 41 43
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 46 48
    pres_set = schema.parameter('pres_set');
    pres_set.description = 'Valve pressure setting';
    pres_set.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_set.default = 3e+06;
    % 51 53
    reg_range = schema.parameter('reg_range');
    reg_range.description = 'Valve regulation range';
    reg_range.type = ne_type('real', [1.0 1.0], 'Pa');
    reg_range.default = 150000.0;
    % 56 58
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 61 63
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 66 68
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 71 75
    % 72 75
    % 73 75
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3/s)';
    % 76 78
    var_int_pm = schema.local_variable('pr_diff_main');
    var_int_pm.description = 'Pressure differential across the valve (Pa)';
    % 79 81
    var_int_pc = schema.local_variable('pr_diff_control');
    var_int_pc.description = 'Pressure differential at control ports (Pa)';
    % 82 84
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Hydraulic loss power (W)';
    % 85 87
    var_int_p = schema.local_variable('area');
    var_int_p.description = 'Instantaneous passage area (m^2)';
    % 88 90
    var_int_p = schema.local_variable('Re');
    var_int_p.description = 'Reynolds number';
    % 91 93
    schema.setup(@setup);
    % 93 95
end % function
function setup(root, pr_comp)
    % 96 100
    % 97 100
    % 98 100
    pr_comp.branch_across('p_m', pr_comp.A.p, pr_comp.B.p);
    pr_comp.branch_through('q_m', pr_comp.A.q, pr_comp.B.q);
    % 101 103
    pr_comp.branch_across('p_c', pr_comp.X.p, pr_comp.Y.p);
    pr_comp.branch_through('q_c', pr_comp.X.q, pr_comp.Y.q);
    % 104 107
    % 105 107
    pr_comp.parameter('x_area_max', pr_comp.area_max.check('>', 0.0));
    pr_comp.parameter('x_pres_set', pr_comp.pres_set.check('>', 0.0));
    pr_comp.parameter('x_reg_range', pr_comp.reg_range.check('>', 0.0));
    pr_comp.parameter('x_C_d', pr_comp.C_d.check('>', 0.0, pr_comp.C_d.default));
    pr_comp.parameter('x_Re_cr', pr_comp.Re_cr.check('>', 0.0, pr_comp.Re_cr.default));
    % 111 113
    pr_comp.parameter('x_A_leak', pr_comp.A_leak.check('>=', 0.0, pr_comp.A_leak.default));
    % 113 118
    % 114 118
    % 115 118
    % 116 118
    C_d_lam = mrdivide(mpower(pr_comp.C_d, 2.0), pr_comp.Re_cr);
    pr_comp.parameter('C_d_lam', C_d_lam);
    % 119 121
    gain = mrdivide(minus(pr_comp.area_max, pr_comp.A_leak), pr_comp.reg_range);
    pr_comp.parameter('gain', gain);
    % 122 124
    pr_max = plus(pr_comp.pres_set, pr_comp.reg_range);
    pr_comp.parameter('pr_max', pr_max);
    % 125 127
    pr_comp.parameter('density', pr_comp.A.density);
    pr_comp.parameter('viscosity_kin', pr_comp.A.viscosity_kin);
    % 128 130
    pr_comp.equation(@equation);
end % function
function e = equation(sys, pr_comp)
    % 132 135
    % 133 135
    e = sys.equation;
    % 135 139
    % 136 139
    % 137 139
    area_max = pr_comp.x_area_max;
    pres_set = pr_comp.x_pres_set;
    reg_range = pr_comp.x_reg_range;
    Re_cr = pr_comp.x_Re_cr;
    A_leak = pr_comp.x_A_leak;
    C_d = pr_comp.x_C_d;
    density = pr_comp.density;
    viscosity_kin = pr_comp.viscosity_kin;
    C_d_lam = pr_comp.C_d_lam;
    gain = pr_comp.gain;
    pr_max = pr_comp.pr_max;
    % 149 152
    % 150 152
    pr_diff_main = pr_comp.p_m;
    pr_diff_control = pr_comp.p_c;
    % 153 155
    if le(pr_diff_control, pres_set)
        area = area_max;
    else
        if lt(pr_diff_control, pr_max)
            area = minus(area_max, mtimes(gain, minus(pr_diff_control, pres_set)));
        else
            area = A_leak;
        end % if
    end % if
    D_h = sqrt(mrdivide(mtimes(4.0, area), 3.141592653589793));
    % 164 166
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    % 166 168
    if lt(neabs(pr_diff_main), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_diff_main), density), viscosity_kin);
    else
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_diff_main), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_diff_main))));
    end % if
    % 172 174
    power = mtimes(pr_diff_main, flow_rate);
    % 174 176
    e(1.0) = minus(pr_comp.q_m, flow_rate);
    e(2.0) = pr_comp.q_c;
    % 177 179
end % function
