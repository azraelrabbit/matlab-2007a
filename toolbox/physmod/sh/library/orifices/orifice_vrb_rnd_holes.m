function orifice_vrb_rnd_holes(root, schema)
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
    schema.descriptor = 'Orifice with Variable Area Round Holes';
    % 21 24
    % 22 24
    S = schema.input('S');
    S.description = 'Spool control terminal';
    S.location = {'Left';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 27 29
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 32 34
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 37 40
    % 38 40
    or_diam = schema.parameter('or_diam');
    or_diam.description = 'Diameter of round holes';
    or_diam.type = ne_type('real', [1.0 1.0], 'm');
    or_diam.default = .005;
    % 43 46
    % 44 46
    or_numb = schema.parameter('or_numb');
    or_numb.description = 'Number of round holes';
    or_numb.type = ne_type('real', [1.0 1.0], '1');
    or_numb.default = 6.0;
    % 49 51
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .6;
    % 54 56
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 59 61
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 64 66
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 69 71
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-15;
    % 74 77
    % 75 77
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3)';
    % 78 80
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 81 83
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 84 86
    var_int_b = schema.local_variable('orif_opening');
    var_int_b.description = 'Orifice opening (m)';
    % 87 89
    var_int_a = schema.local_variable('area');
    var_int_a.description = 'Orifice total passage area (m^2)';
    % 90 92
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the orifice (W)';
    % 93 95
    schema.setup(@setup);
    % 95 97
end % function
function setup(root, or_r_holes)
    % 98 101
    % 99 101
    or_r_holes.branch_across('p', or_r_holes.A.p, or_r_holes.B.p);
    or_r_holes.branch_through('q', or_r_holes.A.q, or_r_holes.B.q);
    % 102 105
    % 103 105
    or_r_holes.parameter('x_or_diam', or_r_holes.or_diam.check('>', 0.0));
    or_r_holes.parameter('x_or_numb', or_r_holes.or_numb.check('>', 0.0));
    or_r_holes.parameter('x_C_d', or_r_holes.C_d.check('>', 0.0, or_r_holes.C_d.default));
    % 107 109
    or_r_holes.parameter('x_Re_cr', or_r_holes.Re_cr.check('>', 0.0, or_r_holes.Re_cr.default));
    % 109 111
    or_r_holes.parameter('x_A_leak', or_r_holes.A_leak.check('>=', 0.0, or_r_holes.A_leak.default));
    % 111 114
    % 112 114
    x_or = or_r_holes.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    or_r_holes.parameter('x_or', x_or);
    % 118 120
    or_r_holes.parameter('density', or_r_holes.A.density);
    or_r_holes.parameter('viscosity_kin', or_r_holes.A.viscosity_kin);
    % 121 125
    % 122 125
    % 123 125
    C_d_lam = mrdivide(mtimes(or_r_holes.C_d, or_r_holes.C_d), or_r_holes.Re_cr);
    % 125 127
    area_max = mrdivide(mtimes(mtimes(mtimes(3.141592653589793, or_r_holes.or_diam), or_r_holes.or_diam), or_r_holes.or_numb), 4.0);
    % 127 129
    or_r_holes.parameter('C_d_lam', C_d_lam);
    or_r_holes.parameter('area_max', area_max);
    % 130 132
    or_r_holes.equation(@equation);
end % function
function e = equation(sys, or_r_holes)
    % 134 137
    % 135 137
    e = sys.equation;
    % 137 140
    % 138 140
    or_diam = or_r_holes.x_or_diam;
    or_numb = or_r_holes.x_or_numb;
    C_d = or_r_holes.x_C_d;
    x_0 = or_r_holes.x_0;
    or = or_r_holes.x_or;
    Re_cr = or_r_holes.x_Re_cr;
    A_leak = or_r_holes.x_A_leak;
    density = or_r_holes.density;
    viscosity_kin = or_r_holes.viscosity_kin;
    % 148 152
    % 149 152
    % 150 152
    C_d_lam = or_r_holes.C_d_lam;
    area_max = or_r_holes.area_max;
    D_h_min = sqrt(mrdivide(mtimes(4.0, A_leak), 3.141592653589793));
    % 154 157
    % 155 157
    pr_drop = or_r_holes.p;
    cnt_memb = or_r_holes.S;
    % 158 160
    orif_opening = plus(x_0, mtimes(cnt_memb, or));
    % 160 162
    if le(orif_opening, 0.0)
        area = A_leak;
        D_h = D_h_min;
    else
        if gt(orif_opening, or_diam)
            area = plus(area_max, A_leak);
            D_h = plus(or_diam, D_h_min);
        else
            theta = mtimes(2.0, acos(minus(1.0, mrdivide(mtimes(2.0, orif_opening), or_diam))));
            area = mrdivide(mtimes(mtimes(or_numb, mpower(or_diam, 2.0)), minus(theta, sin(theta))), 8.0);
            p = mrdivide(mtimes(mtimes(or_numb, or_diam), plus(theta, mtimes(2.0, sin(mrdivide(theta, 2.0))))), 2.0);
            D_h = plus(mrdivide(mtimes(4.0, area), p), D_h_min);
        end % if
        % 174 179
        % 175 179
        % 176 179
        % 177 179
    end % if
    flow_rate = ne_flow_rate(area, pr_drop, C_d, C_d_lam, D_h, viscosity_kin, density);
    % 180 182
    power = mtimes(pr_drop, flow_rate);
    % 182 184
    e(1.0) = minus(or_r_holes.q, flow_rate);
end % function
