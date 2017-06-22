function orifice_annular(root, schema)
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
    schema.descriptor = 'Annular Orifice';
    % 21 24
    % 22 24
    S = schema.input('S');
    S.description = 'Insert control terminal';
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
    ro = schema.parameter('orifice_r');
    ro.description = 'Orifice radius';
    ro.type = ne_type('real', [1.0 1.0], 'm');
    ro.default = .01;
    % 43 45
    ri = schema.parameter('insert_r');
    ri.description = 'Insert radius';
    ri.type = ne_type('real', [1.0 1.0], 'm');
    ri.default = .0098;
    % 48 50
    ec = schema.parameter('ecc');
    ec.description = 'Eccentricity';
    ec.type = ne_type('real', [1.0 1.0], 'm');
    ec.default = 0.0;
    % 53 55
    ol = schema.parameter('length');
    ol.description = 'Initial length';
    ol.type = ne_type('real', [1.0 1.0], 'm');
    ol.default = .003;
    % 58 60
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 63 66
    % 64 66
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3)';
    % 67 69
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 70 72
    var_int_l = schema.local_variable('orif_length');
    var_int_l.description = 'Orifice length (m)';
    % 73 75
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the orifice (W)';
    % 76 78
    schema.setup(@setup);
    % 78 80
end % function
function setup(root, or_an)
    % 81 84
    % 82 84
    or_an.branch_across('p', or_an.A.p, or_an.B.p);
    or_an.branch_through('q', or_an.A.q, or_an.B.q);
    % 85 88
    % 86 88
    or_an.parameter('x_orifice_r', or_an.orifice_r.check('>', 0.0));
    or_an.parameter('x_insert_r', or_an.insert_r.check('<', or_an.orifice_r).check('>', 0.0));
    % 89 92
    % 90 92
    or_an.parameter('x_ecc', or_an.ecc.check('>=', 0.0));
    % 92 94
    or_an.parameter('x_length', or_an.length.check('>', 0.0));
    % 94 96
    if eq(or_an.or, 2.0)
        x_or = -1.0;
    else
        x_or = 1.0;
    end % if
    % 100 102
    x_ecc_rel = mrdivide(or_an.ecc, minus(or_an.orifice_r, or_an.insert_r));
    or_an.parameter('x_or', x_or);
    or_an.parameter('x_ecc_rel', x_ecc_rel);
    % 104 107
    % 105 107
    or_an.parameter('density', or_an.A.density);
    or_an.parameter('viscosity_kin', or_an.A.viscosity_kin);
    % 108 110
    or_an.equation(@equation);
end % function
function e = equation(sys, or_an)
    % 112 115
    % 113 115
    e = sys.equation;
    % 115 118
    % 116 118
    r_o = or_an.x_orifice_r;
    r_i = or_an.x_insert_r;
    ecc_rel = or_an.x_ecc_rel;
    l_0 = or_an.x_length;
    or = or_an.x_or;
    % 122 124
    density = or_an.density;
    viscosity_kin = or_an.viscosity_kin;
    % 125 129
    % 126 129
    % 127 129
    pr_drop = or_an.p;
    cnt_memb = or_an.S;
    % 130 132
    orif_length = plus(l_0, mtimes(cnt_memb, or));
    % 132 139
    % 133 139
    % 134 139
    % 135 139
    % 136 139
    % 137 139
    flow_rate = mtimes(mrdivide(mtimes(mtimes(mtimes(3.141592653589793, r_o), mpower(minus(r_o, r_i), 3.0)), plus(1.0, mtimes(1.5, mpower(ecc_rel, 2.0)))), mtimes(mtimes(mtimes(6.0, viscosity_kin), density), orif_length)), pr_drop);
    % 139 142
    % 140 142
    power = mtimes(pr_drop, flow_rate);
    % 142 144
    e(1.0) = minus(or_an.q, flow_rate);
end % function
