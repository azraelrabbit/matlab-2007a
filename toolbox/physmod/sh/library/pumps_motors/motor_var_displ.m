function motor_var_displ(root, schema)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    schema.descriptor = 'Variable-Displacement Motor';
    % 27 29
    % 28 29
    A = schema.terminal('A');
    A.description = 'Motor inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 33 34
    C = schema.input('C');
    C.description = 'Control member';
    C.location = {'Left';[0.5]};
    C.type = ne_type('real', [1.0 1.0], 'm');
    % 38 39
    B = schema.terminal('B');
    B.description = 'Motor outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Left';[0.75]};
    % 43 44
    S = schema.terminal('S');
    S.description = 'Driving shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Right';[0.5]};
    % 48 50
    % 49 50
    mdt = schema.parameter('mdl_type');
    % 51 56
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    mdt.description = 'Model parameterization';
    mdt.type = ne_type('real', [1.0 1.0], '1');
    mdt.default = 1.0;
    % 59 60
    D_max = schema.parameter('D_max');
    D_max.description = 'Maximum displacement';
    D_max.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    D_max.default = 5e-06;
    % 64 65
    st_max = schema.parameter('stroke_max');
    st_max.description = 'Maximum stroke';
    st_max.type = ne_type('real', [1.0 1.0], 'm');
    st_max.default = .005;
    % 69 70
    pos = schema.parameter('cntrl_mem_tab');
    pos.description = 'Control member positions table';
    pos.type = ne_type('real', 'variable', 'm');
    pos.default = [-.0075 -.0025 0.0 .0025 .0075];
    % 74 75
    displ = schema.parameter('displ_tab');
    displ.description = 'Pump displacements table';
    displ.type = ne_type('real', 'variable', 'm^3/rad');
    displ.default = [-5e-06 -3e-06 0.0 3e-06 5e-06];
    % 79 80
    int = schema.parameter('interp_method');
    int.description = 'Interpolation method';
    int.type = ne_type('real', [1.0 1.0], '1');
    int.default = 1.0;
    % 84 85
    ext = schema.parameter('extrap_method');
    ext.description = 'Extrapolation method';
    ext.type = ne_type('real', [1.0 1.0], '1');
    ext.default = 1.0;
    % 89 90
    efficiency_vol = schema.parameter('efficiency_vol');
    efficiency_vol.description = 'Volumetric efficiency';
    efficiency_vol.type = ne_type('real', [1.0 1.0], '1');
    efficiency_vol.default = .85;
    % 94 95
    efficiency_tot = schema.parameter('efficiency_tot');
    efficiency_tot.description = 'Total efficiency';
    efficiency_tot.type = ne_type('real', [1.0 1.0], '1');
    efficiency_tot.default = .75;
    % 99 100
    pr_nominal = schema.parameter('pr_nominal');
    pr_nominal.description = 'Nominal pressure';
    pr_nominal.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_nominal.default = 1e+07;
    % 104 105
    w_nominal = schema.parameter('w_nominal');
    w_nominal.description = 'Nominal angular velocity';
    w_nominal.type = ne_type('real', [1.0 1.0], 'rad/s');
    w_nominal.default = 188.0;
    % 109 110
    visc_nominal = schema.parameter('visc_nominal');
    visc_nominal.description = 'Nominal kinematic viscosity';
    visc_nominal.type = ne_type('real', [1.0 1.0], 'cSt');
    visc_nominal.default = 18.0;
    % 114 116
    % 115 116
    var_int_q = schema.local_variable('motor_flow');
    var_int_q.description = 'Flow rate through the motor (m^3/s)';
    % 118 119
    var_int_q = schema.local_variable('pr_drop');
    var_int_q.description = 'Pressure differential across the motor (Pa)';
    % 121 122
    var_int_l = schema.local_variable('leakage_flow');
    var_int_l.description = 'Leakage flow rate (m^3/s)';
    % 124 125
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 127 128
    var_int_w = schema.local_variable('ang_velocity');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 130 131
    var_int_q = schema.local_variable('displacement');
    var_int_q.description = 'Motor displacement (m^3/rad)';
    % 133 134
    var_int_p = schema.local_variable('power_hyd');
    var_int_p.description = 'Power on output shaft (W)';
    % 136 137
    schema.setup(@setup);
    % 138 139
