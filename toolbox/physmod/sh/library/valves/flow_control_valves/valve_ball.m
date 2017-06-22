function valve_ball(root, schema)
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
    schema.descriptor = 'Ball Valve';
    % 20 23
    % 21 23
    S = schema.input('S');
    S.description = 'Stem control terminal';
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
    % 36 39
    % 37 39
    d_ball = schema.parameter('d_ball');
    d_ball.description = 'Valve ball diameter';
    d_ball.type = ne_type('real', [1.0 1.0], 'm');
    d_ball.default = .01;
    % 42 44
    d_orif = schema.parameter('d_orif');
    d_orif.description = 'Orifice diameter';
    d_orif.type = ne_type('real', [1.0 1.0], 'm');
    d_orif.default = .005;
    % 47 49
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 52 54
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .65;
    % 57 59
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 10.0;
    % 62 64
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 67 70
    % 68 70
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the valve (m^3)';
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
function setup(root, ball_vlv)
    % 91 94
    % 92 94
    ball_vlv.branch_across('p', ball_vlv.A.p, ball_vlv.B.p);
    ball_vlv.branch_through('q', ball_vlv.A.q, ball_vlv.B.q);
    % 95 98
    % 96 98
    x_d_ball = ball_vlv.d_ball.check('>', 0.0);
    ball_vlv.parameter('x_d_ball', x_d_ball);
    x_d_orif = ball_vlv.d_orif.check('>', 0.0).check('<', x_d_ball);
    ball_vlv.parameter('x_d_orif', x_d_orif);
    ball_vlv.parameter('x_x_0', ball_vlv.x_0.check('>=', 0.0));
    ball_vlv.parameter('x_C_d', ball_vlv.C_d.check('>', 0.0, ball_vlv.C_d.default));
    % 103 105
    ball_vlv.parameter('x_Re_cr', ball_vlv.Re_cr.check('>', 0.0, ball_vlv.Re_cr.default));
    % 105 107
    ball_vlv.parameter('x_A_leak', ball_vlv.A_leak.check('>=', 0.0, ball_vlv.A_leak.default));
    % 107 110
    % 108 110
    ball_vlv.parameter('density', ball_vlv.A.density);
    ball_vlv.parameter('viscosity_kin', ball_vlv.A.viscosity_kin);
    % 111 117
    % 112 117
    % 113 117
    % 114 117
    % 115 117
    area_max = mrdivide(mtimes(3.141592653589793, mpower(x_d_orif, 2.0)), 4.0);
    a = mrdivide(mtimes(3.141592653589793, x_d_orif), 2.0);
    b = mrdivide(mpower(x_d_ball, 2.0), 4.0);
    c = mpower(minus(mrdivide(mpower(x_d_ball, 2.0), 4.0), mrdivide(mpower(x_d_orif, 2.0), 4.0)), .5);
    d = mrdivide(mpower(x_d_orif, 2.0), 4.0);
    % 121 123
    a_int = minus(x_d_ball, mrdivide(x_d_orif, 2.0));
    h_max = mrdivide(plus(uminus(a_int), mpower(plus(mpower(a_int, 2.0), mtimes(x_d_ball, x_d_orif)), .5)), 2.0);
    % 124 127
    % 125 127
    disc = 1.0;
    m = 0.0;
    % 128 130
        while gt(disc, 1e-12)
        % 130 132
        b_int = plus(mpower(plus(c, h_max), 2.0), d);
        b_int_incr = plus(mpower(plus(c, mtimes(h_max, 1.00001)), 2.0), d);
        f_x = minus(mtimes(mtimes(a, minus(1.0, mrdivide(b, b_int))), mpower(b_int, .5)), area_max);
        f_x_incr = minus(mtimes(mtimes(a, minus(1.0, mrdivide(b, b_int_incr))), mpower(b_int_incr, .5)), area_max);
        f_x_dot = mrdivide(mrdivide(minus(f_x_incr, f_x), 1e-05), h_max);
        % 136 145
        % 137 145
        % 138 145
        % 139 145
        % 140 145
        % 141 145
        % 142 145
        % 143 145
        h_max_old = h_max;
        h_max = minus(h_max_old, mrdivide(f_x, f_x_dot));
        disc = mrdivide(minus(h_max, h_max_old), h_max_old);
        m = plus(m, 1.0);
        if gt(m, 30.0)
            error('Newton-Raphson failed to find h_max in 30 iterations');
        end % if
    end % while
    % 152 154
    D_h_min = mpower(mrdivide(mtimes(4.0, ball_vlv.A_leak), 3.141592653589793), .5);
    ball_vlv.parameter('D_h_min', cellhorzcat(D_h_min, 'm'));
    % 155 157
    C_d_lam = mrdivide(mtimes(ball_vlv.C_d, ball_vlv.C_d), ball_vlv.Re_cr);
    ball_vlv.parameter('C_d_lam', cellhorzcat(C_d_lam, '1'));
    % 158 160
    ball_vlv.parameter('open_max', cellhorzcat(h_max, 'm'));
    ball_vlv.parameter('area_max', cellhorzcat(area_max, 'm^2'));
    ball_vlv.parameter('a', cellhorzcat(a, 'm'));
    ball_vlv.parameter('b', cellhorzcat(b, 'm^2'));
    ball_vlv.parameter('c', cellhorzcat(c, 'm'));
    ball_vlv.parameter('d', cellhorzcat(d, 'm^2'));
    % 165 167
    ball_vlv.equation(@equation);
