function shuttle_valve(root, schema)
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
    schema.descriptor = 'Shuttle Valve';
    % 21 24
    % 22 24
    A1 = schema.terminal('A1');
    A1.description = 'Valve inlet A';
    A1.domain = root.fl.hydraulic.hydraulic;
    A1.location = {'Bottom';[0.25]};
    % 27 29
    A = schema.terminal('A');
    A.description = 'Valve inlet A1';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Bottom';[0.75]};
    % 32 34
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Top';[0.5]};
    % 37 40
    % 38 40
    area_max = schema.parameter('area_max');
    area_max.description = 'Maximum passage area';
    area_max.type = ne_type('real', [1.0 1.0], 'm^2');
    area_max.default = .0001;
    % 43 45
    pres_crack = schema.parameter('pres_crack');
    pres_crack.description = 'Cracking pressure';
    pres_crack.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_crack.default = -10000.0;
    % 48 50
    pres_op = schema.parameter('pres_op');
    pres_op.description = 'Opening pressure';
    pres_op.type = ne_type('real', [1.0 1.0], 'Pa');
    pres_op.default = 10000.0;
    % 53 55
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 58 60
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 63 65
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 68 72
    % 69 72
    % 70 72
    var_int_q = schema.local_variable('flow_rate_A_B');
    var_int_q.description = 'Flow rate in A-B path (m^3/s)';
    % 73 75
    var_int_q1 = schema.local_variable('flow_rate_A1_B');
    var_int_q1.description = 'Flow rate in A1-B path (m^3/s)';
    % 76 78
    var_int_p = schema.local_variable('pr_drop_A_B');
    var_int_p.description = 'Pressure differential across A-B ports (Pa)';
    % 79 81
    var_int_p1 = schema.local_variable('pr_drop_A1_B');
    var_int_p1.description = 'Pressure differential across A1-B ports (Pa)';
    % 82 84
    var_int_p2 = schema.local_variable('pr_control');
    var_int_p2.description = 'Control pressure differential (Pa)';
    % 85 87
    var_int_w = schema.local_variable('power_A_B');
    var_int_w.description = 'Hydraulic loss power in A-B path (W)';
    % 88 90
    var_int_w1 = schema.local_variable('power_A1_B');
    var_int_w1.description = 'Hydraulic loss power in A1-B path (W)';
    % 91 93
    var_int_a = schema.local_variable('area_A_B');
    var_int_a.description = 'Instantaneous passage A-B area (m^2)';
    % 94 96
    var_int_a1 = schema.local_variable('area_A1_B');
    var_int_a1.description = 'Instantaneous passage A1-B area (m^2)';
    % 97 99
    var_int_re = schema.local_variable('Re');
    var_int_re.description = 'Reynolds number';
    % 100 102
    schema.setup(@setup);
    % 102 104
