function flow_cntr_vlv_pc(root, schema)
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
    schema.descriptor = 'Pressure-Compensated Flow Control Valve';
    % 21 23
    % 22 23
    C = schema.input('C');
    C.description = 'Valve control terminal';
    C.location = {'Left';[0.25]};
    C.type = ne_type('real', [1.0 1.0], 'm');
    % 27 28
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 32 33
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 37 39
    % 38 39
    mdt = schema.parameter('mdl_type');
    % 40 42
    % 41 42
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 45 46
    ar = schema.parameter('area_max');
    ar.description = 'Orifice maximum area';
    ar.type = ne_type('real', [1.0 1.0], 'm^2');
    ar.default = 5e-05;
    % 50 51
    op = schema.parameter('opening_max');
    op.description = 'Orifice maximum opening';
    op.type = ne_type('real', [1.0 1.0], 'm');
    op.default = .005;
    % 55 56
    pr_dif = schema.parameter('pr_dif');
    pr_dif.description = 'Pressure differential across the orifice';
    pr_dif.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_dif.default = 600000.0;
    % 60 61
    reg_range = schema.parameter('reg_range');
    reg_range.description = 'Pressure reducing valve regulation range';
    reg_range.type = ne_type('real', [1.0 1.0], 'Pa');
    reg_range.default = 50000.0;
    % 65 66
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 70 71
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 75 76
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 80 81
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated orifice openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [-.002 0.0 .005 .015];
    % 85 86
    art = schema.parameter('area_tab');
    art.description = 'Tabulated orifice area';
    art.type = ne_type('real', 'variable', 'm^2');
    art.default = [1e-12 4e-12 1e-05 1.02e-05];
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
    % 100 101
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 105 109
    % 106 109
    % 107 109
    % 108 109
    schema.setup(@setup);
    % 110 111
end % function
function setup(root, fl_contr_pc)
    % 113 116
    % 114 116
    % 115 116
    x_pr_dif = fl_contr_pc.pr_dif.check('>', 0.0);
    x_reg_range = fl_contr_pc.reg_range.check('>', 0.0);
    x_reg_range = fl_contr_pc.reg_range.check('<', fl_contr_pc.pr_dif.default);
    % 119 120
    if eq(fl_contr_pc.mdl_type, 1.0)
        x_area_max = fl_contr_pc.area_max.check('>', 0.0);
        x_opening_max = fl_contr_pc.opening_max.check('>', 0.0);
        x_C_d = fl_contr_pc.C_d.check('>', 0.0, fl_contr_pc.C_d.default);
        x_Re_cr = fl_contr_pc.Re_cr.check('>', 0.0, fl_contr_pc.Re_cr.default);
        x_A_leak = fl_contr_pc.A_leak.check('>=', 0.0, fl_contr_pc.A_leak.default);
    else
        % 127 129
        % 128 129
        x_t = fl_contr_pc.opening_tab.value;
        a_t = fl_contr_pc.area_tab.value;
        if ne(length(x_t), length(a_t))
            error('Vector of orifice openings and orifice areas must have the same size!');
            % 133 134
        end % if
        num_el = length(x_t);
        if le(num_el, 3.0)
            error('The size of the table must be greater than 3!');
        end % if
        % 139 140
        for i=1.0:minus(num_el, 1.0)
            if ge(x_t(i), x_t(plus(i, 1.0)))
                error('Orifice openings must be arranged in strictly acsending order!');
                % 143 144
            end % if
        end % for
        x_C_d = fl_contr_pc.C_d.check('>', 0.0, fl_contr_pc.C_d.default);
        x_Re_cr = fl_contr_pc.Re_cr.check('>', 0.0, fl_contr_pc.Re_cr.default);
        x_A_leak = fl_contr_pc.A_leak.check('>=', 0.0, fl_contr_pc.A_leak.default);
    end % if
    % 150 154
    % 151 154
    % 152 154
    % 153 154
    inp_src = fl_contr_pc.source('inp_src', ne_type('real', [1.0 1.0], 'm'));
    % 155 157
    % 156 157
    pr_comp = fl_contr_pc.element('pr_comp', root.sh.valves.pressure_control_valves.pressure_compensator);
    % 158 159
    pr_comp.area_max = mtimes(x_area_max, 1.5);
    pr_comp.pres_set = x_pr_dif;
    pr_comp.reg_range = x_reg_range;
    pr_comp.Re_cr = x_Re_cr;
    pr_comp.C_d = x_C_d;
    pr_comp.A_leak = x_A_leak;
    % 165 167
    % 166 167
    if eq(fl_contr_pc.mdl_type, 1.0)
        x_w = mrdivide(x_area_max, x_opening_max);
    else
        x_w = 1.0;
    end % if
    % 172 173
    orif = fl_contr_pc.element('orif', root.sh.orifices.orifice_vrb_slot);
    % 174 175
    orif.w = x_w;
    orif.C_d = x_C_d;
    orif.x_0 = fl_contr_pc.x_0;
    orif.Re_cr = x_Re_cr;
    orif.A_leak = x_A_leak;
    % 180 182
    % 181 182
    ch_1 = fl_contr_pc.node('ch_1', root.fl.hydraulic.hydraulic);
    % 183 184
    if eq(fl_contr_pc.mdl_type, 1.0)
        % 185 187
        % 186 187
        sat = fl_contr_pc.element('sat', root.fl.physical_signal.nonlinear.ps_saturation);
        sat.upper_limit = x_opening_max;
        sat.lower_limit = uminus(x_opening_max);
        % 190 192
        % 191 192
        s_1 = fl_contr_pc.signal('s_1', sat.O);
    else
        % 194 197
        % 195 197
        % 196 197
        tlu_1 = fl_contr_pc.element('tlu_1', root.fl.physical_signal.lookup_tables.ps_1d_tlu);
        % 198 199
        tlu_1.x_t = x_t;
        tlu_1.y_t = a_t;
        tlu_1.interp_method = fl_contr_pc.interp_method;
        tlu_1.extrap_method = fl_contr_pc.extrap_method;
        % 203 205
        % 204 205
        s_1 = fl_contr_pc.signal('s_1', tlu_1.O);
    end % if
    % 207 208
    if eq(fl_contr_pc.mdl_type, 1.0)
        % 209 210
        fl_contr_pc.connect(sat.I, fl_contr_pc.inp_src);
    else
        % 212 213
        fl_contr_pc.connect(tlu_1.I, fl_contr_pc.inp_src);
    end % if
    % 215 216
    fl_contr_pc.connect(pr_comp.A, fl_contr_pc.A);
    fl_contr_pc.connect(pr_comp.B, ch_1);
    fl_contr_pc.connect(pr_comp.X, ch_1);
    fl_contr_pc.connect(pr_comp.Y, fl_contr_pc.B);
    % 220 221
    fl_contr_pc.connect(orif.S, s_1);
    fl_contr_pc.connect(orif.A, ch_1);
    fl_contr_pc.connect(orif.B, fl_contr_pc.B);
    % 224 225
    fl_contr_pc.equation(@equation);
end % function
function e = equation(sys, fl_contr_pc)
    % 228 230
    % 229 230
    e = sys.equation;
    % 231 233
    % 232 233
    x_0 = fl_contr_pc.x_0;
    % 234 236
    % 235 236
    cnt_memb = fl_contr_pc.C;
    % 237 238
    e(1.0) = minus(plus(x_0, cnt_memb), fl_contr_pc.inp_src);
    % 239 240
end % function
