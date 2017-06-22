function cylinder_sa(root, schema)
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
    schema.descriptor = 'Single-Acting Hydraulic Cylinder';
    % 18 20
    % 19 20
    C = schema.terminal('C');
    C.description = 'Clamping structure';
    C.domain = root.fl.mechanical.translational.translational;
    C.label = 'C';
    C.location = {'Left',[0.25]};
    % 25 26
    A = schema.terminal('A');
    A.description = 'Hydraulic Inlet';
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
    P = schema.output('P');
    P.description = 'Piston position';
    P.label = '';
    P.location = {'Right';[0.75]};
    P.type = ne_type('real', [1.0 1.0], 'm');
    % 43 46
    % 44 46
    % 45 46
    a = schema.parameter('area');
    a.description = 'Piston area';
    a.type = ne_type('real', [1.0 1.0], 'm^2');
    a.default = {[0.001],'m^2'};
    % 50 51
    s = schema.parameter('stroke');
    s.description = 'Piston stroke';
    s.type = ne_type('real', [1.0 1.0], 'm');
    s.default = {[0.1],'m'};
    % 55 56
    ip = schema.parameter('init_pos');
    ip.description = 'Piston initial position';
    ip.type = ne_type('real', [1.0 1.0], 'm');
    ip.default = {[0.0],'m'};
    % 60 61
    v = schema.parameter('dead_vol');
    v.description = 'Dead volume';
    v.type = ne_type('real', [1.0 1.0], 'm^3');
    v.default = {[0.0001],'m^3'};
    % 65 66
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 70 71
    stiff = schema.parameter('stiff');
    stiff.description = 'Contact stiffness';
    stiff.type = ne_type('real', [1.0 1.0], 'N/m');
    stiff.default = 1e+06;
    % 75 76
    D = schema.parameter('D');
    D.description = 'Contact damping';
    D.type = ne_type('real', [1.0 1.0], 'N*s/m');
    D.default = 150.0;
    % 80 81
    or = schema.parameter('or');
    or.description = 'Cylinder orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 85 87
    % 86 87
    schema.setup(@setup);
end % function
function setup(root, cyl_sa)
    % 90 93
    % 91 93
    % 92 93
    x_area = cyl_sa.area.check('>', 0.0);
    x_stroke = cyl_sa.stroke.check('>', 0.0);
    x_init_pos = cyl_sa.init_pos.check('>=', 0.0);
    x_init_pos = x_init_pos.check('<=', x_stroke);
    x_dead_vol = cyl_sa.dead_vol.check('>=', 0.0);
    x_k_sh = cyl_sa.k_sh.check('>=', 1.0, cyl_sa.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, cyl_sa.k_sh.default);
    x_stiff = cyl_sa.stiff.check('>', 0.0, cyl_sa.stiff.default);
    x_D = cyl_sa.D.check('>', 0.0, cyl_sa.D.default);
    x_or = cyl_sa.or;
    % 103 106
    % 104 106
    % 105 106
    if eq(cyl_sa.or, 1.0)
        x_or_A = 1.0;
        x_gain = 1.0;
        % 109 110
        x_upper_bnd = minus(x_stroke, x_init_pos);
        x_lower_bnd = uminus(x_init_pos);
    else
        x_or_A = 2.0;
        x_gain = -1.0;
        x_upper_bnd = x_init_pos;
        x_lower_bnd = plus(uminus(x_stroke), x_init_pos);
    end % if
    % 118 120
    % 119 120
    conv = cyl_sa.element('conv', root.fl.hydraulic.elements.converter_transl);
    % 121 122
    conv.area = x_area;
    conv.or = x_or_A;
    % 124 126
    % 125 126
    v_ch = cyl_sa.element('v_ch', root.fl.hydraulic.elements.chamber_vrb);
    v_ch.area = x_area;
    v_ch.or = 1.0;
    v_ch.V_dead = plus(x_dead_vol, mtimes(x_area, x_init_pos));
    v_ch.k_sh = x_k_sh;
    % 131 133
    % 132 133
    hs = cyl_sa.element('hs', root.fl.mechanical.translational.hardstop_transl);
    hs.upper_bnd = x_upper_bnd;
    hs.lower_bnd = x_lower_bnd;
    hs.stiff_up = x_stiff;
    hs.stiff_low = x_stiff;
    hs.D_up = x_D;
    hs.D_low = x_D;
    % 140 142
    % 141 142
    s = cyl_sa.element('s', root.fl.mechanical.sensors_sources.sensor_transl_motion);
    % 143 144
    s.offset = 0.0;
    % 145 147
    % 146 147
    g = cyl_sa.element('g', root.fl.physical_signal.functions.ps_gain);
    g.gain = x_gain;
    % 149 151
    % 150 151
    s1 = cyl_sa.signal('s1', s.P);
    s2 = cyl_sa.signal('s2', g.O);
    % 153 156
    % 154 156
    % 155 156
    cyl_sa.connect(conv.C, cyl_sa.C);
    cyl_sa.connect(conv.A, cyl_sa.A);
    cyl_sa.connect(conv.R, cyl_sa.R);
    % 159 160
    cyl_sa.connect(hs.R, cyl_sa.R);
    cyl_sa.connect(hs.C, cyl_sa.C);
    % 162 163
    cyl_sa.connect(v_ch.P, s2);
    cyl_sa.connect(v_ch.A, cyl_sa.A);
    % 165 166
    cyl_sa.connect(s.R, cyl_sa.R);
    cyl_sa.connect(s.C, cyl_sa.C);
    cyl_sa.connect(s.P, cyl_sa.P);
    % 169 171
    % 170 171
    cyl_sa.connect(g.I, s1);
    % 172 173
end % function
