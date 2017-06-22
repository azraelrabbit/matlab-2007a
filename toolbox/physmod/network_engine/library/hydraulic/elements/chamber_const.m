function chamber_const(root, schema)
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
    schema.descriptor = 'Constant Volume Chamber';
    % 20 23
    % 21 23
    A = schema.terminal('A');
    A.description = 'Chamber inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.5]};
    A.label = '';
    % 27 30
    % 28 30
    ch_sp = schema.parameter('ch_sp');
    ch_sp.description = 'Chamber specification';
    ch_sp.type = ne_type('real', [1.0 1.0], '1');
    ch_sp.default = 1.0;
    % 33 35
    wall_type = schema.parameter('wall_type');
    wall_type.description = 'Chamber wall type';
    wall_type.type = ne_type('real', [1.0 1.0], '1');
    wall_type.default = 1.0;
    % 38 40
    ch_volume = schema.parameter('ch_volume');
    ch_volume.description = 'Chamber volume';
    ch_volume.type = ne_type('real', [1.0 1.0], 'm^3');
    ch_volume.default = .0001;
    % 43 45
    d_in = schema.parameter('d_in');
    d_in.description = 'Chamber internal diameter';
    d_in.type = ne_type('real', [1.0 1.0], 'm');
    d_in.default = .01;
    % 48 50
    length = schema.parameter('length');
    length.description = 'Cylindrical chamber length';
    length.type = ne_type('real', [1.0 1.0], 'm');
    length.default = 1.0;
    % 53 55
    pr_r_coef = schema.parameter('pr_r_coef');
    pr_r_coef.description = 'Static pressure-diameter coefficient';
    pr_r_coef.type = ne_type('real', [1.0 1.0], 'm/Pa');
    pr_r_coef.default = 1.2e-12;
    % 58 60
    time_const = schema.parameter('time_const');
    time_const.description = 'Viscoelastic process time constant';
    time_const.type = ne_type('real', [1.0 1.0], 's');
    time_const.default = .01;
    % 63 65
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 68 70
    initial_pressure = schema.parameter('initial_pressure');
    initial_pressure.description = 'Initial pressure';
    initial_pressure.type = ne_type('real', [1.0 1.0], 'Pa');
    initial_pressure.default = 0.0;
    % 73 76
    % 74 76
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate into the chamber (m^3/s)';
    % 77 79
    var_int_p = schema.local_variable('pressure');
    var_int_p.description = 'Pressure at the inlet (Pa)';
    % 80 82
    var_int_d = schema.local_variable('diameter_increase');
    var_int_d.description = 'Diameter increment (m)';
    % 83 85
    var_int_E = schema.local_variable('bulk_inst');
    % 85 87
    var_int_E.description = 'Fluid bulk modulus (Pa)';
    % 87 89
    schema.setup(@setup);
    % 89 91
end % function
function setup(root, cnst_ch)
    % 92 95
    % 93 95
    cnst_ch.branch_across('p', cnst_ch.A.p, []);
    cnst_ch.branch_through('q', cnst_ch.A.q, []);
    % 96 99
    % 97 99
    x_k_sh = cnst_ch.k_sh.check('>=', 1.0, cnst_ch.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, cnst_ch.k_sh.default);
    cnst_ch.parameter('x_k_sh', x_k_sh);
    % 101 103
    if eq(cnst_ch.ch_sp, 1.0)
        cnst_ch.parameter('x_ch_volume', cnst_ch.ch_volume.check('>', 0.0));
    else
        cnst_ch.parameter('x_d_in', cnst_ch.d_in.check('>', 0.0));
        cnst_ch.parameter('x_length', cnst_ch.length.check('>', 0.0));
        if eq(cnst_ch.wall_type, 2.0)
            cnst_ch.parameter('x_pr_r_coef', cnst_ch.pr_r_coef.check('>', 0.0, cnst_ch.pr_r_coef.default));
            % 109 111
            cnst_ch.parameter('x_time_const', cnst_ch.time_const.check('>', 0.0, cnst_ch.time_const.default));
            % 111 113
        end % if
    end % if
    % 114 118
    % 115 118
    % 116 118
    if eq(cnst_ch.ch_sp, 1.0)
        volume_g = cnst_ch.ch_volume;
    else
        volume_g = mtimes(mrdivide(mtimes(mtimes(3.141592653589793, cnst_ch.d_in), cnst_ch.d_in), 4.0), cnst_ch.length);
    end % if
    cnst_ch.parameter('volume_g', volume_g);
    % 123 125
    cnst_ch.parameter('bulk', cnst_ch.A.bulk);
    cnst_ch.parameter('alpha', cnst_ch.A.alpha);
    % 126 128
    cnst_ch.parameter('p_a', {[101325.0],'Pa'});
    % 128 130
    cnst_ch.variable('diameter_incr', [1.0 1.0], 'cm');
    % 130 132
    cnst_ch.equation(@equation);
