function valve_hydr_force(root, schema)
    % 1 29
    % 2 29
    % 3 29
    % 4 29
    % 5 29
    % 6 29
    % 7 29
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    schema.descriptor = 'Valve Hydraulic Force';
    % 30 32
    % 31 32
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.label = 'A';
    A.location = {'Left',[0.25]};
    % 37 38
    S = schema.input('S');
    S.description = 'Valve displacement';
    S.location = {'Left';[0.75]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 42 43
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.25]};
    % 47 48
    F = schema.output('F');
    F.description = 'Axial hydraulic force';
    F.type = ne_type('real', [1.0 1.0], 'N');
    F.label = 'F';
    F.location = {'right',[0.75]};
    % 53 56
    % 54 56
    % 55 56
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 60 61
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 65 66
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated valve openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [0.0 .001 .002 .003 .004];
    % 70 71
    prt = schema.parameter('pressure_tab');
    prt.description = 'Tabulated pressure differentials';
    prt.type = ne_type('real', 'variable', 'Pa');
    prt.default = [-1e+07 -7500000.0 -5e+06 -2500000.0 0.0 2500000.0 5e+06 7500000.0 1e+07];
    % 75 78
    % 76 78
    % 77 78
    frt = schema.parameter('force_tab');
    frt.description = 'Hydraulic axial force table';
    frt.type = ne_type('real', 'variable', 'N');
    frt.default = [0.0 -127.3576 -27.8944 227.2513 575.3104 ;  0.0 -95.5182 -20.9208 170.4385 431.4828 ;  0.0 -63.6788 -13.9472 113.6256 287.6552 ;  0.0 -31.8394 -6.9736 56.8128 143.8276 ;  0.0 0.0 0.0 0.0 0.0 ;  196.3495 120.7506 97.5709 111.9898 150.9306 ;  392.6991 241.5013 195.1418 223.9797 301.8613 ;  589.0486 362.2519 292.7126 335.9695 452.7919 ;  785.3982 483.0025 390.2835 447.9594 603.7225];
    % 82 91
    % 83 91
    % 84 91
    % 85 91
    % 86 91
    % 87 91
    % 88 91
    % 89 91
    % 90 91
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 95 96
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 100 103
    % 101 103
    % 102 103
    var_int_px = schema.local_variable('pressure_diff');
    var_int_px.description = 'Valve pressure differential';
    % 105 106
    var_int_py = schema.local_variable('opening');
    var_int_py.description = 'Valve opening (m)';
    % 108 109
    var_int_f = schema.local_variable('axial_force');
    var_int_f.description = 'Hydraulic axial force (N)';
    % 111 112
    schema.setup(@setup);
    % 113 114
end % function
function setup(root, vlv_hydr_frc)
    % 116 118
    % 117 118
    vlv_hydr_frc.branch_across('p', vlv_hydr_frc.A.p, vlv_hydr_frc.B.p);
    vlv_hydr_frc.branch_through('q', vlv_hydr_frc.A.q, vlv_hydr_frc.B.q);
    % 120 124
    % 121 124
    % 122 124
    % 123 124
    x_or = vlv_hydr_frc.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    vlv_hydr_frc.parameter('x_or', x_or);
    % 129 131
    % 130 131
    vlv_op = vlv_hydr_frc.source('vlv_op', ne_type('real', [1.0 1.0], 'm'));
    vlv_pr_drop = vlv_hydr_frc.source('vlv_pr_drop', ne_type('real', [1.0 1.0], 'Pa'));
    % 133 135
    % 134 135
    x_t = vlv_hydr_frc.opening_tab.value;
    p_t = vlv_hydr_frc.pressure_tab.value;
    f_t = vlv_hydr_frc.force_tab.value;
    % 138 143
    % 139 143
    % 140 143
    % 141 143
    % 142 143
    tlu_2 = vlv_hydr_frc.element('tlu_2', root.fl.physical_signal.lookup_tables.ps_2d_tlu);
    % 144 145
    tlu_2.x_t = p_t;
    tlu_2.y_t = x_t;
    tlu_2.z_t = f_t;
    tlu_2.interp_method = vlv_hydr_frc.interp_method;
    tlu_2.extrap_method = vlv_hydr_frc.extrap_method;
    % 150 151
    gain = vlv_hydr_frc.element('gain', root.fl.physical_signal.functions.ps_gain);
    % 152 153
    gain.gain = x_or;
    % 154 157
    % 155 157
    % 156 157
    s1 = vlv_hydr_frc.signal('s1', tlu_2.O);
    % 158 160
    % 159 160
    vlv_hydr_frc.connect(tlu_2.I1, vlv_hydr_frc.vlv_pr_drop);
    vlv_hydr_frc.connect(tlu_2.I2, vlv_hydr_frc.vlv_op);
    % 162 164
    % 163 164
    vlv_hydr_frc.connect(gain.I, s1);
    vlv_hydr_frc.connect(gain.O, vlv_hydr_frc.F);
    % 166 168
    % 167 168
    vlv_hydr_frc.equation(@equation);
end % function
function e = equation(sys, vlv_hydr_frc)
    % 171 173
    % 172 173
    e = sys.equation;
    % 174 176
    % 175 176
    x_0 = vlv_hydr_frc.x_0;
    or = vlv_hydr_frc.x_or;
    % 178 180
    % 179 180
    opening = plus(x_0, mtimes(vlv_hydr_frc.S, or));
    pressure_diff = vlv_hydr_frc.p;
    axial_force = vlv_hydr_frc.F;
    % 183 184
    e(1.0) = vlv_hydr_frc.q;
    e(2.0) = minus(opening, vlv_hydr_frc.vlv_op);
    e(3.0) = minus(pressure_diff, vlv_hydr_frc.vlv_pr_drop);
    % 187 188
end % function