end % function
function setup(root, motor_vd)
    % 141 143
    % 142 143
    motor_vd.branch_across('p', motor_vd.A.p, motor_vd.B.p);
    motor_vd.branch_through('q', motor_vd.A.q, motor_vd.B.q);
    % 145 146
    motor_vd.branch_across('w', motor_vd.S.w, []);
    motor_vd.branch_through('t', motor_vd.S.t, []);
    % 148 150
    % 149 150
    if eq(motor_vd.mdl_type, 1.0)
        % 151 152
        motor_vd.parameter('x_D_max', motor_vd.D_max.check('>', 0.0));
        motor_vd.parameter('x_stroke_max', motor_vd.stroke_max.check('>', 0.0));
    else
        % 155 158
        % 156 158
        % 157 158
        x_t = motor_vd.cntrl_mem_tab.value;
        d_t = motor_vd.displ_tab.value;
        if ne(length(x_t), length(d_t))
            error('Vectors of control member positions and motor displacements must have the same size!');
            % 162 163
        end % if
        num_el = length(x_t);
        if le(num_el, 3.0)
            error('The size of the table must be greater than 3!');
        end % if
        % 168 169
        for i=1.0:minus(num_el, 1.0)
            if ge(x_t(i), x_t(plus(i, 1.0)))
                error('Control member positions must be arranged in strictly acsending order!');
                % 172 173
            end % if
        end % for
    end % if
    % 176 177
    x_efficiency_vol = motor_vd.efficiency_vol.check('>', 0.0, motor_vd.efficiency_vol.default);
    % 178 179
    x_efficiency_vol = x_efficiency_vol.check('<=', 1.0, motor_vd.efficiency_vol.default);
    % 180 181
    motor_vd.parameter('x_efficiency_vol', x_efficiency_vol);
    motor_vd.parameter('x_efficiency_tot', motor_vd.efficiency_tot.check('>', 0.0).check('<=', x_efficiency_vol));
    % 183 184
    motor_vd.parameter('x_pr_nominal', motor_vd.pr_nominal.check('>', 0.0, motor_vd.pr_nominal.default));
    % 185 186
    motor_vd.parameter('x_w_nominal', motor_vd.w_nominal.check('>', 0.0, motor_vd.w_nominal.default));
    % 187 188
    motor_vd.parameter('x_visc_nominal', motor_vd.visc_nominal.check('>', 0.0, motor_vd.visc_nominal.default));
    % 189 191
    % 190 191
    motor_vd.parameter('density', motor_vd.A.density);
    motor_vd.parameter('viscosity_kin', motor_vd.A.viscosity_kin);
    % 193 196
    % 194 196
    % 195 196
    k_leak = mrdivide(mtimes(mtimes(mtimes(motor_vd.D_max, motor_vd.w_nominal), motor_vd.visc_nominal), minus(1.0, motor_vd.efficiency_vol)), motor_vd.pr_nominal);
    % 197 200
    % 198 200
    % 199 200
    k_mech = mrdivide(motor_vd.efficiency_tot, motor_vd.efficiency_vol);
    % 201 202
    motor_vd.parameter('k_leak', k_leak);
    motor_vd.parameter('k_mech', k_mech);
    % 204 206
    % 205 206
    motor_vd.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 207 208
    motor_vd.parameter('adjust_displ_unit', {[1.0],'m^3/rad'});
    % 209 213
    % 210 213
    % 211 213
    % 212 213
    if eq(motor_vd.mdl_type, 1.0)
        % 214 218
        % 215 218
        % 216 218
        % 217 218
        sat = motor_vd.element('sat', root.fl.physical_signal.nonlinear.ps_saturation);
        sat.upper_limit = motor_vd.stroke_max;
        sat.lower_limit = uminus(motor_vd.stroke_max);
        % 221 222
        gain = motor_vd.element('gain', root.fl.physical_signal.functions.ps_gain);
        % 223 224
        gain.gain = mrdivide(motor_vd.D_max, motor_vd.stroke_max);
        % 225 227
        % 226 227
        s1 = motor_vd.signal('s1', sat.O);
        motor_vd.connect(sat.I, motor_vd.C);
        motor_vd.connect(gain.I, s1);
        % 230 231
        motor_vd.signal('cs', gain.O);
    else
        % 233 236
        % 234 236
        % 235 236
        tlu = motor_vd.element('tlu', root.fl.physical_signal.lookup_tables.ps_1d_tlu);
        % 237 238
        tlu.x_t = x_t;
        tlu.y_t = d_t;
        tlu.interp_method = motor_vd.interp_method;
        tlu.extrap_method = motor_vd.extrap_method;
        % 242 243
        motor_vd.connect(tlu.I, motor_vd.C);
        % 244 245
        motor_vd.signal('cs', tlu.O);
        % 246 247
    end % if
    % 248 249
    motor_vd.equation(@equation)
end % function
function e = equation(sys, motor_vd)
    % 252 254
    % 253 254
    e = sys.equation;
    viscosity_kin = motor_vd.viscosity_kin;
    k_leak = mrdivide(motor_vd.k_leak, viscosity_kin);
    k_mech = motor_vd.k_mech;
    % 258 260
    % 259 260
    pr_drop = motor_vd.p;
    ang_velocity = motor_vd.w;
    % 262 263
    displacement = mtimes(motor_vd.cs, motor_vd.adjust_displ_unit);
    % 264 265
    leakage_flow = mtimes(k_leak, pr_drop);
    motor_flow = plus(mtimes(displacement, ang_velocity), leakage_flow);
    torque = mtimes(mtimes(displacement, pr_drop), k_mech);
    % 268 270
    % 269 270
    torque = mtimes(torque, motor_vd.adjust_torque_unit);
    % 271 272
    power_mech = mtimes(ang_velocity, uminus(torque));
    % 273 274
    e(1.0) = minus(motor_vd.q, motor_flow);
    e(2.0) = plus(motor_vd.t, torque);
end % function
