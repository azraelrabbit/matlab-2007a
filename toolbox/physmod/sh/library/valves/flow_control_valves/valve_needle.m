function valve_needle(root, schema)
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
    schema.descriptor = 'Needle Valve';
    % 20 23
    % 21 23
    S = schema.input('S');
    S.description = 'Needle control terminal';
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
    d_orif = schema.parameter('d_orif');
    d_orif.description = 'Valve orifice diameter';
    d_orif.type = ne_type('real', [1.0 1.0], 'm');
    d_orif.default = .005;
    % 43 45
    cone_angle = schema.parameter('cone_angle');
    cone_angle.description = 'Needle cone angle';
    cone_angle.type = ne_type('real', [1.0 1.0], 'deg');
    cone_angle.default = 90.0;
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
    % 68 70
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3/s)';
    % 71 73
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the valve (Pa)';
    % 74 76
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 77 79
    var_int_b = schema.local_variable('orif_opening');
    var_int_b.description = 'Valve opening (m)';
    % 80 82
    var_int_a = schema.local_variable('area');
    var_int_a.description = 'Valve passage area (m^2)';
    % 83 85
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the valve (W)';
    % 86 88
    schema.setup(@setup);
    % 88 90
end % function
function setup(root, needle_vlv)
    % 91 94
    % 92 94
    needle_vlv.branch_across('p', needle_vlv.A.p, needle_vlv.B.p);
    needle_vlv.branch_through('q', needle_vlv.A.q, needle_vlv.B.q);
    % 95 98
    % 96 98
    needle_vlv.parameter('x_d_orif', needle_vlv.d_orif.check('>', 0.0));
    needle_vlv.parameter('x_cone_angle', needle_vlv.cone_angle.check('>', 0.0).check('<=', 180.0));
    % 99 101
    needle_vlv.parameter('x_x_0', needle_vlv.x_0.check('>=', 0.0));
    needle_vlv.parameter('x_C_d', needle_vlv.C_d.check('>', 0.0, needle_vlv.C_d.default));
    % 102 104
    needle_vlv.parameter('x_Re_cr', needle_vlv.Re_cr.check('>', 0.0, needle_vlv.Re_cr.default));
    % 104 106
    needle_vlv.parameter('x_A_leak', needle_vlv.A_leak.check('>=', 0.0, needle_vlv.A_leak.default));
    % 106 109
    % 107 109
    needle_vlv.parameter('density', needle_vlv.A.density);
    needle_vlv.parameter('viscosity_kin', needle_vlv.A.viscosity_kin);
    % 110 112
    needle_vlv.equation(@equation);
end % function
function e = equation(sys, needle_vlv)
    % 114 117
    % 115 117
    e = sys.equation;
    % 117 120
    % 118 120
    C_d = needle_vlv.x_C_d;
    x_0 = needle_vlv.x_x_0;
    Re_cr = needle_vlv.x_Re_cr;
    A_leak = needle_vlv.x_A_leak;
    d_orif = needle_vlv.x_d_orif;
    density = needle_vlv.density;
    viscosity_kin = needle_vlv.viscosity_kin;
    % 126 130
    % 127 130
    % 128 130
    area_max = mrdivide(mtimes(3.141592653589793, mpower(d_orif, 2.0)), 4.0);
    % 130 132
    D_h_min = sqrt(mrdivide(mtimes(4.0, A_leak), 3.141592653589793));
    % 132 134
    C_d_lam = mrdivide(mpower(C_d, 2.0), Re_cr);
    % 134 136
    half_angle = mrdivide(needle_vlv.x_cone_angle, 2.0);
    % 136 138
    a_1 = mtimes(mtimes(3.141592653589793, d_orif), sin(half_angle));
    a_2 = mtimes(mtimes(3.141592653589793, mpower(sin(half_angle), 2.0)), cos(half_angle));
    % 139 141
    open_max = mrdivide(mrdivide(minus(a_1, sqrt(minus(mpower(a_1, 2.0), mtimes(mtimes(4.0, a_2), area_max)))), 2.0), a_2);
    % 141 144
    % 142 144
    pr_drop = needle_vlv.p;
    cnt_memb = needle_vlv.S;
    % 145 147
    orif_opening = plus(x_0, cnt_memb);
    % 147 149
    if le(orif_opening, 0.0)
        area = A_leak;
        D_h = D_h_min;
    else
        if gt(orif_opening, open_max)
            area = plus(area_max, A_leak);
            D_h = plus(d_orif, D_h_min);
        else
            area = plus(minus(mtimes(a_1, orif_opening), mtimes(a_2, mpower(orif_opening, 2.0))), A_leak);
            D_h = plus(mtimes(mtimes(4.0, orif_opening), sin(half_angle)), D_h_min);
        end % if
        % 159 161
    end % if
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(neabs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        % 165 167
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_drop))));
    end % if
    power = mtimes(pr_drop, flow_rate);
    % 169 171
    e(1.0) = minus(needle_vlv.q, flow_rate);
end % function
