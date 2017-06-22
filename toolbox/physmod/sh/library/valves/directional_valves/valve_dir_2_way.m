function valve_dir_2_way(root, schema)
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
    schema.descriptor = '2-Way Directional Valve';
    % 21 24
    % 22 24
    S = schema.input('S');
    S.description = 'Valve control terminal';
    S.location = {'Left';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'm');
    % 27 29
    A = schema.terminal('A');
    A.description = 'Valve inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.75]};
    % 32 34
    B = schema.terminal('B');
    B.description = 'Valve outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 37 40
    % 38 40
    mdt = schema.parameter('mdl_type');
    % 40 44
    % 41 44
    % 42 44
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 46 48
    ar = schema.parameter('area_max');
    ar.description = 'Valve passage maximum area';
    ar.type = ne_type('real', [1.0 1.0], 'm^2');
    ar.default = 5e-05;
    % 51 53
    op = schema.parameter('opening_max');
    op.description = 'Valve maximum opening';
    op.type = ne_type('real', [1.0 1.0], 'm');
    op.default = .005;
    % 56 58
    opt = schema.parameter('opening_tab');
    opt.description = 'Tabulated valve openings';
    opt.type = ne_type('real', 'variable', 'm');
    opt.default = [-.002 0.0 .005 .015];
    % 61 63
    art = schema.parameter('area_tab');
    art.description = 'Tabulated valve passage area';
    art.type = ne_type('real', 'variable', 'm^2');
    art.default = [1e-12 4e-12 1e-05 1.02e-05];
    % 66 68
    prt = schema.parameter('pressure_tab');
    prt.description = 'Tabulated pressure differentials';
    prt.type = ne_type('real', 'variable', 'Pa');
    prt.default = [-5e+06 -2e+06 2e+06 5e+06];
    % 71 74
    % 72 74
    flt = schema.parameter('flow_rate_tab');
    flt.description = 'Tabulated flow rates';
    flt.type = ne_type('real', 'variable', 'm^3/s');
    flt.default = [-1e-12 -6e-14 6e+12 1e+11 ;  -8e-08 -4e-08 4e+06 8e+06 ;  -.0025 -.00103 .001 .0024 ;  -.00258 -.001032 .00106 .00247];
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 85 87
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 90 92
    C_d = schema.parameter('C_d');
    C_d.description = 'Flow discharge coefficient';
    C_d.type = ne_type('real', [1.0 1.0], '1');
    C_d.default = .7;
    % 95 97
    x_0 = schema.parameter('x_0');
    x_0.description = 'Initial opening';
    x_0.type = ne_type('real', [1.0 1.0], 'm');
    x_0.default = 0.0;
    % 100 102
    Re_cr = schema.parameter('Re_cr');
    Re_cr.description = 'Critical Reynolds number';
    Re_cr.type = ne_type('real', [1.0 1.0], '1');
    Re_cr.default = 12.0;
    % 105 107
    A_leak = schema.parameter('A_leak');
    A_leak.description = 'Leakage area';
    A_leak.type = ne_type('real', [1.0 1.0], 'm^2');
    A_leak.default = 1e-12;
    % 110 114
    % 111 114
    % 112 114
    schema.setup(@setup);
    % 114 116
