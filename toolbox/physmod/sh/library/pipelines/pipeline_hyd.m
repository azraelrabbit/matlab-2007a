function pipeline_hyd(root, schema)
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
    % 19 20
    schema.descriptor = 'Hydraulic Pipeline';
    % 21 23
    % 22 23
    A = schema.terminal('A');
    A.description = 'Pipeline inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 27 28
    B = schema.terminal('B');
    B.description = 'Pipeline outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 32 34
    % 33 34
    cs_type = schema.parameter('cs_type');
    cs_type.description = 'Pipe cross section type';
    cs_type.type = ne_type('real', [1.0 1.0], '1');
    cs_type.default = 1.0;
    % 38 39
    d_in = schema.parameter('d_in');
    d_in.description = 'Pipe internal diameter';
    d_in.type = ne_type('real', [1.0 1.0], 'm');
    d_in.default = .01;
    % 43 44
    area = schema.parameter('area');
    area.description = 'Noncircular pipe cross-sectional area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0001;
    % 48 49
    D_h = schema.parameter('D_h');
    D_h.description = 'Noncircular pipe hydraulic diameter';
    D_h.type = ne_type('real', [1.0 1.0], 'm');
    D_h.default = .0112;
    % 53 54
    s_factor = schema.parameter('s_factor');
    s_factor.description = 'Geometrical shape factor';
    s_factor.type = ne_type('real', [1.0 1.0], '1');
    s_factor.default = 64.0;
    % 58 59
    length = schema.parameter('length');
    length.description = 'Pipe length';
    length.type = ne_type('real', [1.0 1.0], 'm');
    length.default = 5.0;
    % 63 64
    length_ad = schema.parameter('length_ad');
    length_ad.description = 'Aggregate equivalent length of local resistances';
    length_ad.type = ne_type('real', [1.0 1.0], 'm');
    length_ad.default = 1.0;
    % 68 69
    roughness = schema.parameter('roughness');
    roughness.description = 'Internal surface roughness height';
    roughness.type = ne_type('real', [1.0 1.0], 'm');
    roughness.default = 1.5e-05;
    % 73 74
    Re_lam = schema.parameter('Re_lam');
    Re_lam.description = 'Laminar flow upper margin';
    Re_lam.type = ne_type('real', [1.0 1.0], '1');
    Re_lam.default = 2000.0;
    % 78 79
    Re_turb = schema.parameter('Re_turb');
    Re_turb.description = 'Turbulent flow lower margin';
    Re_turb.type = ne_type('real', [1.0 1.0], '1');
    Re_turb.default = 4000.0;
    % 83 84
    wall_type = schema.parameter('wall_type');
    wall_type.description = 'Pipe wall type';
    wall_type.type = ne_type('real', [1.0 1.0], '1');
    wall_type.default = 1.0;
    % 88 89
    pr_r_coef = schema.parameter('pr_r_coef');
    pr_r_coef.description = 'Static pressure-diameter coefficient';
    pr_r_coef.type = ne_type('real', [1.0 1.0], 'm/Pa');
    pr_r_coef.default = 2e-12;
    % 93 94
    time_const = schema.parameter('time_const');
    time_const.description = 'Viscoelastic process time constant';
    time_const.type = ne_type('real', [1.0 1.0], 's');
    time_const.default = .01;
    % 98 99
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 103 104
    schema.setup(@setup);
end % function
function setup(root, pipe)
    % 107 110
    % 108 110
    % 109 110
    x_d_in = pipe.d_in.check('>', 0.0);
    x_area = pipe.area.check('>', 0.0);
    x_D_h = pipe.D_h.check('>', 0.0);
    x_s_factor = pipe.s_factor.check('>', 0.0);
    x_length = pipe.length.check('>', 0.0);
    x_length_ad = pipe.length_ad.check('>=', 0.0);
    x_roughness = pipe.roughness.check('>=', 0.0);
    x_Re_lam = pipe.Re_lam.check('>', 0.0);
    x_Re_turb = pipe.Re_turb.check('>', x_Re_lam);
    % 119 120
    x_pr_r_coef = pipe.pr_r_coef.check('>', 0.0, pipe.pr_r_coef.default);
    x_time_constant = pipe.time_const.check('>', 0.0, pipe.time_const.default);
    x_k_sh = pipe.k_sh.check('>=', 1.0, pipe.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, pipe.k_sh.default);
    % 124 126
    % 125 126
    n_int = pipe.node('n_int', root.fl.hydraulic.hydraulic);
    % 127 130
    % 128 130
    % 129 130
    tb_A = pipe.element('tb_A', root.fl.hydraulic.elements.resistive_tube);
    tb_A.cs_type = pipe.cs_type;
    tb_A.d_in = x_d_in;
    tb_A.area = x_area;
    tb_A.D_h = x_D_h;
    tb_A.s_factor = x_s_factor;
    tb_A.length = mrdivide(x_length, 2.0);
    tb_A.length_ad = mrdivide(x_length_ad, 2.0);
    tb_A.roughness = x_roughness;
    tb_A.Re_lam = x_Re_lam;
    tb_A.Re_turb = x_Re_turb;
    % 141 143
    % 142 143
    ch_A = pipe.element('ch_A', root.fl.hydraulic.elements.chamber_const);
    ch_A.ch_sp = 2.0;
    ch_A.wall_type = pipe.wall_type;
    ch_A.d_in = x_d_in;
    ch_A.length = x_length;
    ch_A.pr_r_coef = x_pr_r_coef;
    ch_A.time_const = x_time_constant;
    ch_A.k_sh = x_k_sh;
    % 151 153
    % 152 153
    tb_B = pipe.element('tb_B', root.fl.hydraulic.elements.resistive_tube);
    tb_B.cs_type = pipe.cs_type;
    tb_B.d_in = x_d_in;
    tb_B.area = x_area;
    tb_B.D_h = x_D_h;
    tb_B.s_factor = x_s_factor;
    tb_B.length = mrdivide(x_length, 2.0);
    tb_B.length_ad = mrdivide(x_length_ad, 2.0);
    tb_B.roughness = x_roughness;
    tb_B.Re_lam = x_Re_lam;
    tb_B.Re_turb = x_Re_turb;
    % 164 168
    % 165 168
    % 166 168
    % 167 168
    pipe.connect(tb_A.A, pipe.A);
    pipe.connect(tb_A.B, n_int);
    % 170 171
    pipe.connect(ch_A.A, n_int);
    % 172 173
    pipe.connect(tb_B.A, n_int);
    pipe.connect(tb_B.B, pipe.B);
    % 175 176
end % function
