function pump_var_displ(root, schema)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    schema.descriptor = 'Variable-Displacement Pump';
    % 25 28
    % 26 28
    C = schema.input('C');
    C.description = 'Control member';
    C.location = {'Left';[0.25]};
    C.type = ne_type('real', [1.0 1.0], 'm');
    % 31 33
    S = schema.terminal('S');
    S.description = 'Pump driving shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Left';[0.75]};
    % 36 38
    P = schema.terminal('P');
    P.description = 'Pump outlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Right';[0.25]};
    % 41 43
    T = schema.terminal('T');
    T.description = 'Pump inlet';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Right';[0.75]};
    % 46 50
    % 47 50
    % 48 50
    mdt = schema.parameter('mdl_type');
    % 50 56
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 58 60
    D_max = schema.parameter('D_max');
    D_max.description = 'Maximum displacement';
    D_max.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    D_max.default = 5e-06;
    % 63 65
    st_max = schema.parameter('stroke_max');
    st_max.description = 'Maximum stroke';
    st_max.type = ne_type('real', [1.0 1.0], 'm');
    st_max.default = .005;
    % 68 70
    pos = schema.parameter('cntrl_mem_tab');
    pos.description = 'Control member positions table';
    pos.type = ne_type('real', 'variable', 'm');
    pos.default = [-.0075 -.0025 0.0 .0025 .0075];
    % 73 75
    displ = schema.parameter('displ_tab');
    displ.description = 'Pump displacements table';
    displ.type = ne_type('real', 'variable', 'm^3/rad');
    displ.default = [-5e-06 -3e-06 0.0 3e-06 5e-06];
    % 78 80
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 83 85
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 88 90
    efficiency_vol = schema.parameter('efficiency_vol');
    efficiency_vol.description = 'Volumetric efficiency';
    efficiency_vol.type = ne_type('real', [1.0 1.0], '1');
    efficiency_vol.default = .85;
    % 93 95
    efficiency_tot = schema.parameter('efficiency_tot');
    efficiency_tot.description = 'Total efficiency';
    efficiency_tot.type = ne_type('real', [1.0 1.0], '1');
    efficiency_tot.default = .75;
    % 98 100
    pr_nominal = schema.parameter('pr_nominal');
    pr_nominal.description = 'Nominal pressure';
    pr_nominal.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_nominal.default = 1e+07;
    % 103 105
    w_nominal = schema.parameter('w_nominal');
    w_nominal.description = 'Nominal angular velocity';
    w_nominal.type = ne_type('real', [1.0 1.0], 'rad/s');
    w_nominal.default = 188.0;
    % 108 110
    visc_nominal = schema.parameter('visc_nominal');
    visc_nominal.description = 'Nominal kinematic viscosity';
    visc_nominal.type = ne_type('real', [1.0 1.0], 'cSt');
    visc_nominal.default = 18.0;
    % 113 116
    % 114 116
    var_int_q = schema.local_variable('pump_delivery');
    var_int_q.description = 'Pump delivery (m^3/s)';
    % 117 119
    var_int_q = schema.local_variable('pr_drop');
    var_int_q.description = 'Pressure differential across the pump (Pa)';
    % 120 122
    var_int_l = schema.local_variable('leakage_flow');
    var_int_l.description = 'Leakage flow rate (m^3/s)';
    % 123 125
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 126 128
    var_int_w = schema.local_variable('ang_velocity');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 129 131
    var_int_q = schema.local_variable('displacement');
    var_int_q.description = 'Pump displacement (m^3/rad)';
    % 132 134
    var_int_p = schema.local_variable('power_hyd');
    var_int_p.description = 'Output flow power (W)';
    % 135 137
    schema.setup(@setup);
    % 137 139
