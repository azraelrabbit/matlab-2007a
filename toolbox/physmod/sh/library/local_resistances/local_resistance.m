function local_resistance(root, schema)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    schema.descriptor = 'Local Resistance';
    % 24 27
    % 25 27
    A = schema.terminal('A');
    A.description = 'Resistance inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 30 32
    B = schema.terminal('B');
    B.description = 'Resistance outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 35 38
    % 36 38
    area = schema.parameter('area');
    area.description = 'Resistance area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0001;
    % 41 43
    mdt = schema.parameter('mdl_type');
    % 43 46
    % 44 46
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 48 50
    kp_d = schema.parameter('kp_d');
    kp_d.description = 'Pressure loss coefficient for direct flow';
    kp_d.type = ne_type('real', [1.0 1.0], '1');
    kp_d.default = 2.0;
    % 53 55
    kp_r = schema.parameter('kp_r');
    kp_r.description = 'Pressure loss coefficient for reverse flow';
    kp_r.type = ne_type('real', [1.0 1.0], '1');
    kp_r.default = 2.0;
    % 58 60
    Re = schema.parameter('Re_vec');
    Re.description = 'Reynolds number vector';
    Re.type = ne_type('real', 'variable', '1');
    Re.default = [-4000.0 -3000.0 -2000.0 -1000.0 -500.0 -200.0 -100.0 -50.0 -40.0 -30.0 -20.0 -15.0 -10.0 10.0 20.0 30.0 40.0 50.0 100.0 200.0 500.0 1000.0 2000.0 4000.0 5000.0 10000.0];
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    cnt = schema.parameter('loss_coeff_vec');
    cnt.description = 'Loss coefficient vector';
    cnt.type = ne_type('real', 'variable', '1');
    cnt.default = [.25 .3 .65 .9 .65 .75 .9 1.15 1.35 1.65 2.3 2.8 3.1 5.0 2.7 1.8 1.46 1.3 .9 .65 .42 .3 .2 .4 .42 .25];
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 2.0;
    % 79 81
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 2.0;
    % 84 87
    % 85 87
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the resistance (m^3/s)';
    % 88 90
    var_int_pr = schema.local_variable('pr_loss');
    var_int_pr.description = 'Pressure loss in the resistance (Pa)';
    % 91 93
    var_int_Re = schema.local_variable('Re');
    var_int_Re.description = 'Reynolds number';
    % 94 96
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 97 99
    schema.setup(@setup);
    % 99 101
end % function
function setup(root, res_hyd)
    % 102 105
    % 103 105
    res_hyd.branch_across('p', res_hyd.A.p, res_hyd.B.p);
    res_hyd.branch_through('q', res_hyd.A.q, res_hyd.B.q);
    % 106 109
    % 107 109
    res_hyd.parameter('x_area', res_hyd.area.check('>', 0.0));
    % 109 111
    if eq(res_hyd.mdl_type, 1.0)
        res_hyd.parameter('x_kp_d', res_hyd.kp_d.check('>', 0.0));
        res_hyd.parameter('x_kp_r', res_hyd.kp_r.check('>', 0.0));
    else
        % 114 118
        % 115 118
        % 116 118
        Re_t = res_hyd.Re_vec.value;
        c_t = res_hyd.loss_coeff_vec.value;
        % 119 121
        if ne(length(Re_t), length(c_t))
            error('Vectors of Reynolds numbers and loss coefficients must be of the same size!');
            % 122 124
        end % if
        % 124 126
        num_el = length(Re_t);
        if le(num_el, 3.0)
            error('The size of the table must be greater than 3!');
        end % if
        % 129 131
        for i=1.0:minus(num_el, 1.0)
            if ge(Re_t(i), Re_t(plus(i, 1.0)))
                error('Reynolds numbers must be arranged in strictly ascending order!');
                % 133 135
            end % if
        end % for
    end % if
    % 137 147
    % 138 147
    % 139 147
    % 140 147
    % 141 147
    % 142 147
    % 143 147
    % 144 147
    % 145 147
    Re_inst = res_hyd.source('Re_inst', ne_type('real', [1.0 1.0], '1'));
    % 147 149
    if eq(res_hyd.mdl_type, 1.0)
        % 149 152
        % 150 152
        gain = res_hyd.element('gain', root.fl.physical_signal.functions.ps_gain);
        % 152 154
        gain.gain = 1.0;
        % 154 156
        res_hyd.connect(gain.I, res_hyd.Re_inst);
        % 156 158
        res_hyd.signal('Re_s', gain.O);
    else
        % 159 162
        % 160 162
        tlu = res_hyd.element('tlu', root.fl.physical_signal.lookup_tables.ps_1d_tlu);
        % 162 164
        tlu.x_t = Re_t;
        tlu.y_t = c_t;
        tlu.interp_method = res_hyd.interp_method;
        tlu.extrap_method = res_hyd.extrap_method;
        % 167 169
        res_hyd.connect(tlu.I, res_hyd.Re_inst);
        % 169 171
        res_hyd.signal('Re_s', tlu.O);
    end % if
    % 172 174
    res_hyd.parameter('density', res_hyd.A.density);
    res_hyd.parameter('viscosity_kin', res_hyd.A.viscosity_kin);
    % 175 177
    res_hyd.parameter('D_h', mpower(mrdivide(mtimes(4.0, res_hyd.area), 3.141592653589793), .5));
    % 177 179
    res_hyd.equation(@equation);
end % function
function e = equation(sys, res_hyd)
    % 181 184
    % 182 184
    e = sys.equation;
    % 184 187
    % 185 187
    area = res_hyd.x_area;
    D_h = res_hyd.D_h;
    density = res_hyd.density;
    viscosity_kin = res_hyd.viscosity_kin;
    % 190 193
    % 191 193
    flow_rate = res_hyd.q;
    Re = mrdivide(mrdivide(mtimes(D_h, flow_rate), area), viscosity_kin);
    % 194 196
    if eq(res_hyd.mdl_type, 1.0)
        kp_d = res_hyd.x_kp_d;
        kp_r = res_hyd.x_kp_r;
        if ge(flow_rate, 0.0)
            loss_coeff = kp_d;
        else
            loss_coeff = kp_r;
        end % if
    else
        % 204 206
        loss_coeff = res_hyd.Re_s;
    end % if
    % 207 210
    % 208 210
    pr_loss = mrdivide(mrdivide(mtimes(mtimes(mtimes(loss_coeff, density), flow_rate), neabs(flow_rate)), mpower(area, 2.0)), 2.0);
    % 210 213
    % 211 213
    power = mtimes(pr_loss, flow_rate);
    % 213 215
    e(1.0) = minus(res_hyd.Re_inst, Re);
    e(2.0) = minus(res_hyd.p, pr_loss);
end % function
