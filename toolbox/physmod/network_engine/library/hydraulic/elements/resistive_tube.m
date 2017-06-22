function resistive_tube(root, schema)
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
    schema.descriptor = 'Resistive Tube';
    % 20 23
    % 21 23
    A = schema.terminal('A');
    A.description = 'Tube inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 26 28
    B = schema.terminal('B');
    B.description = 'Tube outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 31 34
    % 32 34
    cs_type = schema.parameter('cs_type');
    cs_type.description = 'Tube cross section type';
    cs_type.type = ne_type('real', [1.0 1.0], '1');
    cs_type.default = 1.0;
    % 37 39
    d_in = schema.parameter('d_in');
    d_in.description = 'Tube internal diameter';
    d_in.type = ne_type('real', [1.0 1.0], 'm');
    d_in.default = .01;
    % 42 44
    area = schema.parameter('area');
    area.description = 'Noncircular tube cross-sectional area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0001;
    % 47 49
    D_h = schema.parameter('D_h');
    D_h.description = 'Noncircular tube hydraulic diameter';
    D_h.type = ne_type('real', [1.0 1.0], 'm');
    D_h.default = .0112;
    % 52 54
    s_factor = schema.parameter('s_factor');
    s_factor.description = 'Geometrical shape factor';
    s_factor.type = ne_type('real', [1.0 1.0], '1');
    s_factor.default = 64.0;
    % 57 59
    length = schema.parameter('length');
    length.description = 'Tube length';
    length.type = ne_type('real', [1.0 1.0], 'm');
    length.default = 5.0;
    % 62 64
    length_ad = schema.parameter('length_ad');
    length_ad.description = 'Aggregate equivalent length of local resistances';
    length_ad.type = ne_type('real', [1.0 1.0], 'm');
    length_ad.default = 1.0;
    % 67 69
    roughness = schema.parameter('roughness');
    roughness.description = 'Internal surface roughness height';
    roughness.type = ne_type('real', [1.0 1.0], 'm');
    roughness.default = 1.5e-05;
    % 72 74
    Re_lam = schema.parameter('Re_lam');
    Re_lam.description = 'Laminar flow upper margin';
    Re_lam.type = ne_type('real', [1.0 1.0], '1');
    Re_lam.default = 2000.0;
    % 77 79
    Re_turb = schema.parameter('Re_turb');
    Re_turb.description = 'Turbulent flow lower margin';
    Re_turb.type = ne_type('real', [1.0 1.0], '1');
    Re_turb.default = 4000.0;
    % 82 86
    % 83 86
    % 84 86
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the tube m^3/s)';
    % 87 89
    var_int_pr = schema.local_variable('pr_loss');
    var_int_pr.description = 'Pressure loss across the tube (Pa)';
    % 90 92
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 93 95
    var_int_f = schema.local_variable('fr_coef');
    var_int_f.description = 'Friction coefficient';
    % 96 98
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the tube (W)';
    % 99 101
    schema.setup(@setup);
    % 101 103
end % function
function setup(root, res_tube)
    % 104 107
    % 105 107
    res_tube.branch_across('p', res_tube.A.p, res_tube.B.p);
    res_tube.branch_through('q', res_tube.A.q, res_tube.B.q);
    % 108 111
    % 109 111
    res_tube.parameter('x_d_in', res_tube.d_in.check('>', 0.0));
    res_tube.parameter('x_area', res_tube.area.check('>', 0.0));
    res_tube.parameter('x_D_h', res_tube.D_h.check('>', 0.0));
    res_tube.parameter('x_s_factor', res_tube.s_factor.check('>', 0.0));
    res_tube.parameter('x_length', res_tube.length.check('>', 0.0));
    res_tube.parameter('x_length_ad', res_tube.length_ad.check('>=', 0.0));
    res_tube.parameter('x_roughness', res_tube.roughness.check('>=', 0.0));
    res_tube.parameter('x_Re_lam', res_tube.Re_lam.check('>', 0.0));
    res_tube.parameter('x_Re_turb', res_tube.Re_turb.check('>', res_tube.Re_lam.value));
    % 119 122
    % 120 122
    res_tube.parameter('density', res_tube.A.density);
    res_tube.parameter('viscosity_kin', res_tube.A.viscosity_kin);
    % 123 125
    res_tube.equation(@equation);
end % function
function e = equation(sys, res_tube)
    % 127 130
    % 128 130
    e = sys.equation;
    % 130 133
    % 131 133
    s_factor = res_tube.x_s_factor;
    r = res_tube.x_roughness;
    Re_lam = res_tube.x_Re_lam;
    Re_turb = res_tube.x_Re_turb;
    viscosity_kin = res_tube.viscosity_kin;
    density = res_tube.density;
    % 138 142
    % 139 142
    % 140 142
    length_eff = plus(res_tube.length, res_tube.length_ad);
    % 142 144
    area_cyl = mrdivide(mtimes(3.141592653589793, mpower(res_tube.d_in, 2.0)), 4.0);
    % 144 146
    cs_type = res_tube.cs_type;
    % 146 148
    if eq(cs_type, 1.0)
        % 148 150
        area = area_cyl;
        D_h = res_tube.x_d_in;
    else
        % 152 154
        area = res_tube.x_area;
        D_h = res_tube.x_D_h;
    end % if
    % 156 159
    % 157 159
    rel_roughness = mrdivide(r, D_h);
    % 159 161
    f_lam = mrdivide(s_factor, Re_lam);
    % 161 163
    f_turb = mrdivide(1.0, mpower(mtimes(-1.8, log10(plus(mrdivide(6.9, Re_turb), mpower(mrdivide(rel_roughness, 3.7), 1.11)))), 2.0));
    % 163 165
    f_gain = mrdivide(minus(f_turb, f_lam), minus(Re_turb, Re_lam));
    % 165 167
    flow_rate = res_tube.q;
    Re = mrdivide(mrdivide(mtimes(neabs(flow_rate), D_h), area), viscosity_kin);
    % 168 171
    % 169 171
    if le(Re, Re_lam)
        % 171 174
        % 172 174
        pr_loss = mtimes(mtimes(mrdivide(mrdivide(mrdivide(mtimes(mtimes(s_factor, viscosity_kin), length_eff), mpower(D_h, 2.0)), area), 2.0), density), flow_rate);
    else
        % 175 178
        % 176 178
        if lt(Re, Re_turb)
            % 178 180
            fr_coef = plus(f_lam, mtimes(f_gain, minus(Re, Re_lam)));
        else
            % 181 183
            fr_coef = mrdivide(1.0, mpower(mtimes(-1.8, log10(plus(mrdivide(6.9, Re), mpower(mrdivide(rel_roughness, 3.7), 1.11)))), 2.0));
            % 183 185
        end % if
        % 185 187
        pr_loss = mtimes(mtimes(mtimes(mrdivide(mrdivide(mrdivide(mtimes(fr_coef, length_eff), D_h), mpower(area, 2.0)), 2.0), density), flow_rate), neabs(flow_rate));
    end % if
    % 188 190
    power = mtimes(pr_loss, flow_rate);
    % 190 192
    e(1.0) = minus(res_tube.p, pr_loss);
    % 192 194
end % function