end % function
function e = equation(sys, ball_vlv)
    % 169 172
    % 170 172
    e = sys.equation;
    % 172 175
    % 173 175
    C_d = ball_vlv.x_C_d;
    x_0 = ball_vlv.x_x_0;
    Re_cr = ball_vlv.x_Re_cr;
    A_leak = ball_vlv.x_A_leak;
    d_orif = ball_vlv.x_d_orif;
    d_ball = ball_vlv.x_d_ball;
    % 180 182
    density = ball_vlv.density;
    viscosity_kin = ball_vlv.viscosity_kin;
    % 183 185
    area_max = ball_vlv.area_max;
    D_h_min = ball_vlv.D_h_min;
    C_d_lam = ball_vlv.C_d_lam;
    % 187 189
    a = ball_vlv.a;
    b = ball_vlv.b;
    c = ball_vlv.c;
    d = ball_vlv.d;
    % 192 194
    open_max = ball_vlv.open_max;
    % 194 197
    % 195 197
    pr_drop = ball_vlv.p;
    cnt_memb = ball_vlv.S;
    % 198 200
    orif_opening = plus(x_0, cnt_memb);
    % 200 202
    if le(orif_opening, 0.0)
        area = A_leak;
        D_h = D_h_min;
    else
        if gt(orif_opening, open_max)
            area = plus(area_max, A_leak);
            D_h = plus(d_orif, D_h_min);
        else
            b_int = plus(mpower(plus(c, orif_opening), 2.0), d);
            area = plus(mtimes(mtimes(a, minus(1.0, mrdivide(b, b_int))), sqrt(b_int)), A_leak);
            D_h = plus(mtimes(mrdivide(d_orif, 4.0), plus(1.0, mrdivide(mrdivide(d_ball, 2.0), sqrt(b_int)))), D_h_min);
        end % if
        % 213 215
    end % if
    p_cr = mrdivide(mtimes(mpower(mrdivide(mtimes(C_d, viscosity_kin), D_h), 2.0), density), mtimes(2.0, mpower(C_d_lam, 2.0)));
    if lt(neabs(pr_drop), p_cr)
        flow_rate = mrdivide(mrdivide(mtimes(mtimes(mtimes(mtimes(2.0, C_d_lam), area), D_h), pr_drop), density), viscosity_kin);
    else
        % 219 221
        flow_rate = mtimes(mtimes(mtimes(nesign(pr_drop), C_d), area), sqrt(mtimes(mrdivide(2.0, density), neabs(pr_drop))));
    end % if
    % 222 224
    power = mtimes(pr_drop, flow_rate);
    % 224 226
    e(1.0) = minus(ball_vlv.q, flow_rate);
end % function
