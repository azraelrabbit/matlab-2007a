function valve_dir_3_way(root, schema)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    schema.descriptor = '3-Way Directional Valve';
    % 21 24
    % 22 24
    A = schema.terminal('A');
    A.description = 'Actuator terminal';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.75]};
    % 27 29
    S = schema.input('S');
    S.description = 'Valve control terminal';
    S.location = {'Bottom';[0.3]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 32 34
    P = schema.terminal('P');
    P.description = 'Valve inlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Bottom';[0.6]};
    % 37 39
    T = schema.terminal('T');
    T.description = 'Valve outlet';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Bottom';[0.9]};
    % 42 45
    % 43 45
    mdt = schema.parameter('mdl_type');
    % 45 49
    % 46 49
    % 47 49
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 51 53
    ar = schema.parameter('area_max');
    ar.description = 'Valve passage maximum area';
    ar.type = ne_type('real', [1.0 1.0], 'm^2');
    ar.default = 5e-05;
    % 56 58
    op = schema.parameter('opening_max');
    op.description = 'Valve maximum opening';
    op.type = ne_type('real', [1.0 1.0], 'm');
    op.default = .005;
    % 61 63
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated valve openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [-.002 0.0 .005 .015];
    % 66 68
    art = schema.parameter('area_tab');
    art.description = 'Tabulated valve passage area';
    art.type = ne_type('real', 'variable', 'm^2');
    art.default = [1e-12 4e-12 1e-05 1.02e-05];
    % 71 73
    prt = schema.parameter('pressure_tab');
    prt.description = 'Tabulated pressure differentials';
    prt.type = ne_type('real', 'variable', 'Pa');
    prt.default = [-5e+06 -2e+06 2e+06 5e+06];
    % 76 79
    % 77 79
    flt = schema.parameter('flow_rate_tab');
    flt.description = 'Tabulated flow rates';
    flt.type = ne_type('real', 'variable', 'm^3/s');
    flt.default = [-1e-12 -6e-14 6e+12 1e+11 ;  -8e-08 -4e-08 4e+06 8e+06 ;  -.0025 -.00103 .001 .0024 ;  -.00258 -.001032 .00106 .00247];
    % 82 87
    % 83 87
    % 84 87
    % 85 87
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 90 92
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 95 97
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 100 102
    x_0_P = schema.parameter('x_0_P');
    x_0_P.description = 'Orifice P-A initial opening';
    x_0_P.type = ne_type('real', [1.0 1.0], 'm');
    x_0_P.default = 0.0;
    % 105 107
    x_0_T = schema.parameter('x_0_T');
    x_0_T.description = 'Orifice A-T initial opening';
    x_0_T.type = ne_type('real', [1.0 1.0], 'm');
    x_0_T.default = 0.0;
    % 110 112
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 115 117
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 120 125
    % 121 125
    % 122 125
    % 123 125
    schema.setup(@setup);
    % 125 127