end % function
function setup(root, shuttle_vlv)
    % 105 109
    % 106 109
    % 107 109
    shuttle_vlv.branch_across('p', shuttle_vlv.A.p, shuttle_vlv.B.p);
    shuttle_vlv.branch_through('q', shuttle_vlv.A.q, shuttle_vlv.B.q);
    % 110 112
    shuttle_vlv.branch_across('p1', shuttle_vlv.A1.p, shuttle_vlv.B.p);
    shuttle_vlv.branch_through('q1', shuttle_vlv.A1.q, shuttle_vlv.B.q);
    % 113 115
    shuttle_vlv.branch_across('pc', shuttle_vlv.A.p, shuttle_vlv.A1.p);
    shuttle_vlv.branch_through('qc', shuttle_vlv.A.q, shuttle_vlv.A1.q);
    % 116 120
    % 117 120
    % 118 120
    shuttle_vlv.parameter('x_area_max', shuttle_vlv.area_max.check('>', 0.0));
    shuttle_vlv.parameter('x_pres_crack', shuttle_vlv.pres_crack.check('<=', 0.0));
    % 121 123
    shuttle_vlv.parameter('x_pres_op', shuttle_vlv.pres_op.check('>', 0.0, shuttle_vlv.pres_crack.default));
    % 123 125
    shuttle_vlv.parameter('x_C_d', shuttle_vlv.C_d.check('>', 0.0, shuttle_vlv.C_d.default));
    % 125 127
    shuttle_vlv.parameter('x_Re_cr', shuttle_vlv.Re_cr.check('>', 0.0, shuttle_vlv.Re_cr.default));
    % 127 129
    shuttle_vlv.parameter('x_A_leak', shuttle_vlv.A_leak.check('>=', 0.0, shuttle_vlv.A_leak.default));
    % 129 132
    % 130 132
    shuttle_vlv.parameter('density', shuttle_vlv.A.density);
    shuttle_vlv.parameter('viscosity_kin', shuttle_vlv.A.viscosity_kin);
    % 133 137
    % 134 137
    % 135 137
    C_d_lam = mrdivide(mtimes(shuttle_vlv.C_d, shuttle_vlv.C_d), shuttle_vlv.Re_cr);
    % 137 139
    gain = mrdivide(minus(shuttle_vlv.area_max, shuttle_vlv.A_leak), shuttle_vlv.pres_op);
    % 139 142
    % 140 142
    shuttle_vlv.parameter('C_d_lam', C_d_lam);
    shuttle_vlv.parameter('gain', gain);
    % 143 145
    shuttle_vlv.equation(@equation);
end % function
function e = equation(sys, shuttle_vlv)
    % 147 150
    % 148 150
    e = sys.equation;
    % 150 153
    % 151 153
    area_max = shuttle_vlv.x_area_max;
    pres_crack = shuttle_vlv.x_pres_crack;
    pres_op = shuttle_vlv.x_pres_op;
    Re_cr = shuttle_vlv.x_Re_cr;
    area_leak = shuttle_vlv.x_A_leak;
    density = shuttle_vlv.density;
    viscosity_kin = shuttle_vlv.viscosity_kin;
    C_d = shuttle_vlv.x_C_d;
    C_d_lam = shuttle_vlv.C_d_lam;
    gain = shuttle_vlv.gain;
    % 162 164
    pr_control = shuttle_vlv.pc;
    pr_drop_A_B = shuttle_vlv.p;
    pr_drop_A1_B = shuttle_vlv.p1;
    % 166 169
    % 167 169
    if le(pr_control, pres_crack)
        area_A_B = area_leak;
        area_A1_B = area_max;
    else
        if gt(pr_control, plus(pres_crack, pres_op))
            area_A_B = area_max;
            area_A1_B = area_leak;
        else
            area_A_B = plus(area_leak, mtimes(gain, minus(pr_control, pres_crack)));
            area_A1_B = minus(area_max, mtimes(gain, minus(pr_control, pres_crack)));
        end % if
    end % if
    D_h_A = sqrt(mrdivide(mtimes(4.0, area_A_B), 3.141592653589793));
    D_h_A1 = sqrt(mrdivide(mtimes(4.0, area_A1_B), 3.141592653589793));
    % 182 184
    flow_rate_A_B = ne_flow_rate(area_A_B, pr_drop_A_B, C_d, C_d_lam, D_h_A, viscosity_kin, density);
    % 184 187
    % 185 187
    flow_rate_A1_B = ne_flow_rate(area_A1_B, pr_drop_A1_B, C_d, C_d_lam, D_h_A1, viscosity_kin, density);
    % 187 190
    % 188 190
    power_A_B = mtimes(pr_drop_A_B, flow_rate_A_B);
    power_A1_B = mtimes(pr_drop_A1_B, flow_rate_A1_B);
    % 191 193
    e(1.0) = minus(shuttle_vlv.q, flow_rate_A_B);
    e(2.0) = minus(shuttle_vlv.q1, flow_rate_A1_B);
    e(3.0) = shuttle_vlv.qc;
end % function
