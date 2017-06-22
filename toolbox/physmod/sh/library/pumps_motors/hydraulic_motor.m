function hydraulic_motor(root, schema)
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
    % 20 21
    schema.descriptor = 'Hydraulic Motor';
    % 22 24
    % 23 24
    A = schema.terminal('A');
    A.description = 'Motor inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 28 29
    B = schema.terminal('B');
    B.description = 'Motor outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Left';[0.75]};
    % 33 34
    S = schema.terminal('S');
    S.description = 'Motor shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Right';[0.5]};
    % 38 40
    % 39 40
    D = schema.parameter('D');
    D.description = 'Motor displacement';
    D.type = ne_type('real', [1.0 1.0], 'm^3/rad');
    D.default = 5e-06;
    % 44 45
    efficiency_vol = schema.parameter('efficiency_vol');
    efficiency_vol.description = 'Volumetric efficiency';
    efficiency_vol.type = ne_type('real', [1.0 1.0], '1');
    efficiency_vol.default = .92;
    % 49 50
    efficiency_tot = schema.parameter('efficiency_tot');
    efficiency_tot.description = 'Total efficiency';
    efficiency_tot.type = ne_type('real', [1.0 1.0], '1');
    efficiency_tot.default = .8;
    % 54 55
    pr_nominal = schema.parameter('pr_nominal');
    pr_nominal.description = 'Nominal pressure';
    pr_nominal.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_nominal.default = 1e+07;
    % 59 60
    w_nominal = schema.parameter('w_nominal');
    w_nominal.description = 'Nominal angular velocity';
    w_nominal.type = ne_type('real', [1.0 1.0], 'rad/s');
    w_nominal.default = 188.0;
    % 64 65
    visc_nominal = schema.parameter('visc_nominal');
    visc_nominal.description = 'Nominal kinematic viscosity';
    visc_nominal.type = ne_type('real', [1.0 1.0], 'cSt');
    visc_nominal.default = 18.0;
    % 69 71
    % 70 71
    var_int_q = schema.local_variable('motor_flow_rate');
    var_int_q.description = 'Motor flow rate (m^3/s)';
    % 73 74
    var_int_p = schema.local_variable('pressure_diff');
    var_int_p.description = 'Pressure differential (Pa)';
    % 76 77
    var_int_l = schema.local_variable('leakage_flow');
    var_int_l.description = 'Leakage flow rate (m^3/s)';
    % 79 80
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 82 83
    var_int_w = schema.local_variable('shaft_ang_vel');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 85 86
    var_int_p = schema.local_variable('power_mech');
    var_int_p.description = 'Driving shaft power (W)';
    % 88 89
    schema.setup(@setup);
    % 90 91
end % function
function setup(root, hyd_mot)
    % 93 95
    % 94 95
    hyd_mot.branch_across('p', hyd_mot.A.p, hyd_mot.B.p);
    hyd_mot.branch_through('q', hyd_mot.A.q, hyd_mot.B.q);
    % 97 98
    hyd_mot.branch_across('w', hyd_mot.S.w, []);
    hyd_mot.branch_through('t', [], hyd_mot.S.t);
    % 100 102
    % 101 102
    hyd_mot.parameter('x_D', hyd_mot.D.check('>', 0.0));
    x_efficiency_vol = hyd_mot.efficiency_vol.check('>', 0.0, hyd_mot.efficiency_vol.default);
    % 104 105
    x_efficiency_vol = x_efficiency_vol.check('<=', 1.0, hyd_mot.efficiency_vol.default);
    % 106 107
    hyd_mot.parameter('x_efficiency_vol', x_efficiency_vol);
    hyd_mot.parameter('x_efficiency_tot', hyd_mot.efficiency_tot.check('>', 0.0).check('<=', x_efficiency_vol));
    % 109 110
    hyd_mot.parameter('x_pr_nominal', hyd_mot.pr_nominal.check('>', 0.0, hyd_mot.pr_nominal.default));
    % 111 112
    hyd_mot.parameter('x_w_nominal', hyd_mot.w_nominal.check('>', 0.0, hyd_mot.w_nominal.default));
    % 113 114
    hyd_mot.parameter('x_visc_nominal', hyd_mot.visc_nominal.check('>', 0.0, hyd_mot.visc_nominal.default));
    % 115 117
    % 116 117
    hyd_mot.parameter('density', hyd_mot.A.density);
    hyd_mot.parameter('viscosity_kin', hyd_mot.A.viscosity_kin);
    % 119 122
    % 120 122
    % 121 122
    k_leak = mrdivide(mtimes(mtimes(mtimes(hyd_mot.D, hyd_mot.w_nominal), hyd_mot.visc_nominal), minus(1.0, hyd_mot.efficiency_vol)), hyd_mot.pr_nominal);
    % 123 126
    % 124 126
    % 125 126
    k_mech = mrdivide(hyd_mot.efficiency_tot, hyd_mot.efficiency_vol);
    hyd_mot.parameter('k_leak', k_leak);
    hyd_mot.parameter('k_mech', k_mech);
    % 129 131
    % 130 131
    hyd_mot.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 132 134
    % 133 134
    hyd_mot.equation(@equation);
end % function
function e = equation(sys, hyd_mot)
    % 137 139
    % 138 139
    e = sys.equation;
    % 140 142
    % 141 142
    D = hyd_mot.x_D;
    density = hyd_mot.density;
    viscosity_kin = hyd_mot.viscosity_kin;
    k_leak = mrdivide(hyd_mot.k_leak, viscosity_kin);
    k_mech = hyd_mot.k_mech;
    % 147 149
    % 148 149
    pressure_diff = hyd_mot.p;
    shaft_ang_vel = hyd_mot.w;
    leakage_flow = mtimes(k_leak, pressure_diff);
    motor_flow_rate = plus(mtimes(shaft_ang_vel, D), leakage_flow);
    torque = mtimes(mtimes(pressure_diff, D), k_mech);
    % 154 156
    % 155 156
    torque = mtimes(torque, hyd_mot.adjust_torque_unit);
    % 157 158
    power_mech = mtimes(uminus(torque), shaft_ang_vel);
    % 159 160
    e(1.0) = minus(hyd_mot.q, motor_flow_rate);
    e(2.0) = minus(hyd_mot.t, torque);
    % 162 163
end % function