end % function
function setup(root, valve_dir_3_way)
    % 128 132
    % 129 132
    % 130 132
    if eq(valve_dir_3_way.mdl_type, 1.0)
        x_area_max = valve_dir_3_way.area_max.check('>', 0.0);
        x_opening_max = valve_dir_3_way.opening_max.check('>', 0.0);
        x_C_d = valve_dir_3_way.C_d.check('>', 0.0, valve_dir_3_way.C_d.default);
        % 135 137
        x_Re_cr = valve_dir_3_way.Re_cr.check('>', 0.0, valve_dir_3_way.Re_cr.default);
        % 137 139
        x_A_leak = valve_dir_3_way.A_leak.check('>=', 0.0, valve_dir_3_way.A_leak.default);
        % 139 143
        % 140 143
        % 141 143
        orif_P = valve_dir_3_way.element('orif_P', root.sh.orifices.orifice_variable);
        % 143 145
        orif_P.mdl_type = valve_dir_3_way.mdl_type;
        orif_P.area_max = x_area_max;
        orif_P.opening_max = x_opening_max;
        orif_P.C_d = x_C_d;
        orif_P.x_0 = valve_dir_3_way.x_0_P;
        orif_P.Re_cr = x_Re_cr;
        orif_P.A_leak = x_A_leak;
        orif_P.or = 1.0;
        % 152 154
        orif_T = valve_dir_3_way.element('orif_T', root.sh.orifices.orifice_variable);
        % 154 156
        orif_T.area_max = x_area_max;
        orif_T.opening_max = x_opening_max;
        orif_T.C_d = x_C_d;
        orif_T.x_0 = valve_dir_3_way.x_0_T;
        orif_T.Re_cr = x_Re_cr;
        orif_T.A_leak = x_A_leak;
        orif_T.or = 2.0;
    else
        if eq(valve_dir_3_way.mdl_type, 2.0)
            % 164 167
            % 165 167
            x_t = valve_dir_3_way.opening_tab.value;
            a_t = valve_dir_3_way.area_tab.value;
            if ne(length(x_t), length(a_t))
                error('Vector of valve openings and valve areas must have the same size!');
                % 170 172
            end % if
            num_el = length(x_t);
            if le(num_el, 3.0)
                error('The size of the table must be greater than 3!');
            end % if
            % 176 178
            for i=1.0:minus(num_el, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Orifice openings must be arranged in strictly acsending order!');
                    % 180 182
                end % if
            end % for
            x_C_d = valve_dir_3_way.C_d.check('>', 0.0, valve_dir_3_way.C_d.default);
            % 184 186
            x_Re_cr = valve_dir_3_way.Re_cr.check('>', 0.0, valve_dir_3_way.Re_cr.default);
            % 186 188
            x_A_leak = valve_dir_3_way.A_leak.check('>=', 0.0, valve_dir_3_way.A_leak.default);
            % 188 192
            % 189 192
            % 190 192
            orif_P = valve_dir_3_way.element('orif_P', root.sh.orifices.orifice_variable);
            % 192 194
            orif_P.mdl_type = valve_dir_3_way.mdl_type;
            orif_P.opening_tab = x_t;
            orif_P.area_tab = a_t;
            orif_P.interp_method = valve_dir_3_way.interp_method;
            orif_P.extrap_method = valve_dir_3_way.extrap_method;
            orif_P.C_d = x_C_d;
            orif_P.x_0 = valve_dir_3_way.x_0_P;
            orif_P.Re_cr = x_Re_cr;
            orif_P.A_leak = x_A_leak;
            orif_P.or = 1.0;
            % 203 205
            orif_T = valve_dir_3_way.element('orif_T', root.sh.orifices.orifice_variable);
            % 205 207
            orif_T.mdl_type = valve_dir_3_way.mdl_type;
            orif_T.opening_tab = x_t;
            orif_T.area_tab = a_t;
            orif_T.interp_method = valve_dir_3_way.interp_method;
            orif_T.extrap_method = valve_dir_3_way.extrap_method;
            orif_T.C_d = x_C_d;
            orif_T.x_0 = valve_dir_3_way.x_0_T;
            orif_T.Re_cr = x_Re_cr;
            orif_T.A_leak = x_A_leak;
            orif_T.or = 2.0;
        else
            % 217 220
            % 218 220
            x_t = valve_dir_3_way.opening_tab.value;
            p_t = valve_dir_3_way.pressure_tab.value;
            q_t = valve_dir_3_way.flow_rate_tab.value;
            num_row = length(x_t);
            num_col = length(p_t);
            num_el = numel(q_t);
            % 225 227
            if ne(mtimes(num_row, num_col), num_el)
                error('Wrong dimension of flow rate matrix!')
            end % if
            if le(num_row, 3.0) || le(num_col, 3.0)
                error('Vectors of openings and pressure differentials must have no less than 4 elements!');
                % 231 233
            end % if
            % 233 235
            for i=1.0:minus(num_row, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Vector of openings must be in strictly acsending order!')
                end % if
            end % for
            for i=1.0:minus(num_col, 1.0)
                if ge(p_t(i), p_t(plus(i, 1.0)))
                    error('Vector of pressure values must be in strictly acsending order!')
                    % 242 244
                end % if
            end % for
            % 245 247
            orif_P = valve_dir_3_way.element('orif_P', root.sh.orifices.orifice_variable);
            % 247 249
            orif_P.mdl_type = valve_dir_3_way.mdl_type;
            orif_P.opening_tab = x_t;
            orif_P.pressure_tab = p_t;
            orif_P.flow_rate_tab = q_t;
            orif_P.interp_method = valve_dir_3_way.interp_method;
            orif_P.extrap_method = valve_dir_3_way.extrap_method;
            orif_P.x_0 = valve_dir_3_way.x_0_P;
            orif_P.or = 1.0;
            % 256 258
            orif_T = valve_dir_3_way.element('orif_T', root.sh.orifices.orifice_variable);
            % 258 260
            orif_T.mdl_type = valve_dir_3_way.mdl_type;
            orif_T.opening_tab = x_t;
            orif_T.pressure_tab = p_t;
            orif_T.flow_rate_tab = q_t;
            orif_T.interp_method = valve_dir_3_way.interp_method;
            orif_T.extrap_method = valve_dir_3_way.extrap_method;
            orif_T.x_0 = valve_dir_3_way.x_0_T;
            orif_T.or = 2.0;
        end % if
        % 268 271
        % 269 271
    end % if
    valve_dir_3_way.connect(orif_P.S, valve_dir_3_way.S);
    valve_dir_3_way.connect(orif_P.A, valve_dir_3_way.P);
    valve_dir_3_way.connect(orif_P.B, valve_dir_3_way.A);
    valve_dir_3_way.connect(orif_T.S, valve_dir_3_way.S);
    valve_dir_3_way.connect(orif_T.A, valve_dir_3_way.A);
    valve_dir_3_way.connect(orif_T.B, valve_dir_3_way.T);
    % 277 279
end % function