end
function setup(root, pump_vd)
    % 140 143
    % 141 143
    pump_vd.branch_across('p', pump_vd.P.p, pump_vd.T.p);
    pump_vd.branch_through('q', pump_vd.T.q, pump_vd.P.q);
    % 144 146
    pump_vd.branch_across('w', pump_vd.S.w, []);
    pump_vd.branch_through('t', pump_vd.S.t, []);
    % 147 150
    % 148 150
    if eq(pump_vd.mdl_type, 1.0)
        pump_vd.parameter('x_D_max', pump_vd.D_max.check('>', 0.0));
        pump_vd.parameter('x_stroke_max', pump_vd.stroke_max.check('>', 0.0));
    else
        if eq(pump_vd.mdl_type, 2.0)
            % 154 157
            % 155 157
            x_t = pump_vd.cntrl_mem_tab.value;
            d_t = pump_vd.displ_tab.value;
            if ne(length(x_t), length(d_t))
                error('Vectors of control member positions and pump displacements must have the same size!');
                % 160 162
            end
            num_el = length(x_t);
            if le(num_el, 3.0)
                error('The size of the table must be greater than 3!');
            end
            % 166 168
            for i=1.0:minus(num_el, 1.0)
                if ge(x_t(i), x_t(plus(i, 1.0)))
                    error('Control member positions must be arranged in strictly acsending order!');
                    % 170 172
                end
            end % for
        end
    end
    x_efficiency_vol = pump_vd.efficiency_vol.check('>', 0.0, pump_vd.efficiency_vol.default);
    % 176 178
    x_efficiency_vol = x_efficiency_vol.check('<=', 1.0, pump_vd.efficiency_vol.default);
    % 178 180
    pump_vd.parameter('x_efficiency_vol', x_efficiency_vol);
    pump_vd.parameter('x_efficiency_tot', pump_vd.efficiency_tot.check('>', 0.0).check('<=', x_efficiency_vol));
    % 181 183
    pump_vd.parameter('x_pr_nominal', pump_vd.pr_nominal.check('>', 0.0, pump_vd.pr_nominal.default));
    % 183 185
    pump_vd.parameter('x_w_nominal', pump_vd.w_nominal.check('>', 0.0, pump_vd.w_nominal.default));
    % 185 187
    pump_vd.parameter('x_visc_nominal', pump_vd.visc_nominal.check('>', 0.0, pump_vd.visc_nominal.default));
    % 187 190
    % 188 190
    pump_vd.parameter('density', pump_vd.P.density);
    pump_vd.parameter('viscosity_kin', pump_vd.P.viscosity_kin);
    % 191 195
    % 192 195
    % 193 195
    k_leak = mrdivide(mtimes(mtimes(mtimes(pump_vd.D_max, pump_vd.w_nominal), pump_vd.visc_nominal), minus(1.0, pump_vd.efficiency_vol)), pump_vd.pr_nominal);
    % 195 199
    % 196 199
    % 197 199
    k_mech = mrdivide(pump_vd.efficiency_tot, pump_vd.efficiency_vol);
    % 199 201
    pump_vd.parameter('k_leak', k_leak);
    pump_vd.parameter('k_mech', k_mech);
    % 202 205
    % 203 205
    pump_vd.parameter('adjust_torque_unit', {[1.0],'rad'});
    pump_vd.parameter('adjust_displ_unit', {[1.0],'m^3/rad'});
    % 206 211
    % 207 211
    % 208 211
    % 209 211
    if eq(pump_vd.mdl_type, 1.0)
        % 211 216
        % 212 216
        % 213 216
        % 214 216
        sat = pump_vd.element('sat', root.fl.physical_signal.nonlinear.ps_saturation);
        sat.upper_limit = pump_vd.stroke_max;
        sat.lower_limit = uminus(pump_vd.stroke_max);
        % 218 220
        gain = pump_vd.element('gain', root.fl.physical_signal.functions.ps_gain);
        gain.gain = mrdivide(pump_vd.D_max, pump_vd.stroke_max);
        % 221 224
        % 222 224
        s1 = pump_vd.signal('s1', sat.O);
        pump_vd.connect(sat.I, pump_vd.C);
        pump_vd.connect(gain.I, s1);
        % 226 228
        pump_vd.signal('cs', gain.O);
    else
        % 229 232
        % 230 232
        tlu = pump_vd.element('tlu', root.fl.physical_signal.lookup_tables.ps_1d_tlu);
        % 232 234
        tlu.x_t = x_t;
        tlu.y_t = d_t;
        tlu.interp_method = pump_vd.interp_method;
        tlu.extrap_method = pump_vd.extrap_method;
        % 237 239
        pump_vd.connect(tlu.I, pump_vd.C);
        % 239 241
        pump_vd.signal('cs', tlu.O);
    end
    % 242 244
    pump_vd.equation(@equation)
end
function e = equation(sys, pump_vd)
    % 246 249
    % 247 249
    e = sys.equation;
    % 249 256
    % 250 256
    % 251 256
    % 252 256
    % 253 256
    % 254 256
    density = pump_vd.density;
    viscosity_kin = pump_vd.viscosity_kin;
    w_nominal = pump_vd.x_w_nominal;
    visc_nominal = pump_vd.x_visc_nominal;
    efficiency_vol = pump_vd.x_efficiency_vol;
    pr_nominal = pump_vd.x_pr_nominal;
    efficiency_tot = pump_vd.x_efficiency_tot;
    % 262 264
    k_leak = mrdivide(pump_vd.k_leak, viscosity_kin);
    k_mech = pump_vd.k_mech;
    % 265 268
    % 266 268
    pr_drop = pump_vd.p;
    ang_velocity = pump_vd.w;
    displacement = mtimes(pump_vd.cs, pump_vd.adjust_displ_unit);
    % 270 272
    leakage_flow = mtimes(k_leak, pr_drop);
    pump_delivery = minus(mtimes(displacement, ang_velocity), leakage_flow);
    torque = mrdivide(mtimes(displacement, pr_drop), k_mech);
    % 274 277
    % 275 277
    torque = mtimes(torque, pump_vd.adjust_torque_unit);
    % 277 279
    power_hyd = mtimes(pump_delivery, uminus(pr_drop));
    % 279 281
    e(1.0) = minus(pump_vd.q, pump_delivery);
    e(2.0) = minus(pump_vd.t, torque);
end
