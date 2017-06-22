function orifice_variable(root, schema)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    schema.descriptor = 'Variable Orifice';
    % 22 25
    % 23 25
    S = schema.input('S');
    S.description = 'Spool control terminal';
    S.location = {'Left';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 28 30
    A = schema.terminal('A');
    A.description = 'Orifice inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 33 35
    B = schema.terminal('B');
    B.description = 'Orifice outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 38 41
    % 39 41
    mdt = schema.parameter('mdl_type');
    % 41 45
    % 42 45
    % 43 45
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 47 49
    ar = schema.parameter('area_max');
    ar.description = 'Orifice maximum area';
    ar.type = ne_type('real', [1.0 1.0], 'm^2');
    ar.default = 5e-05;
    % 52 54
    op = schema.parameter('opening_max');
    op.description = 'Orifice maximum opening';
    op.type = ne_type('real', [1.0 1.0], 'm');
    op.default = .005;
    % 57 59
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated orifice openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [-.002 0.0 .005 .015];
    % 62 64
    art = schema.parameter('area_tab');
    art.description = 'Tabulated orifice area';
    art.type = ne_type('real', 'variable', 'm^2');
    art.default = [1e-12 4e-12 1e-05 1.02e-05];
    % 67 69
    prt = schema.parameter('pressure_tab');
    prt.description = 'Tabulated pressure differentials';
    prt.type = ne_type('real', 'variable', 'Pa');
    prt.default = [-5e+06 -2e+06 2e+06 5e+06];
    % 72 75
    % 73 75
    flt = schema.parameter('flow_rate_tab');
    flt.description = 'Tabulated flow rates';
    flt.type = ne_type('real', 'variable', 'm^3/s');
    flt.default = [-1e-12 -6e-14 6e+12 1e+11 ;  -8e-08 -4e-08 4e+06 8e+06 ;  -.0025 -.00103 .001 .0024 ;  -.00258 -.001032 .00106 .00247];
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 86 88
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 91 93
    or = schema.parameter('or');
    or.description = 'Orifice orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 96 98
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 101 103
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 106 108
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 111 113
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 116 119
    % 117 119
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the orifice (m^3)';
    % 120 122
    var_int_pr = schema.local_variable('pr_drop');
    var_int_pr.description = 'Pressure drop across the orifice (Pa)';
    % 123 125
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 126 128
    var_int_b = schema.local_variable('orif_opening');
    var_int_b.description = 'Orifice opening (m)';
    % 129 131
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the orifice (W)';
    % 132 134
    schema.setup(@setup);
    % 134 136
end % function
function setup(root, or_var)
    % 137 141
    % 138 141
    % 139 141
    if eq(or_var.or, 2.0)
        x_or = -1.0;
    else
        x_or = 1.0;
    end % if
    or_var.parameter('x_or', x_or);
    % 146 150
    % 147 150
    % 148 150
    if eq(or_var.mdl_type, 1.0)
        x_area_max = or_var.area_max.check('>', 0.0);
        x_opening_max = or_var.opening_max.check('>', 0.0);
        x_C_d = or_var.C_d.check('>', 0.0, or_var.C_d.default);
        x_Re_cr = or_var.Re_cr.check('>', 0.0, or_var.Re_cr.default);
        x_A_leak = or_var.A_leak.check('>=', 0.0, or_var.A_leak.default);
    else
        if eq(or_var.mdl_type, 2.0)
            % 157 159
            x_t = or_var.opening_tab.value;
            a_t = or_var.area_tab.value;
            if ne(length(x_t), length(a_t))
                error('Vector of orifice openings and orifice areas must have the same size!');
                % 162 164
            end % if
            num_el = length(x_t);
            if le(num_el, 3.0)
                error('The size of the table must be greater than 3!');
            end % if
            % 168 170
            for i=1.0:minus(num_el, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Orifice openings must be arranged in strictly acsending order!');
                    % 172 174
                end % if
            end % for
            x_C_d = or_var.C_d.check('>', 0.0, or_var.C_d.default);
            x_Re_cr = or_var.Re_cr.check('>', 0.0, or_var.Re_cr.default);
            x_A_leak = or_var.A_leak.check('>=', 0.0, or_var.A_leak.default);
        else
            % 179 181
            x_t = or_var.opening_tab.value;
            p_t = or_var.pressure_tab.value;
            q_t = or_var.flow_rate_tab.value;
            num_row = length(x_t);
            num_col = length(p_t);
            num_el = numel(q_t);
            [m_row, n_col] = size(q_t);
            % 187 189
            if ne(num_row, m_row) || ne(num_col, n_col)
                error('Wrong dimension of flow rate matrix!')
            end % if
            if le(num_row, 3.0) || le(num_col, 3.0)
                error('Vectors of openings and pressure differentials must have no less than 4 elements!');
                % 193 195
            end % if
            % 195 197
            for i=1.0:minus(num_row, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Vector of openings must be in strictly acsending order!')
                end % if
            end % for
            for i=1.0:minus(num_col, 1.0)
                if ge(p_t(i), p_t(plus(i, 1.0)))
                    error('Vector of pressure values must be in strictly acsending order!')
                    % 204 206
                end % if
            end % for
        end % if
        % 208 213
        % 209 213
        % 210 213
        % 211 213
    end % if
    inp_src = or_var.source('inp_src', ne_type('real', [1.0 1.0], 'm'));
    % 214 217
    % 215 217
    if eq(or_var.mdl_type, 1.0)
        % 217 221
        % 218 221
        % 219 221
        x_w = mrdivide(x_area_max, x_opening_max);
        % 221 225
        % 222 225
        % 223 225
        sat = or_var.element('sat', root.fl.physical_signal.nonlinear.ps_saturation);
        sat.upper_limit = x_opening_max;
        sat.lower_limit = uminus(x_opening_max);
        % 227 229
        orif = or_var.element('orif', root.sh.orifices.orifice_vrb_slot);
        orif.w = x_w;
        orif.C_d = x_C_d;
        orif.x_0 = 0.0;
        orif.or = 1.0;
        orif.Re_cr = x_Re_cr;
        orif.A_leak = x_A_leak;
        % 235 238
        % 236 238
        s1 = or_var.signal('s1', sat.O);
        % 238 242
        % 239 242
        % 240 242
        or_var.connect(sat.I, or_var.inp_src);
        % 242 245
        % 243 245
        or_var.connect(orif.S, s1);
        or_var.connect(orif.A, or_var.A);
        or_var.connect(orif.B, or_var.B);
    else
        if eq(or_var.mdl_type, 2.0)
            % 249 254
            % 250 254
            % 251 254
            % 252 254
            x_w = 1.0;
            % 254 257
            % 255 257
            tlu_1 = or_var.element('tlu_1', root.fl.physical_signal.lookup_tables.ps_1d_tlu);
            % 257 259
            tlu_1.x_t = x_t;
            tlu_1.y_t = a_t;
            tlu_1.interp_method = or_var.interp_method;
            tlu_1.extrap_method = or_var.extrap_method;
            % 262 264
            orif = or_var.element('orif', root.sh.orifices.orifice_vrb_slot);
            orif.w = x_w;
            orif.C_d = x_C_d;
            orif.x_0 = 0.0;
            orif.or = 1.0;
            % 268 270
            orif.Re_cr = x_Re_cr;
            orif.A_leak = x_A_leak;
            % 271 274
            % 272 274
            s1 = or_var.signal('s1', tlu_1.O);
            % 274 278
            % 275 278
            % 276 278
            or_var.connect(tlu_1.I, or_var.inp_src);
            % 278 281
            % 279 281
            or_var.connect(orif.S, s1);
            or_var.connect(orif.A, or_var.A);
            or_var.connect(orif.B, or_var.B);
        else
            % 284 291
            % 285 291
            % 286 291
            % 287 291
            % 288 291
            % 289 291
            tlu_2 = or_var.element('tlu_2', root.fl.physical_signal.lookup_tables.ps_2d_tlu);
            % 291 293
            tlu_2.x_t = x_t;
            tlu_2.y_t = p_t;
            tlu_2.z_t = q_t;
            tlu_2.interp_method = or_var.interp_method;
            tlu_2.extrap_method = or_var.extrap_method;
            % 297 299
            ps = or_var.element('ps', root.fl.hydraulic.sensors_sources.sensor_pressure);
            % 299 302
            % 300 302
            fs = or_var.element('fs', root.fl.hydraulic.sensors_sources.flow_rate_src);
            % 302 306
            % 303 306
            % 304 306
            s1 = or_var.signal('s1', tlu_2.O);
            s2 = or_var.signal('s2', ps.P);
            % 307 311
            % 308 311
            % 309 311
            or_var.connect(tlu_2.I1, or_var.inp_src);
            or_var.connect(tlu_2.I2, s2);
            % 312 315
            % 313 315
            or_var.connect(ps.A, or_var.A);
            or_var.connect(ps.B, or_var.B);
            % 316 319
            % 317 319
            or_var.connect(fs.T, or_var.A);
            or_var.connect(fs.P, or_var.B);
            or_var.connect(fs.S, s1);
        end % if
        % 322 324
    end % if
    or_var.equation(@equation);
end % function
function e = equation(sys, or_var)
    % 327 329
    e = sys.equation;
    % 329 332
    % 330 332
    x_0 = or_var.x_0;
    or = or_var.x_or;
    % 333 336
    % 334 336
    cnt_memb = or_var.S;
    % 336 338
    e(1.0) = minus(plus(x_0, mtimes(cnt_memb, or)), or_var.inp_src);
    % 338 340
end % function
