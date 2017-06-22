function pump_var_displ_p_comp(root, schema)
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
    schema.descriptor = 'Variable-Displacement Pressure-Compensated Pump';
    % 21 25
    % 22 25
    % 23 25
    S = schema.terminal('S');
    S.description = 'Pump driving shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Left';[0.5]};
    % 28 30
    P = schema.terminal('P');
    P.description = 'Pump outlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Right';[0.25]};
    % 33 35
    T = schema.terminal('T');
    T.description = 'Pump suction';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Right';[0.75]};
    % 38 42
    % 39 42
    % 40 42
    D_max = schema.parameter('D_max');
    D_max.description = 'Maximum displacement';
    D_max.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    D_max.default = 5e-06;
    % 45 47
    pr_set = schema.parameter('pr_set');
    pr_set.description = 'Setting pressure';
    pr_set.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_set.default = 1e+07;
    % 50 52
    pr_reg = schema.parameter('pr_reg');
    pr_reg.description = 'Pressure regulation range';
    pr_reg.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_reg.default = 600000.0;
    % 55 57
    efficiency_vol = schema.parameter('efficiency_vol');
    efficiency_vol.description = 'Volumetric efficiency';
    efficiency_vol.type = ne_type('real', [1.0 1.0], '1');
    efficiency_vol.default = .85;
    % 60 62
    efficiency_tot = schema.parameter('efficiency_tot');
    efficiency_tot.description = 'Total efficiency';
    efficiency_tot.type = ne_type('real', [1.0 1.0], '1');
    efficiency_tot.default = .75;
    % 65 67
    pr_nominal = schema.parameter('pr_nominal');
    pr_nominal.description = 'Nominal pressure';
    pr_nominal.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_nominal.default = 1e+07;
    % 70 72
    w_nominal = schema.parameter('w_nominal');
    w_nominal.description = 'Nominal angular velocity';
    w_nominal.type = ne_type('real', [1.0 1.0], 'rad/s');
    w_nominal.default = 188.0;
    % 75 77
    visc_nominal = schema.parameter('visc_nominal');
    visc_nominal.description = 'Nominal kinematic viscosity';
    visc_nominal.type = ne_type('real', [1.0 1.0], 'cSt');
    visc_nominal.default = 18.0;
    % 80 83
    % 81 83
    var_int_q = schema.local_variable('pump_delivery');
    var_int_q.description = 'Pump delivery (m^3/s)';
    % 84 86
    var_int_q = schema.local_variable('pr_drop');
    var_int_q.description = 'Pressure differential across the pump (Pa)';
    % 87 89
    var_int_l = schema.local_variable('leakage_flow');
    var_int_l.description = 'Leakage flow rate (m^3/s)';
    % 90 92
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 93 95
    var_int_w = schema.local_variable('ang_velocity');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 96 98
    var_int_q = schema.local_variable('displacement');
    var_int_q.description = 'Pump displacement (m^3/rad)';
    % 99 101
    var_int_p = schema.local_variable('power_hyd');
    var_int_p.description = 'Output flow power (W)';
    % 102 104
    schema.setup(@setup);
    % 104 106
