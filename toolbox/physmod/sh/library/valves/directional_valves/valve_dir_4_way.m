function valve_dir_4_way(root, schema)
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
    schema.descriptor = '4-Way Directional Valve';
    % 22 25
    % 23 25
    A = schema.terminal('A');
    A.description = 'Actuator terminal A';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.25]};
    % 28 30
    B = schema.terminal('B');
    B.description = 'Actuator terminal B';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Top';[0.75]};
    % 33 35
    S = schema.input('S');
    S.description = 'Valve control terminal';
    S.location = {'Bottom';[0.3]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 38 40
    P = schema.terminal('P');
    P.description = 'Pressure supply port';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Bottom';[0.6]};
    % 43 45
    T = schema.terminal('T');
    T.description = 'Return port';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Bottom';[0.9]};
    % 48 51
    % 49 51
    mdt = schema.parameter('mdl_type');
    % 51 55
    % 52 55
    % 53 55
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 57 59
    ar = schema.parameter('area_max');
    ar.description = 'Valve passage maximum area';
    ar.type = ne_type('real', [1.0 1.0], 'm^2');
    ar.default = 5e-05;
    % 62 64
    op = schema.parameter('opening_max');
    op.description = 'Valve maximum opening';
    op.type = ne_type('real', [1.0 1.0], 'm');
    op.default = .005;
    % 67 69
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated valve openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [-.002 0.0 .005 .015];
    % 72 74
    art = schema.parameter('area_tab');
    art.description = 'Tabulated valve passage area';
    art.type = ne_type('real', 'variable', 'm^2');
    art.default = [1e-12 4e-12 1e-05 1.02e-05];
    % 77 79
    prt = schema.parameter('pressure_tab');
    prt.description = 'Tabulated pressure differentials';
    prt.type = ne_type('real', 'variable', 'Pa');
    prt.default = [-5e+06 -2e+06 2e+06 5e+06];
    % 82 84
    flt = schema.parameter('flow_rate_tab');
    flt.description = 'Tabulated flow rates';
    flt.type = ne_type('real', 'variable', 'm^3/s');
    flt.default = [-1e-12 -6e-14 6e+12 1e+11 ;  -8e-08 -4e-08 4e+06 8e+06 ;  -.0025 -.00103 .001 .0024 ;  -.00258 -.001032 .00106 .00247];
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 95 97
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 100 102
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 105 107
    x_0_P_A = schema.parameter('x_0_P_A');
    x_0_P_A.description = 'Orifice P-A initial opening';
    x_0_P_A.type = ne_type('real', [1.0 1.0], 'm');
    x_0_P_A.default = 0.0;
    % 110 112
    x_0_P_B = schema.parameter('x_0_P_B');
    x_0_P_B.description = 'Orifice P-B initial opening';
    x_0_P_B.type = ne_type('real', [1.0 1.0], 'm');
    x_0_P_B.default = 0.0;
    % 115 117
    x_0_A_T = schema.parameter('x_0_A_T');
    x_0_A_T.description = 'Orifice A-T initial opening';
    x_0_A_T.type = ne_type('real', [1.0 1.0], 'm');
    x_0_A_T.default = 0.0;
    % 120 122
    x_0_B_T = schema.parameter('x_0_B_T');
    x_0_B_T.description = 'Orifice B-T initial opening';
    x_0_B_T.type = ne_type('real', [1.0 1.0], 'm');
    x_0_B_T.default = 0.0;
    % 125 127
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 130 132
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 135 140
    % 136 140
    % 137 140
    % 138 140
    schema.setup(@setup);
    % 140 142
end % function
function setup(root, valve_dir_4_way)
    % 143 147
    % 144 147
    % 145 147
    if eq(valve_dir_4_way.mdl_type, 1.0)
        x_area_max = valve_dir_4_way.area_max.check('>', 0.0);
        x_opening_max = valve_dir_4_way.opening_max.check('>', 0.0);
        x_C_d = valve_dir_4_way.C_d.check('>', 0.0, valve_dir_4_way.C_d.default);
        % 150 152
        x_Re_cr = valve_dir_4_way.Re_cr.check('>', 0.0, valve_dir_4_way.Re_cr.default);
        % 152 154
        x_A_leak = valve_dir_4_way.A_leak.check('>=', 0.0, valve_dir_4_way.A_leak.default);
        % 154 158
        % 155 158
        % 156 158
        orif_P_A = valve_dir_4_way.element('orif_P_A', root.sh.orifices.orifice_variable);
        % 158 160
        orif_P_A.mdl_type = valve_dir_4_way.mdl_type;
        orif_P_A.area_max = x_area_max;
        orif_P_A.opening_max = x_opening_max;
        orif_P_A.C_d = x_C_d;
        orif_P_A.x_0 = valve_dir_4_way.x_0_P_A;
        orif_P_A.Re_cr = x_Re_cr;
        orif_P_A.A_leak = x_A_leak;
        orif_P_A.or = 1.0;
        % 167 169
        orif_P_B = valve_dir_4_way.element('orif_P_B', root.sh.orifices.orifice_variable);
        % 169 171
        orif_P_B.mdl_type = valve_dir_4_way.mdl_type;
        orif_P_B.area_max = x_area_max;
        orif_P_B.opening_max = x_opening_max;
        orif_P_B.C_d = x_C_d;
        orif_P_B.x_0 = valve_dir_4_way.x_0_P_B;
        orif_P_B.Re_cr = x_Re_cr;
        orif_P_B.A_leak = x_A_leak;
        orif_P_B.or = 2.0;
        % 178 180
        orif_A_T = valve_dir_4_way.element('orif_A_T', root.sh.orifices.orifice_variable);
        % 180 182
        orif_A_T.mdl_type = valve_dir_4_way.mdl_type;
        orif_A_T.area_max = x_area_max;
        orif_A_T.opening_max = x_opening_max;
        orif_A_T.C_d = x_C_d;
        orif_A_T.x_0 = valve_dir_4_way.x_0_A_T;
        orif_A_T.Re_cr = x_Re_cr;
        orif_A_T.A_leak = x_A_leak;
        orif_A_T.or = 2.0;
        % 189 191
        orif_B_T = valve_dir_4_way.element('orif_B_T', root.sh.orifices.orifice_variable);
        % 191 193
        orif_B_T.mdl_type = valve_dir_4_way.mdl_type;
        orif_B_T.area_max = x_area_max;
        orif_B_T.opening_max = x_opening_max;
        orif_B_T.C_d = x_C_d;
        orif_B_T.x_0 = valve_dir_4_way.x_0_B_T;
        orif_B_T.Re_cr = x_Re_cr;
        orif_B_T.A_leak = x_A_leak;
        orif_B_T.or = 1.0;
    else
        if eq(valve_dir_4_way.mdl_type, 2.0)
            % 202 205
            % 203 205
            x_t = valve_dir_4_way.opening_tab.value;
            a_t = valve_dir_4_way.area_tab.value;
            if ne(length(x_t), length(a_t))
                error('Vector of valve openings and valve areas must have the same size!');
                % 208 210
            end % if
            num_el = length(x_t);
            if le(num_el, 3.0)
                error('The size of the table must be greater than 3!');
            end % if
            % 214 216
            for i=1.0:minus(num_el, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Orifice openings must be arranged in strictly acsending order!');
                    % 218 220
                end % if
            end % for
            x_C_d = valve_dir_4_way.C_d.check('>', 0.0, valve_dir_4_way.C_d.default);
            % 222 224
            x_Re_cr = valve_dir_4_way.Re_cr.check('>', 0.0, valve_dir_4_way.Re_cr.default);
            % 224 226
            x_A_leak = valve_dir_4_way.A_leak.check('>=', 0.0, valve_dir_4_way.A_leak.default);
            % 226 230
            % 227 230
            % 228 230
            orif_P_A = valve_dir_4_way.element('orif_P_A', root.sh.orifices.orifice_variable);
            % 230 232
            orif_P_A.mdl_type = valve_dir_4_way.mdl_type;
            orif_P_A.opening_tab = x_t;
            orif_P_A.area_tab = a_t;
            orif_P_A.interp_method = valve_dir_4_way.interp_method;
            orif_P_A.extrap_method = valve_dir_4_way.extrap_method;
            orif_P_A.C_d = x_C_d;
            orif_P_A.x_0 = valve_dir_4_way.x_0_P_A;
            orif_P_A.Re_cr = x_Re_cr;
            orif_P_A.A_leak = x_A_leak;
            orif_P_A.or = 1.0;
            % 241 243
            orif_P_B = valve_dir_4_way.element('orif_P_B', root.sh.orifices.orifice_variable);
            % 243 245
            orif_P_B.mdl_type = valve_dir_4_way.mdl_type;
            orif_P_B.opening_tab = x_t;
            orif_P_B.area_tab = a_t;
            orif_P_B.interp_method = valve_dir_4_way.interp_method;
            orif_P_B.extrap_method = valve_dir_4_way.extrap_method;
            orif_P_B.C_d = x_C_d;
            orif_P_B.x_0 = valve_dir_4_way.x_0_P_B;
            orif_P_B.Re_cr = x_Re_cr;
            orif_P_B.A_leak = x_A_leak;
            orif_P_B.or = 2.0;
            % 254 256
            orif_A_T = valve_dir_4_way.element('orif_A_T', root.sh.orifices.orifice_variable);
            % 256 258
            orif_A_T.mdl_type = valve_dir_4_way.mdl_type;
            orif_A_T.opening_tab = x_t;
            orif_A_T.area_tab = a_t;
            orif_A_T.interp_method = valve_dir_4_way.interp_method;
            orif_A_T.extrap_method = valve_dir_4_way.extrap_method;
            orif_A_T.C_d = x_C_d;
            orif_A_T.x_0 = valve_dir_4_way.x_0_A_T;
            orif_A_T.Re_cr = x_Re_cr;
            orif_A_T.A_leak = x_A_leak;
            orif_A_T.or = 2.0;
            % 267 269
            orif_B_T = valve_dir_4_way.element('orif_B_T', root.sh.orifices.orifice_variable);
            % 269 271
            orif_B_T.mdl_type = valve_dir_4_way.mdl_type;
            orif_B_T.opening_tab = x_t;
            orif_B_T.area_tab = a_t;
            orif_B_T.interp_method = valve_dir_4_way.interp_method;
            orif_B_T.extrap_method = valve_dir_4_way.extrap_method;
            orif_B_T.C_d = x_C_d;
            orif_B_T.x_0 = valve_dir_4_way.x_0_B_T;
            orif_B_T.Re_cr = x_Re_cr;
            orif_B_T.A_leak = x_A_leak;
            orif_B_T.or = 1.0;
        else
            % 281 284
            % 282 284
            x_t = valve_dir_4_way.opening_tab.value;
            p_t = valve_dir_4_way.pressure_tab.value;
            q_t = valve_dir_4_way.flow_rate_tab.value;
            num_row = length(x_t);
            num_col = length(p_t);
            num_el = numel(q_t);
            % 289 291
            if ne(mtimes(num_row, num_col), num_el)
                error('Wrong dimension of flow rate matrix!')
            end % if
            if le(num_row, 3.0) || le(num_col, 3.0)
                error('Vectors of openings and pressure differentials must have no less than 4 elements!');
                % 295 297
            end % if
            % 297 299
            for i=1.0:minus(num_row, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Vector of openings must be in strictly acsending order!')
                end % if
            end % for
            for i=1.0:minus(num_col, 1.0)
                if ge(p_t(i), p_t(plus(i, 1.0)))
                    error('Vector of pressure values must be in strictly acsending order!')
                    % 306 308
                end % if
            end % for
            % 309 311
            orif_P_A = valve_dir_4_way.element('orif_P_A', root.sh.orifices.orifice_variable);
            % 311 313
            orif_P_A.mdl_type = valve_dir_4_way.mdl_type;
            orif_P_A.opening_tab = x_t;
            orif_P_A.pressure_tab = p_t;
            orif_P_A.flow_rate_tab = q_t;
            orif_P_A.interp_method = valve_dir_4_way.interp_method;
            orif_P_A.extrap_method = valve_dir_4_way.extrap_method;
            orif_P_A.x_0 = valve_dir_4_way.x_0_P_A;
            orif_P_A.or = 1.0;
            % 320 322
            orif_P_B = valve_dir_4_way.element('orif_P_B', root.sh.orifices.orifice_variable);
            % 322 324
            orif_P_B.mdl_type = valve_dir_4_way.mdl_type;
            orif_P_B.opening_tab = x_t;
            orif_P_B.pressure_tab = p_t;
            orif_P_B.flow_rate_tab = q_t;
            orif_P_B.interp_method = valve_dir_4_way.interp_method;
            orif_P_B.extrap_method = valve_dir_4_way.extrap_method;
            orif_P_B.x_0 = valve_dir_4_way.x_0_P_B;
            orif_P_B.or = 2.0;
            % 331 333
            orif_A_T = valve_dir_4_way.element('orif_A_T', root.sh.orifices.orifice_variable);
            % 333 335
            orif_A_T.mdl_type = valve_dir_4_way.mdl_type;
            orif_A_T.opening_tab = x_t;
            orif_A_T.pressure_tab = p_t;
            orif_A_T.flow_rate_tab = q_t;
            orif_A_T.interp_method = valve_dir_4_way.interp_method;
            orif_A_T.extrap_method = valve_dir_4_way.extrap_method;
            orif_A_T.x_0 = valve_dir_4_way.x_0_A_T;
            orif_A_T.or = 2.0;
            % 342 344
            orif_B_T = valve_dir_4_way.element('orif_B_T', root.sh.orifices.orifice_variable);
            % 344 346
            orif_B_T.mdl_type = valve_dir_4_way.mdl_type;
            orif_B_T.opening_tab = x_t;
            orif_B_T.pressure_tab = p_t;
            orif_B_T.flow_rate_tab = q_t;
            orif_B_T.interp_method = valve_dir_4_way.interp_method;
            orif_B_T.extrap_method = valve_dir_4_way.extrap_method;
            orif_B_T.x_0 = valve_dir_4_way.x_0_B_T;
            orif_B_T.or = 1.0;
        end % if
        % 354 357
        % 355 357
    end % if
    valve_dir_4_way.connect(orif_P_A.S, valve_dir_4_way.S);
    valve_dir_4_way.connect(orif_P_A.A, valve_dir_4_way.P);
    valve_dir_4_way.connect(orif_P_A.B, valve_dir_4_way.A);
    valve_dir_4_way.connect(orif_P_B.S, valve_dir_4_way.S);
    valve_dir_4_way.connect(orif_P_B.A, valve_dir_4_way.P);
    valve_dir_4_way.connect(orif_P_B.B, valve_dir_4_way.B);
    % 363 365
    valve_dir_4_way.connect(orif_A_T.S, valve_dir_4_way.S);
    valve_dir_4_way.connect(orif_A_T.A, valve_dir_4_way.A);
    valve_dir_4_way.connect(orif_A_T.B, valve_dir_4_way.T);
    % 367 369
    valve_dir_4_way.connect(orif_B_T.S, valve_dir_4_way.S);
    valve_dir_4_way.connect(orif_B_T.A, valve_dir_4_way.B);
    valve_dir_4_way.connect(orif_B_T.B, valve_dir_4_way.T);
    % 371 373
end % function
