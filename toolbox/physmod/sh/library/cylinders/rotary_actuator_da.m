function rotary_actuator_da(root, schema)
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
    schema.descriptor = 'Double-Acting Rotary Actuator';
    % 21 23
    % 22 23
    A = schema.terminal('A');
    A.description = 'Hydraulic Inlet A';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = 'A';
    A.location = {'Left',[0.25]};
    % 28 29
    B = schema.terminal('B');
    B.description = 'Hydraulic Inlet B';
    B.domain = root.fl.hydraulic.hydraulic;
    B.label = 'B';
    B.location = {'Left',[0.75]};
    % 34 35
    S = schema.terminal('S');
    S.description = 'Shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.label = 'S';
    S.location = {'Right',[0.5]};
    % 40 43
    % 41 43
    % 42 43
    a_d = schema.parameter('displ');
    a_d.description = 'Actuator displacement';
    a_d.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    a_d.default = {[4.5e-05],'m^3/rad'};
    % 47 48
    st = schema.parameter('stroke');
    st.description = 'Shaft stroke';
    st.type = ne_type('real', [1.0 1.0], 'rad');
    st.default = {[5.1],'rad'};
    % 52 53
    ip = schema.parameter('init_ang');
    ip.description = 'Shaft initial angle';
    ip.type = ne_type('real', [1.0 1.0], 'rad');
    ip.default = {[0.0],'rad'};
    % 57 58
    v_a = schema.parameter('dead_vol_A');
    v_a.description = 'Dead volume A';
    v_a.type = ne_type('real', [1.0 1.0], 'm^3');
    v_a.default = {[0.0001],'m^3'};
    % 62 63
    v_b = schema.parameter('dead_vol_B');
    v_b.description = 'Dead volume B';
    v_b.type = ne_type('real', [1.0 1.0], 'm^3');
    v_b.default = {[0.0001],'m^3'};
    % 67 68
    lc = schema.parameter('leak_coeff');
    lc.description = 'Leak coefficient';
    lc.type = ne_type('real', [1.0 1.0], '(m^3/s)/Pa');
    lc.default = {[1e-14],'(m^3/s)/Pa'};
    % 72 73
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 77 78
    stiff = schema.parameter('stiff');
    stiff.description = 'Contact stiffness';
    stiff.type = ne_type('real', [1.0 1.0], 'N*m/rad');
    stiff.default = 1e+06;
    % 82 83
    D = schema.parameter('damp');
    D.description = 'Contact damping';
    D.type = ne_type('real', [1.0 1.0], 'N*m/(rad/s)');
    D.default = 150.0;
    % 87 88
    or = schema.parameter('or');
    or.description = 'Actuator orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 92 94
    % 93 94
    schema.setup(@setup);
