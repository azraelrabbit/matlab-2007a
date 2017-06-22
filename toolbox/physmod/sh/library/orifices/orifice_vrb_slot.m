function orifice_vrb_slot(root, schema)
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
    schema.descriptor = 'Orifice with Variable Area Slot';
    % 19 22
    % 20 22
    S = schema.input('S');
    S.description = 'Spool control terminal';
    S.location = {'Left';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 25 27
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 30 32
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 35 38
    % 36 38
    w = schema.parameter('w');
    w.description = 'Orifice width';
    w.type = ne_type('real', [1.0 1.0], 'm');
    w.default = .01;
    % 41 43
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 46 48
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 51 53
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 56 58
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 61 63
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 66 69
    % 67 69
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3)';
    % 70 72
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 73 75
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 76 78
    var_int_b = schema.local_variable('orif_opening');
    var_int_b.description = 'Orifice opening (m)';
    % 79 81
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the orifice (W)';
    % 82 84
    schema.setup(@setup);
    % 84 86
end % function
function setup(root, or_v_slot)
    % 87 90
    % 88 90
    or_v_slot.branch_across('p', or_v_slot.A.p, or_v_slot.B.p);
    or_v_slot.branch_through('q', or_v_slot.A.q, or_v_slot.B.q);
    % 91 94
    % 92 94
    or_v_slot.parameter('x_w', or_v_slot.w.check('>', 0.0));
    or_v_slot.parameter('x_C_d', or_v_slot.C_d.check('>', 0.0, or_v_slot.C_d.default));
    % 95 97
    or_v_slot.parameter('x_Re_cr', or_v_slot.Re_cr.check('>', 0.0, or_v_slot.Re_cr.default));
    % 97 99
    or_v_slot.parameter('x_A_leak', or_v_slot.A_leak.check('>=', 0.0, or_v_slot.A_leak.default));
    % 99 101
    x_or = or_v_slot.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    or_v_slot.parameter('x_or', x_or);
    % 105 107
    or_v_slot.parameter('density', or_v_slot.A.density);
    or_v_slot.parameter('viscosity_kin', or_v_slot.A.viscosity_kin);
    % 108 110
    or_v_slot.equation(@equation);
end % function
function e = equation(sys, or_v_slot)
    % 112 115
    % 113 115
    e = sys.equation;
    % 115 118
    % 116 118
    w = or_v_slot.x_w;
    C_d = or_v_slot.x_C_d;
    x_0 = or_v_slot.x_0;
    or = or_v_slot.x_or;
    Re_cr = or_v_slot.x_Re_cr;
    A_leak = or_v_slot.x_A_leak;
    density = or_v_slot.density;
    viscosity_kin = or_v_slot.viscosity_kin;
    % 125 129
    % 126 129
    % 127 129
    C_d_lam = mrdivide(mpower(or_v_slot.x_C_d, 2.0), or_v_slot.Re_cr);
    % 129 132
    % 130 132
    pr_drop = or_v_slot.p;
    cnt_memb = or_v_slot.S;
    % 133 135
    orif_opening = plus(x_0, mtimes(cnt_memb, or));
    A = mtimes(w, orif_opening);
    % 136 138
    if lt(A, A_leak)
        A = A_leak;
    end % if
    D_h = sqrt(mrdivide(mtimes(4.0, A), 3.141592653589793));
    % 141 144
    % 142 144
    flow_rate = ne_flow_rate(A, pr_drop, C_d, C_d_lam, D_h, viscosity_kin, density);
    % 144 147
    % 145 147
    power = mtimes(pr_drop, flow_rate);
    % 147 149
    e(1.0) = minus(or_v_slot.q, flow_rate);
end % function