end % function
function setup(root, valve_dir_2_way)
    % 117 121
    % 118 121
    % 119 121
    if eq(valve_dir_2_way.mdl_type, 1.0)
        x_area_max = valve_dir_2_way.area_max.check('>', 0.0);
        x_opening_max = valve_dir_2_way.opening_max.check('>', 0.0);
        x_C_d = valve_dir_2_way.C_d.check('>', 0.0, valve_dir_2_way.C_d.default);
        % 124 126
        x_Re_cr = valve_dir_2_way.Re_cr.check('>', 0.0, valve_dir_2_way.Re_cr.default);
        % 126 128
        x_A_leak = valve_dir_2_way.A_leak.check('>=', 0.0, valve_dir_2_way.A_leak.default);
        % 128 132
        % 129 132
        % 130 132
        orif_var = valve_dir_2_way.element('orif_var', root.sh.orifices.orifice_variable);
        % 132 135
        % 133 135
        orif_var.mdl_type = valve_dir_2_way.mdl_type;
        orif_var.area_max = x_area_max;
        orif_var.opening_max = x_opening_max;
        orif_var.C_d = x_C_d;
        orif_var.x_0 = valve_dir_2_way.x_0;
        orif_var.Re_cr = x_Re_cr;
        orif_var.A_leak = x_A_leak;
        orif_var.or = 1.0;
    else
        if eq(valve_dir_2_way.mdl_type, 2.0)
            % 144 147
            % 145 147
            x_t = valve_dir_2_way.opening_tab.value;
            a_t = valve_dir_2_way.area_tab.value;
            if ne(length(x_t), length(a_t))
                error('Vector of valve openings and valve areas must have the same size!');
                % 150 152
            end % if
            num_el = length(x_t);
            if le(num_el, 3.0)
                error('The size of the table must be greater than 3!');
            end % if
            % 156 158
            for i=1.0:minus(num_el, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Orifice openings must be arranged in strictly acsending order!');
                    % 160 162
                end % if
            end % for
            x_C_d = valve_dir_2_way.C_d.check('>', 0.0, valve_dir_2_way.C_d.default);
            % 164 166
            x_Re_cr = valve_dir_2_way.Re_cr.check('>', 0.0, valve_dir_2_way.Re_cr.default);
            % 166 168
            x_A_leak = valve_dir_2_way.A_leak.check('>', 0.0, valve_dir_2_way.A_leak.default);
            % 168 172
            % 169 172
            % 170 172
            orif_var = valve_dir_2_way.element('orif_var', root.sh.orifices.orifice_variable);
            % 172 175
            % 173 175
            orif_var.mdl_type = valve_dir_2_way.mdl_type;
            orif_var.opening_tab = x_t;
            orif_var.area_tab = a_t;
            orif_var.interp_method = valve_dir_2_way.interp_method;
            orif_var.extrap_method = valve_dir_2_way.extrap_method;
            orif_var.C_d = x_C_d;
            orif_var.x_0 = valve_dir_2_way.x_0;
            orif_var.Re_cr = x_Re_cr;
            orif_var.A_leak = x_A_leak;
            orif_var.or = 1.0;
        else
            % 185 188
            % 186 188
            x_t = valve_dir_2_way.opening_tab.value;
            p_t = valve_dir_2_way.pressure_tab.value;
            q_t = valve_dir_2_way.flow_rate_tab.value;
            num_row = length(x_t);
            num_col = length(p_t);
            num_el = numel(q_t);
            % 193 195
            if ne(mtimes(num_row, num_col), num_el)
                error('Wrong dimension of flow rate matrix!')
            end % if
            if le(num_row, 3.0) || le(num_col, 3.0)
                error('Vectors of openings and pressure differentials must have no less than 4 elements!');
                % 199 201
            end % if
            % 201 203
            for i=1.0:minus(num_row, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Vector of openings must be in strictly acsending order!')
                end % if
            end % for
            for i=1.0:minus(num_col, 1.0)
                if ge(p_t(i), p_t(plus(i, 1.0)))
                    error('Vector of pressure values must be in strictly acsending order!')
                    % 210 212
                end % if
            end % for
            % 213 215
            orif_var = valve_dir_2_way.element('orif_var', root.sh.orifices.orifice_variable);
            % 215 218
            % 216 218
            orif_var.mdl_type = valve_dir_2_way.mdl_type;
            orif_var.opening_tab = x_t;
            orif_var.pressure_tab = p_t;
            orif_var.flow_rate_tab = q_t;
            orif_var.interp_method = valve_dir_2_way.interp_method;
            orif_var.extrap_method = valve_dir_2_way.extrap_method;
            orif_var.x_0 = valve_dir_2_way.x_0;
            orif_var.or = 1.0;
        end % if
        % 226 228
    end % if
    valve_dir_2_way.connect(orif_var.S, valve_dir_2_way.S);
    valve_dir_2_way.connect(orif_var.A, valve_dir_2_way.A);
    valve_dir_2_way.connect(orif_var.B, valve_dir_2_way.B);
end % function