end % function
function setup(root, ract_da)
    % 97 100
    % 98 100
    % 99 100
    x_displ = ract_da.displ.check('>', 0.0);
    x_stroke = ract_da.stroke.check('>', 0.0);
    x_init_ang = ract_da.init_ang.check('>=', 0.0).check('<=', x_stroke);
    x_dead_vol_A = ract_da.dead_vol_A.check('>=', 0.0);
    x_dead_vol_B = ract_da.dead_vol_B.check('>=', 0.0);
    x_leak_coeff = ract_da.leak_coeff.check('>=', 0.0);
    x_k_sh = ract_da.k_sh.check('>=', 1.0, ract_da.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, ract_da.k_sh.default);
    x_stiff = ract_da.stiff.check('>', 0.0, ract_da.stiff.default);
    x_damp = ract_da.damp.check('>', 0.0, ract_da.damp.default);
    % 110 111
    x_unit = {[1.0],'rad'};
    % 112 113
    x_radius = {[0.05],'m'};
    % 114 117
    % 115 117
    % 116 117
    if eq(ract_da.or, 1.0)
        x_or_A = 1.0;
        x_or_B = 2.0;
        x_or = 1.0;
        % 121 122
        x_upper_bnd = minus(x_stroke, x_init_ang);
        x_lower_bnd = uminus(x_init_ang);
    else
        x_or_A = 2.0;
        x_or_B = 1.0;
        x_or = 2.0;
        x_upper_bnd = x_init_ang;
        x_lower_bnd = plus(uminus(x_stroke), x_init_ang);
    end % if
    % 131 134
    % 132 134
    % 133 134
    x_init_vol_A = plus(x_dead_vol_A, mtimes(x_displ, x_init_ang));
    x_init_vol_B = plus(x_dead_vol_B, mtimes(x_displ, minus(x_stroke, x_init_ang)));
    % 136 139
    % 137 139
    % 138 139
    conv_A = ract_da.element('conv_A', root.fl.hydraulic.elements.converter_rot);
    % 140 141
    conv_A.D = x_displ;
    conv_A.or = x_or_A;
    % 143 145
    % 144 145
    conv_B = ract_da.element('conv_B', root.fl.hydraulic.elements.converter_rot);
    % 146 147
    conv_B.D = x_displ;
    conv_B.or = x_or_B;
    % 149 151
    % 150 151
    hres = ract_da.element('hres', root.fl.hydraulic.elements.hydraulic_res_linear);
    % 152 153
    hres.resistance = mrdivide(1.0, x_leak_coeff);
    % 154 156
    % 155 156
    v_ch_A = ract_da.element('v_ch_A', root.fl.hydraulic.elements.chamber_vrb);
    v_ch_A.area = mrdivide(mtimes(x_displ, x_unit), x_radius);
    v_ch_A.or = 1.0;
    v_ch_A.V_dead = x_init_vol_A;
    v_ch_A.k_sh = x_k_sh;
    % 161 163
    % 162 163
    v_ch_B = ract_da.element('v_ch_B', root.fl.hydraulic.elements.chamber_vrb);
    v_ch_B.area = mrdivide(mtimes(x_displ, x_unit), x_radius);
    v_ch_B.or = 2.0;
    v_ch_B.V_dead = x_init_vol_B;
    v_ch_B.k_sh = x_k_sh;
    % 168 170
    % 169 170
    r_stop = ract_da.element('r_stop', root.fl.mechanical.rotational.hardstop_rot);
    r_stop.upper_bnd = x_upper_bnd;
    r_stop.lower_bnd = x_lower_bnd;
    r_stop.stiff_up = x_stiff;
    r_stop.stiff_neg = x_stiff;
    r_stop.D_up = x_damp;
    r_stop.D_low = x_damp;
    % 177 180
    % 178 180
    % 179 180
    wa = ract_da.element('wa', root.fl.mechanical.mechanisms.wheel_axle);
    wa.R = x_radius;
    wa.or = x_or;
    % 183 185
    % 184 185
    tr_s = ract_da.element('tr_s', root.fl.mechanical.sensors_sources.sensor_transl_motion);
    % 186 187
    tr_s.offset = 0.0;
    % 188 191
    % 189 191
    % 190 191
    mtr = ract_da.element('mtr', root.fl.mechanical.translational.reference_transl);
    % 192 195
    % 193 195
    % 194 195
    mrr = ract_da.element('mrr', root.fl.mechanical.rotational.reference_rot);
    % 196 199
    % 197 199
    % 198 199
    s_1 = ract_da.signal('s_1', tr_s.P);
    % 200 202
    % 201 202
    n_1 = ract_da.node('n_1', root.fl.mechanical.rotational.rotational);
    n_2 = ract_da.node('n_2', root.fl.mechanical.translational.translational);
    n_3 = ract_da.node('n_3', root.fl.mechanical.translational.translational);
    % 205 208
    % 206 208
    % 207 208
    ract_da.connect(conv_A.C, n_1);
    ract_da.connect(conv_A.A, ract_da.A);
    ract_da.connect(conv_A.S, ract_da.S);
    % 211 213
    % 212 213
    ract_da.connect(conv_B.C, n_1);
    ract_da.connect(conv_B.A, ract_da.B);
    ract_da.connect(conv_B.S, ract_da.S);
    % 216 218
    % 217 218
    ract_da.connect(hres.A, ract_da.A);
    ract_da.connect(hres.B, ract_da.B);
    % 220 222
    % 221 222
    ract_da.connect(mrr.W, n_1);
    % 223 225
    % 224 225
    ract_da.connect(r_stop.R, ract_da.S);
    ract_da.connect(r_stop.C, n_1);
    % 227 229
    % 228 229
    ract_da.connect(v_ch_A.P, s_1);
    ract_da.connect(v_ch_A.A, ract_da.A);
    % 231 233
    % 232 233
    ract_da.connect(v_ch_B.P, s_1);
    ract_da.connect(v_ch_B.A, ract_da.B);
    % 235 237
    % 236 237
    ract_da.connect(wa.A, ract_da.S);
    ract_da.connect(wa.P, n_2);
    % 239 241
    % 240 241
    ract_da.connect(mtr.V, n_3);
    % 242 244
    % 243 244
    ract_da.connect(tr_s.R, n_2);
    ract_da.connect(tr_s.C, n_3);
    % 246 248
    % 247 248
end % function
