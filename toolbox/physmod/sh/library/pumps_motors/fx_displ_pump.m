function fx_displ_pump(root, schema)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.descriptor = 'Fixed-Displacement Pump';
    % 20 22
    % 21 22
    S = schema.terminal('S');
    S.description = 'Pump driving shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Left'};
    % 26 27
    P = schema.terminal('P');
    P.description = 'Pump outlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Right';[0.75]};
    % 31 32
    T = schema.terminal('T');
    T.description = 'Pump suction';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Right';[0.25]};
    % 36 38
    % 37 38
    D = schema.parameter('D');
    D.description = 'Pump displacement';
    D.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    D.default = 5e-06;
    % 42 43
    efficiency_vol = schema.parameter('efficiency_vol');
    efficiency_vol.description = 'Volumetric efficiency';
    efficiency_vol.type = ne_type('real', [1.0 1.0], '1');
    efficiency_vol.default = .92;
    % 47 48
    efficiency_tot = schema.parameter('efficiency_tot');
    efficiency_tot.description = 'Total efficiency';
    efficiency_tot.type = ne_type('real', [1.0 1.0], '1');
    efficiency_tot.default = .8;
    % 52 53
    pr_nominal = schema.parameter('pr_nominal');
    pr_nominal.description = 'Nominal pressure';
    pr_nominal.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_nominal.default = 1e+07;
    % 57 58
    w_nominal = schema.parameter('w_nominal');
    w_nominal.description = 'Nominal angular velocity';
    w_nominal.type = ne_type('real', [1.0 1.0], 'rad/s');
    w_nominal.default = 188.0;
    % 62 63
    visc_nominal = schema.parameter('visc_nominal');
    visc_nominal.description = 'Nominal kinematic viscosity';
    visc_nominal.type = ne_type('real', [1.0 1.0], 'cSt');
    visc_nominal.default = 18.0;
    % 67 69
    % 68 69
    var_int_q = schema.local_variable('pump_delivery');
    var_int_q.description = 'Pump delivery (m^3/s)';
    % 71 72
    var_int_l = schema.local_variable('leakage_flow');
    var_int_l.description = 'Leakage flow rate (m^3/s)';
    % 74 75
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 77 78
    var_int_w = schema.local_variable('power_hyd');
    var_int_w.description = 'Output flow power (W)';
    % 80 81
    var_int_p = schema.local_variable('pressure_diff');
    var_int_p.description = 'Pressure differential (Pa)';
    % 83 84
    var_int_w = schema.local_variable('shaft_ang_vel');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 86 87
    schema.setup(@setup);
    % 88 89
end % function
function setup(root, fxd_pump)
    % 91 93
    % 92 93
    fxd_pump.branch_across('p', fxd_pump.P.p, fxd_pump.T.p);
    fxd_pump.branch_through('q', fxd_pump.T.q, fxd_pump.P.q);
    % 95 96
    fxd_pump.branch_across('w', fxd_pump.S.w, []);
    fxd_pump.branch_through('t', fxd_pump.S.t, []);
    % 98 100
    % 99 100
    fxd_pump.parameter('x_D', fxd_pump.D.check('>', 0.0));
    x_efficiency_vol = fxd_pump.efficiency_vol.check('>', 0.0, fxd_pump.efficiency_vol.default);
    % 102 103
    x_efficiency_vol = x_efficiency_vol.check('<=', 1.0, fxd_pump.efficiency_vol.default);
    % 104 105
    fxd_pump.parameter('x_efficiency_vol', x_efficiency_vol);
    x_efficiency_tot = fxd_pump.efficiency_tot.check('>', 0.0);
    x_efficiency_tot = x_efficiency_tot.check('<=', x_efficiency_vol);
    fxd_pump.parameter('x_efficiency_tot', x_efficiency_tot);
    fxd_pump.parameter('x_pr_nominal', fxd_pump.pr_nominal.check('>', 0.0, fxd_pump.pr_nominal.default));
    % 110 111
    fxd_pump.parameter('x_w_nominal', fxd_pump.w_nominal.check('>', 0.0, fxd_pump.w_nominal.default));
    % 112 113
    fxd_pump.parameter('x_visc_nominal', fxd_pump.visc_nominal.check('>', 0.0, fxd_pump.visc_nominal.default));
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    % 118 119
    fxd_pump.parameter('density', fxd_pump.P.density);
    fxd_pump.parameter('viscosity_kin', fxd_pump.P.viscosity_kin);
    % 121 124
    % 122 124
    % 123 124
    k_leak = mrdivide(mtimes(mtimes(mtimes(fxd_pump.D, fxd_pump.w_nominal), fxd_pump.visc_nominal), minus(1.0, fxd_pump.efficiency_vol)), fxd_pump.pr_nominal);
    % 125 128
    % 126 128
    % 127 128
    k_mech = mrdivide(fxd_pump.efficiency_tot, fxd_pump.efficiency_vol);
    fxd_pump.parameter('k_leak', k_leak);
    fxd_pump.parameter('k_mech', k_mech);
    % 131 133
    % 132 133
    fxd_pump.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 134 135
    fxd_pump.equation(@equation);
end % function
function e = equation(sys, fxd_pump)
    % 138 140
    % 139 140
    e = sys.equation;
    % 141 143
    % 142 143
    D = fxd_pump.x_D;
    density = fxd_pump.density;
    viscosity_kin = fxd_pump.viscosity_kin;
    k_leak = mrdivide(fxd_pump.k_leak, viscosity_kin);
    k_mech = fxd_pump.k_mech;
    % 148 150
    % 149 150
    pressure_diff = fxd_pump.p;
    shaft_ang_vel = fxd_pump.w;
    % 152 153
    leakage_flow = mtimes(k_leak, fxd_pump.p);
    pump_delivery = minus(mtimes(fxd_pump.w, D), leakage_flow);
    torque = mrdivide(mtimes(fxd_pump.p, D), k_mech);
    % 156 158
    % 157 158
    torque = mtimes(torque, fxd_pump.adjust_torque_unit);
    % 159 160
    power_hyd = mtimes(pressure_diff, pump_delivery);
    % 161 162
    e(1.0) = minus(fxd_pump.q, pump_delivery);
    e(2.0) = minus(fxd_pump.t, torque);
    % 164 165
end % function