end % function
function e = equation(sys, cnst_ch)
    % 134 137
    % 135 137
    e = sys.equation;
    % 137 140
    % 138 140
    wall_type = cnst_ch.wall_type;
    ch_volume = cnst_ch.volume_g;
    d_in = cnst_ch.d_in;
    length = cnst_ch.length;
    pr_coef = cnst_ch.pr_r_coef;
    tau = cnst_ch.time_const;
    k_sh = cnst_ch.x_k_sh;
    initial_pressure = cnst_ch.initial_pressure;
    % 147 149
    bulk = cnst_ch.bulk;
    alpha = cnst_ch.alpha;
    % 150 152
    p_a = cnst_ch.p_a;
    % 152 155
    % 153 155
    pressure = cnst_ch.p;
    p_abs = plus(p_a, pressure);
    % 156 158
    p_nom = mpower(mrdivide(p_a, p_abs), mrdivide(1.0, k_sh));
    p_den = mrdivide(mtimes(p_nom, bulk), mtimes(k_sh, p_abs));
    % 159 161
    flow_rate = cnst_ch.q;
    % 161 163
    diameter_increase = cnst_ch.diameter_incr;
    % 163 165
    if eq(wall_type, 1.0)
        volume = ch_volume;
    else
        volume = mtimes(mrdivide(mtimes(3.141592653589793, mpower(plus(d_in, diameter_increase), 2.0)), 4.0), length);
    end % if
    % 169 172
    % 170 172
    bulk_inst = mrdivide(mtimes(bulk, plus(1.0, mtimes(alpha, p_nom))), plus(1.0, mtimes(alpha, p_den)));
    % 172 175
    % 173 175
    expansion_coeff = plus(1.0, mrdivide(pressure, bulk_inst));
    % 175 178
    % 176 178
    fl_volume = mtimes(volume, expansion_coeff);
    % 178 180
    if eq(wall_type, 1.0)
        % 180 183
        % 181 183
        e(1.0) = diameter_increase.der;
        % 183 187
        % 184 187
        % 185 187
        Vdot = mtimes(mrdivide(volume, bulk_inst), pressure.der);
        % 187 189
        e(2.0) = minus(flow_rate, Vdot);
    else
        % 190 194
        % 191 194
        % 192 194
        e(1.0) = minus(minus(pressure, mtimes(mrdivide(1.0, pr_coef), diameter_increase)), mtimes(mrdivide(tau, pr_coef), diameter_increase.der));
        % 194 201
        % 195 201
        % 196 201
        % 197 201
        % 198 201
        % 199 201
        Vdot1 = mtimes(mrdivide(volume, bulk_inst), pressure.der);
        % 201 204
        % 202 204
        d_fl_volume_d_diam_incr = mtimes(mtimes(mrdivide(mtimes(6.283185307179586, plus(d_in, diameter_increase)), 4.0), length), expansion_coeff);
        % 204 206
        diam_incr_dot = mtimes(mrdivide(pr_coef, tau), minus(pressure, mrdivide(diameter_increase, pr_coef)));
        % 206 208
        Vdot2 = mtimes(d_fl_volume_d_diam_incr, diam_incr_dot);
        % 208 211
        % 209 211
        e(2.0) = minus(flow_rate, plus(Vdot1, Vdot2));
        % 211 213
    end % if
    % 213 215
    if sys.dc
        % 215 217
        e(1.0) = diameter_increase;
        % 217 219
        e(2.0) = minus(pressure, initial_pressure);
    end % if
end % function