end % function
function setup(root, pump_vd_pc)
    % 107 110
    % 108 110
    pump_vd_pc.branch_across('p', pump_vd_pc.P.p, pump_vd_pc.T.p);
    pump_vd_pc.branch_through('q', pump_vd_pc.T.q, pump_vd_pc.P.q);
    % 111 113
    pump_vd_pc.branch_across('w', pump_vd_pc.S.w, []);
    pump_vd_pc.branch_through('t', pump_vd_pc.S.t, []);
    % 114 117
    % 115 117
    pump_vd_pc.parameter('x_D_max', pump_vd_pc.D_max.check('>', 0.0));
    pump_vd_pc.parameter('x_pr_set', pump_vd_pc.pr_set.check('>', 0.0));
    pump_vd_pc.parameter('x_pr_reg', pump_vd_pc.pr_reg.check('>', 0.0));
    x_efficiency_vol = pump_vd_pc.efficiency_vol.check('>', 0.0, pump_vd_pc.efficiency_vol.default);
    % 120 122
    x_efficiency_vol = x_efficiency_vol.check('<=', 1.0, pump_vd_pc.efficiency_vol.default);
    % 122 124
    pump_vd_pc.parameter('x_efficiency_vol', x_efficiency_vol);
    pump_vd_pc.parameter('x_efficiency_tot', pump_vd_pc.efficiency_tot.check('>', 0.0).check('<=', x_efficiency_vol));
    % 125 127
    pump_vd_pc.parameter('x_pr_nominal', pump_vd_pc.pr_nominal.check('>', 0.0, pump_vd_pc.pr_nominal.default));
    % 127 129
    pump_vd_pc.parameter('x_w_nominal', pump_vd_pc.w_nominal.check('>', 0.0, pump_vd_pc.w_nominal.default));
    % 129 131
    pump_vd_pc.parameter('x_visc_nominal', pump_vd_pc.visc_nominal.check('>', 0.0, pump_vd_pc.visc_nominal.default));
    % 131 134
    % 132 134
    pump_vd_pc.parameter('density', pump_vd_pc.P.density);
    pump_vd_pc.parameter('viscosity_kin', pump_vd_pc.P.viscosity_kin);
    % 135 137
    pump_vd_pc.parameter('D_0', {[0.0],'m^3/rad'});
    % 137 141
    % 138 141
    % 139 141
    k_leak = mrdivide(mtimes(mtimes(mtimes(pump_vd_pc.D_max, pump_vd_pc.w_nominal), pump_vd_pc.visc_nominal), minus(1.0, pump_vd_pc.efficiency_vol)), pump_vd_pc.pr_nominal);
    % 141 145
    % 142 145
    % 143 145
    k_mech = mrdivide(pump_vd_pc.efficiency_tot, pump_vd_pc.efficiency_vol);
    % 145 147
    gain = mrdivide(pump_vd_pc.D_max, pump_vd_pc.pr_reg);
    % 147 149
    pr_max = plus(pump_vd_pc.pr_set, pump_vd_pc.pr_reg);
    % 149 151
    pump_vd_pc.parameter('k_leak', k_leak);
    pump_vd_pc.parameter('k_mech', k_mech);
    pump_vd_pc.parameter('gain', gain);
    pump_vd_pc.parameter('pr_max', pr_max);
    % 154 157
    % 155 157
    pump_vd_pc.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 157 159
    pump_vd_pc.equation(@equation)
end % function
function e = equation(sys, pump_vd_pc)
    % 161 164
    % 162 164
    e = sys.equation;
    % 164 167
    % 165 167
    D_max = pump_vd_pc.x_D_max;
    pr_set = pump_vd_pc.x_pr_set;
    density = pump_vd_pc.density;
    viscosity_kin = pump_vd_pc.viscosity_kin;
    w_nominal = pump_vd_pc.x_w_nominal;
    visc_nominal = pump_vd_pc.x_visc_nominal;
    efficiency_vol = pump_vd_pc.x_efficiency_vol;
    pr_nominal = pump_vd_pc.x_pr_nominal;
    efficiency_tot = pump_vd_pc.x_efficiency_tot;
    pr_reg = pump_vd_pc.x_pr_reg;
    % 176 178
    k_leak = mrdivide(pump_vd_pc.k_leak, viscosity_kin);
    k_mech = pump_vd_pc.k_mech;
    gain = pump_vd_pc.gain;
    pr_max = pump_vd_pc.pr_max;
    % 181 183
    pr_drop = pump_vd_pc.p;
    ang_velocity = pump_vd_pc.w;
    % 184 186
    if le(pr_drop, pr_set)
        displacement = D_max;
    else
        if lt(pr_drop, pr_max)
            displacement = mtimes(gain, minus(pr_max, pr_drop));
        else
            displacement = pump_vd_pc.D_0;
        end % if
    end % if
    leakage_flow = mtimes(k_leak, pr_drop);
    pump_delivery = minus(mtimes(displacement, ang_velocity), leakage_flow);
    torque = mrdivide(mtimes(displacement, pr_drop), k_mech);
    % 197 199
    torque = mtimes(torque, pump_vd_pc.adjust_torque_unit);
    % 199 201
    power_hyd = mtimes(pump_delivery, uminus(pr_drop));
    % 201 203
    e(1.0) = minus(pump_vd_pc.q, pump_delivery);
    e(2.0) = minus(pump_vd_pc.t, torque);
end % function
