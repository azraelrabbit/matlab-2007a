function rotary_actuator_sa(root, schema)
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
    % 18 19
    schema.descriptor = 'Single-Acting Rotary Actuator';
    % 20 22
    % 21 22
    A = schema.terminal('A');
    A.description = 'Hydraulic Inlet A';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = 'A';
    A.location = {'Left',[0.5]};
    % 27 28
    S = schema.terminal('S');
    S.description = 'Shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.label = 'S';
    S.location = {'Right',[0.5]};
    % 33 36
    % 34 36
    % 35 36
    a_d = schema.parameter('displ');
    a_d.description = 'Actuator displacement';
    a_d.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    a_d.default = {[4.5e-05],'m^3/rad'};
    % 40 41
    st = schema.parameter('stroke');
    st.description = 'Shaft stroke';
    st.type = ne_type('real', [1.0 1.0], 'rad');
    st.default = {[5.1],'rad'};
    % 45 46
    ip = schema.parameter('init_ang');
    ip.description = 'Shaft initial angle';
    ip.type = ne_type('real', [1.0 1.0], 'rad');
    ip.default = {[0.0],'rad'};
    % 50 51
    v_a = schema.parameter('dead_vol');
    v_a.description = 'Dead volume';
    v_a.type = ne_type('real', [1.0 1.0], 'm^3');
    v_a.default = {[0.0001],'m^3'};
    % 55 56
    lc = schema.parameter('leak_coeff');
    lc.description = 'Leak coefficient';
    lc.type = ne_type('real', [1.0 1.0], '(m^3/s)/Pa');
    lc.default = {[1e-14],'(m^3/s)/Pa'};
    % 60 61
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 65 66
    stiff = schema.parameter('stiff');
    stiff.description = 'Contact stiffness';
    stiff.type = ne_type('real', [1.0 1.0], 'N*m/rad');
    stiff.default = 1e+06;
    % 70 71
    D = schema.parameter('damp');
    D.description = 'Contact damping';
    D.type = ne_type('real', [1.0 1.0], 'N*m/(rad/s)');
    D.default = 150.0;
    % 75 76
    or = schema.parameter('or');
    or.description = 'Actuator orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 80 82
    % 81 82
    schema.setup(@setup);
end % function
function setup(root, ract_sa)
    % 85 88
    % 86 88
    % 87 88
    x_displ = ract_sa.displ.check('>', 0.0);
    x_stroke = ract_sa.stroke.check('>', 0.0);
    x_init_ang = ract_sa.init_ang.check('>=', 0.0).check('<=', x_stroke);
    x_dead_vol = ract_sa.dead_vol.check('>=', 0.0);
    x_leak_coeff = ract_sa.leak_coeff.check('>=', 0.0);
    x_k_sh = ract_sa.k_sh.check('>=', 1.0, ract_sa.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, ract_sa.k_sh.default);
    x_stiff = ract_sa.stiff.check('>', 0.0, ract_sa.stiff.default);
    x_samp = ract_sa.damp.check('>', 0.0, ract_sa.damp.default);
    % 97 98
    x_unit = {[1.0],'rad'};
    % 99 100
    x_radius = {[0.05],'m'};
    % 101 104
    % 102 104
    % 103 104
    if eq(ract_sa.or, 1.0)
        x_or = 1.0;
        % 106 107
        x_upper_bnd = minus(x_stroke, x_init_ang);
        x_lower_bnd = uminus(x_init_ang);
    else
        x_or = 2.0;
        x_upper_bnd = x_init_ang;
        x_lower_bnd = plus(uminus(x_stroke), x_init_ang);
    end % if
    % 114 117
    % 115 117
    % 116 117
    x_init_vol = plus(x_dead_vol, mtimes(x_displ, x_init_ang));
    % 118 121
    % 119 121
    % 120 121
    conv_A = ract_sa.element('conv_A', root.fl.hydraulic.elements.converter_rot);
    % 122 123
    conv_A.D = x_displ;
    conv_A.or = x_or;
    % 125 127
    % 126 127
    hres = ract_sa.element('hres', root.fl.hydraulic.elements.hydraulic_res_linear);
    % 128 129
    hres.resistance = mrdivide(1.0, x_leak_coeff);
    % 130 132
    % 131 132
    v_ch = ract_sa.element('v_ch', root.fl.hydraulic.elements.chamber_vrb);
    v_ch.area = mrdivide(mtimes(x_displ, x_unit), x_radius);
    v_ch.or = 1.0;
    v_ch.V_dead = x_init_vol;
    v_ch.k_sh = x_k_sh;
    % 137 139
    % 138 139
    r_stop = ract_sa.element('r_stop', root.fl.mechanical.rotational.hardstop_rot);
    r_stop.upper_bnd = x_upper_bnd;
    r_stop.lower_bnd = x_lower_bnd;
    r_stop.stiff_up = x_stiff;
    r_stop.stiff_neg = x_stiff;
    r_stop.D_up = x_samp;
    r_stop.D_low = x_samp;
    % 146 149
    % 147 149
    % 148 149
    wa = ract_sa.element('wa', root.fl.mechanical.mechanisms.wheel_axle);
    wa.R = x_radius;
    wa.or = x_or;
    % 152 154
    % 153 154
    tr_s = ract_sa.element('tr_s', root.fl.mechanical.sensors_sources.sensor_transl_motion);
    % 155 156
    tr_s.offset = 0.0;
    % 157 159
    % 158 159
    mtr = ract_sa.element('mtr', root.fl.mechanical.translational.reference_transl);
    % 160 163
    % 161 163
    % 162 163
    mrr = ract_sa.element('mrr', root.fl.mechanical.rotational.reference_rot);
    % 164 167
    % 165 167
    % 166 167
    href = ract_sa.element('href', root.fl.hydraulic.elements.hydro_reference);
    % 168 171
    % 169 171
    % 170 171
    s_1 = ract_sa.signal('s_1', tr_s.P);
    % 172 174
    % 173 174
    n_1 = ract_sa.node('n_1', root.fl.mechanical.rotational.rotational);
    n_2 = ract_sa.node('n_2', root.fl.mechanical.translational.translational);
    n_3 = ract_sa.node('n_3', root.fl.hydraulic.hydraulic);
    n_4 = ract_sa.node('n_4', root.fl.mechanical.translational.translational);
    % 178 181
    % 179 181
    % 180 181
    ract_sa.connect(conv_A.C, n_1);
    ract_sa.connect(conv_A.A, ract_sa.A);
    ract_sa.connect(conv_A.S, ract_sa.S);
    % 184 186
    % 185 186
    ract_sa.connect(mrr.W, n_1);
    % 187 189
    % 188 189
    ract_sa.connect(href.P, n_3);
    % 190 192
    % 191 192
    ract_sa.connect(hres.A, ract_sa.A);
    ract_sa.connect(hres.B, ract_sa.n_3);
    % 194 196
    % 195 196
    ract_sa.connect(r_stop.R, ract_sa.S);
    ract_sa.connect(r_stop.C, n_1);
    % 198 200
    % 199 200
    ract_sa.connect(v_ch.P, s_1);
    ract_sa.connect(v_ch.A, ract_sa.A);
    % 202 204
    % 203 204
    ract_sa.connect(wa.A, ract_sa.S);
    ract_sa.connect(wa.P, n_2);
    % 206 208
    % 207 208
    ract_sa.connect(mtr.V, n_4);
    % 209 211
    % 210 211
    ract_sa.connect(tr_s.R, n_2);
    ract_sa.connect(tr_s.C, n_4);
    % 213 215
    % 214 215
end % function
