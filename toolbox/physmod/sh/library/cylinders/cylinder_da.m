function cylinder_da(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    schema.descriptor = 'Double-Acting Hydraulic Cylinder';
    % 18 20
    % 19 20
    C = schema.terminal('C');
    C.description = 'Clamping structure';
    C.domain = root.fl.mechanical.translational.translational;
    C.label = 'C';
    C.location = {'Left',[0.25]};
    % 25 26
    A = schema.terminal('A');
    A.description = 'Hydraulic Inlet A';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = 'A';
    A.location = {'Left',[0.75]};
    % 31 32
    R = schema.terminal('R');
    R.description = 'Rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.label = 'R';
    R.location = {'Right',[0.25]};
    % 37 38
    B = schema.terminal('B');
    B.description = 'Hydraulic Inlet B';
    B.domain = root.fl.hydraulic.hydraulic;
    B.label = 'B';
    B.location = {'Right',[0.75]};
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    a_a = schema.parameter('area_A');
    a_a.description = 'Piston area A';
    a_a.type = ne_type('real', [1.0 1.0], 'm^2');
    a_a.default = {[0.001],'m^2'};
    % 51 52
    a_b = schema.parameter('area_B');
    a_b.description = 'Piston area B';
    a_b.type = ne_type('real', [1.0 1.0], 'm^2');
    a_b.default = {[0.0005],'m^2'};
    % 56 57
    s = schema.parameter('stroke');
    s.description = 'Piston stroke';
    s.type = ne_type('real', [1.0 1.0], 'm');
    s.default = {[0.1],'m'};
    % 61 62
    ip = schema.parameter('init_pos');
    ip.description = 'Piston initial position';
    ip.type = ne_type('real', [1.0 1.0], 'm');
    ip.default = {[0.0],'m'};
    % 66 67
    v_a = schema.parameter('dead_vol_A');
    v_a.description = 'Dead volume A';
    v_a.type = ne_type('real', [1.0 1.0], 'm^3');
    v_a.default = {[0.0001],'m^3'};
    % 71 72
    v_b = schema.parameter('dead_vol_B');
    v_b.description = 'Dead volume B';
    v_b.type = ne_type('real', [1.0 1.0], 'm^3');
    v_b.default = {[0.0001],'m^3'};
    % 76 77
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 81 82
    stiff = schema.parameter('stiff');
    stiff.description = 'Contact stiffness';
    stiff.type = ne_type('real', [1.0 1.0], 'N/m');
    stiff.default = 1e+06;
    % 86 87
    D = schema.parameter('D');
    D.description = 'Contact damping';
    D.type = ne_type('real', [1.0 1.0], 'N*s/m');
    D.default = 150.0;
    % 91 92
    o = schema.parameter('or');
    o.description = 'Cylinder orientation';
    o.type = ne_type('real', [1.0 1.0], '1');
    o.default = 1.0;
    % 96 98
    % 97 98
    schema.setup(@setup);
end % function
function setup(root, cyl_da)
    % 101 104
    % 102 104
    % 103 104
    x_area_A = cyl_da.area_A.check('>', 0.0);
    x_area_B = cyl_da.area_B.check('>', 0.0);
    x_stroke = cyl_da.stroke.check('>', 0.0);
    x_init_pos = cyl_da.init_pos.check('>=', 0.0);
    x_init_pos = x_init_pos.check('<=', x_stroke);
    x_dead_vol_A = cyl_da.dead_vol_A.check('>=', 0.0);
    x_dead_vol_B = cyl_da.dead_vol_B.check('>=', 0.0);
    x_k_sh = cyl_da.k_sh.check('>=', 1.0, cyl_da.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, cyl_da.k_sh.default);
    x_stiff = cyl_da.stiff.check('>', 0.0, cyl_da.stiff.default);
    x_D = cyl_da.D.check('>', 0.0, cyl_da.D.default);
    % 115 118
    % 116 118
    % 117 118
    if eq(cyl_da.or, 1.0)
        x_or_A = 1.0;
        x_or_B = 2.0;
        x_gain = 1.0;
        % 122 123
        x_upper_bnd = minus(x_stroke, x_init_pos);
        x_lower_bnd = uminus(x_init_pos);
    else
        x_or_A = 2.0;
        x_or_B = 1.0;
        x_gain = -1.0;
        x_upper_bnd = x_init_pos;
        x_lower_bnd = plus(uminus(x_stroke), x_init_pos);
    end % if
    % 132 135
    % 133 135
    % 134 135
    x_init_vol_A = plus(x_dead_vol_A, mtimes(x_area_A, x_init_pos));
    x_init_vol_B = plus(x_dead_vol_B, mtimes(x_area_B, minus(x_stroke, x_init_pos)));
    % 137 139
    % 138 139
    conv_A = cyl_da.element('conv_A', root.fl.hydraulic.elements.converter_transl);
    % 140 141
    conv_A.area = x_area_A;
    conv_A.or = x_or_A;
    % 143 145
    % 144 145
    conv_B = cyl_da.element('conv_B', root.fl.hydraulic.elements.converter_transl);
    % 146 147
    conv_B.area = x_area_B;
    conv_B.or = x_or_B;
    % 149 151
    % 150 151
    v_ch_A = cyl_da.element('v_ch_A', root.fl.hydraulic.elements.chamber_vrb);
    v_ch_A.area = x_area_A;
    v_ch_A.or = 1.0;
    v_ch_A.V_dead = x_init_vol_A;
    v_ch_A.k_sh = x_k_sh;
    % 156 158
    % 157 158
    v_ch_B = cyl_da.element('v_ch_B', root.fl.hydraulic.elements.chamber_vrb);
    v_ch_B.area = x_area_B;
    v_ch_B.or = 2.0;
    v_ch_B.V_dead = x_init_vol_B;
    v_ch_B.k_sh = x_k_sh;
    % 163 165
    % 164 165
    hs = cyl_da.element('hs', root.fl.mechanical.translational.hardstop_transl);
    hs.upper_bnd = x_upper_bnd;
    hs.lower_bnd = x_lower_bnd;
    hs.stiff_up = x_stiff;
    hs.stiff_low = x_stiff;
    hs.D_up = x_D;
    hs.D_low = x_D;
    % 172 174
    % 173 174
    s = cyl_da.element('s', root.fl.mechanical.sensors_sources.sensor_transl_motion);
    % 175 176
    s.offset = 0.0;
    % 177 179
    % 178 179
    g = cyl_da.element('g', root.fl.physical_signal.functions.ps_gain);
    g.gain = x_gain;
    % 181 183
    % 182 183
    s1 = cyl_da.signal('s1', s.P);
    s2 = cyl_da.signal('s2', g.O);
    % 185 188
    % 186 188
    % 187 188
    cyl_da.connect(conv_A.C, cyl_da.C);
    cyl_da.connect(conv_A.A, cyl_da.A);
    cyl_da.connect(conv_A.R, cyl_da.R);
    % 191 193
    % 192 193
    cyl_da.connect(conv_B.C, cyl_da.C);
    cyl_da.connect(conv_B.A, cyl_da.B);
    cyl_da.connect(conv_B.R, cyl_da.R);
    % 196 198
    % 197 198
    cyl_da.connect(hs.R, cyl_da.R);
    cyl_da.connect(hs.C, cyl_da.C);
    % 200 202
    % 201 202
    cyl_da.connect(v_ch_A.P, s2);
    cyl_da.connect(v_ch_A.A, cyl_da.A);
    % 204 206
    % 205 206
    cyl_da.connect(v_ch_B.P, s2);
    cyl_da.connect(v_ch_B.A, cyl_da.B);
    % 208 210
    % 209 210
    cyl_da.connect(s.R, cyl_da.R);
    cyl_da.connect(s.C, cyl_da.C);
    % 212 215
    % 213 215
    % 214 215
    cyl_da.connect(g.I, s1);
    % 216 217
end % function
