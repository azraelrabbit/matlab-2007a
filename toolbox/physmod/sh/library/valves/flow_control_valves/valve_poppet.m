function valve_poppet(root, schema)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    schema.descriptor = 'Poppet Valve';
    % 20 23
    % 21 23
    S = schema.input('S');
    S.description = 'Poppet control terminal';
    S.location = {'Left';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 26 28
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 31 33
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 36 40
    % 37 40
    % 38 40
    d_stem = schema.parameter('d_stem');
    d_stem.description = 'Valve stem diameter';
    d_stem.type = ne_type('real', [1.0 1.0], 'm');
    d_stem.default = .01;
    % 43 45
    cone_angle = schema.parameter('cone_angle');
    cone_angle.description = 'Seat cone angle';
    cone_angle.type = ne_type('real', [1.0 1.0], 'deg');
    cone_angle.default = 120.0;
    % 48 50
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 53 55
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .65;
    % 58 60
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 10.0;
    % 63 65
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 68 71
    % 69 71
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3/s)';
    % 72 74
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the valve (Pa)';
    % 75 77
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 78 80
    var_int_b = schema.local_variable('orif_opening');
    var_int_b.description = 'Valve opening (m)';
    % 81 83
    var_int_a = schema.local_variable('area');
    var_int_a.description = 'Valve passage area (m^2)';
    % 84 86
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the valve (W)';
    % 87 89
    schema.setup(@setup);
    % 89 91
end % function
function setup(root, poppet_vlv)
    % 92 95
    % 93 95
    poppet_vlv.branch_across('p', poppet_vlv.A.p, poppet_vlv.B.p);
    poppet_vlv.branch_through('q', poppet_vlv.A.q, poppet_vlv.B.q);
    % 96 99
    % 97 99
    poppet_vlv.parameter('x_d_stem', poppet_vlv.d_stem.check('>', 0.0));
    poppet_vlv.parameter('x_cone_angle', poppet_vlv.cone_angle.check('>', 0.0).check('<=', 180.0));
    % 100 102
    poppet_vlv.parameter('x_x_0', poppet_vlv.x_0.check('>=', 0.0));
    % 102 104
    poppet_vlv.parameter('x_C_d', poppet_vlv.C_d.check('>', 0.0, poppet_vlv.C_d.default));
    % 104 106
    poppet_vlv.parameter('x_Re_cr', poppet_vlv.Re_cr.check('>', 0.0, poppet_vlv.Re_cr.default));
    % 106 108
    poppet_vlv.parameter('x_A_leak', poppet_vlv.A_leak.check('>=', 0.0, poppet_vlv.A_leak.default));
    % 108 111
    % 109 111
    poppet_vlv.parameter('density', poppet_vlv.A.density);
    poppet_vlv.parameter('viscosity_kin', poppet_vlv.A.viscosity_kin);
    % 112 114
    poppet_vlv.equation(@equation);
end % function
function e = equation(sys, poppet_vlv)
    % 116 119
    % 117 119
    e = sys.equation;
    % 119 122
    % 120 122
    C_d = poppet_vlv.x_C_d;
    x_0 = poppet_vlv.x_x_0;
    Re_cr = poppet_vlv.x_Re_cr;
    A_leak = poppet_vlv.x_A_leak;
    d_stem = poppet_vlv.x_d_stem;
    density = poppet_vlv.density;
    viscosity_kin = poppet_vlv.viscosity_kin;
    % 128 132
    % 129 132
    % 130 132
    area_max = mrdivide(mtimes(3.141592653589793, mpower(poppet_vlv.x_d_stem, 2.0)), 4.0);
    % 132 134
    D_h_min = sqrt(mrdivide(mtimes(4.0, poppet_vlv.x_A_leak), 3.141592653589793));
    % 134 136
    C_d_lam = mrdivide(mpower(C_d, 2.0), Re_cr);
    % 136 138
    half_ang = mrdivide(poppet_vlv.x_cone_angle, 2.0);
    % 138 140
    a_1 = mtimes(mtimes(3.141592653589793, poppet_vlv.x_d_stem), sin(half_ang));
    a_2 = mtimes(mtimes(3.141592653589793, mpower(sin(half_ang), 2.0)), cos(half_ang));
    % 141 143
    open_max = mrdivide(mrdivide(plus(uminus(a_1), sqrt(plus(mpower(a_1, 2.0), mtimes(mtimes(4.0, a_2), area_max)))), 2.0), a_2);
    % 143 147
    % 144 147
    % 145 147
    pr_drop = poppet_vlv.p;
    cnt_memb = poppet_vlv.S;
    % 148 150
    orif_opening = plus(x_0, cnt_memb);
    % 150 152
    if le(orif_opening, 0.0)
        area = A_leak;
        D_h = D_h_min;
    else
        if gt(orif_opening, open_max)
            area = plus(area_max, A_leak);
            D_h = plus(d_stem, D_h_min);
        else
            area = plus(plus(mtimes(a_1, orif_opening), mtimes(a_2, mpower(orif_opening, 2.0))), A_leak);
            D_h = plus(mtimes(mtimes(4.0, orif_opening), sin(half_ang)), D_h_min);
        end % if
    end % if
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(abs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        % 167 169
        flow_rate = mtimes(mtimes(mtimes(sign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), abs(pr_drop))));
    end % if
    % 170 172
    power = mtimes(pr_drop, flow_rate);
    % 172 174
    e(1.0) = minus(poppet_vlv.q, flow_rate);
end % function
