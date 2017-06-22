function centrifugal_pump(root, schema)
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
    % 21 22
    schema.descriptor = 'Centrifugal Pump';
    % 23 25
    % 24 25
    S = schema.terminal('S');
    S.description = 'Pump driving shaft';
    S.domain = root.fl.mechanical.rotational.rotational;
    S.location = {'Left'};
    % 29 30
    P = schema.terminal('P');
    P.description = 'Pump outlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Right';[0.75]};
    % 34 35
    T = schema.terminal('T');
    T.description = 'Pump suction';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Right';[0.25]};
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    c1 = schema.parameter('c_1');
    c1.description = 'First approximating coefficient';
    c1.type = ne_type('real', [1.0 1.0], 'Pa/(kg/m^3)');
    c1.default = 362.0;
    % 49 50
    c2 = schema.parameter('c_2');
    c2.description = 'Second approximating coefficient';
    c2.type = ne_type('real', [1.0 1.0], 'Pa*s/kg');
    c2.default = 16500.0;
    % 54 55
    c3 = schema.parameter('c_3');
    c3.description = 'Third approximating coefficient';
    c3.type = ne_type('real', [1.0 1.0], 'Pa*s^2/(kg*m^3)');
    c3.default = 16900000.0;
    % 59 60
    c4 = schema.parameter('c_4');
    c4.description = 'Fourth approximating coefficient';
    c4.type = ne_type('real', [1.0 1.0], 'Pa*s^2/(kg*m^3)');
    c4.default = 2340000.0;
    % 64 65
    cf = schema.parameter('c_f');
    cf.description = 'Correction factor';
    cf.type = ne_type('real', [1.0 1.0], '1');
    cf.default = .85;
    % 69 70
    rv = schema.parameter('ref_velocity');
    rv.description = 'Reference angular velocity';
    rv.type = ne_type('real', [1.0 1.0], 'rpm');
    rv.default = 1770.0;
    % 74 75
    qd = schema.parameter('design_del');
    qd.description = 'Pump design delivery';
    qd.type = ne_type('real', [1.0 1.0], 'lpm');
    qd.default = 130.0;
    % 79 80
    rd = schema.parameter('ref_density');
    rd.description = 'Reference density';
    rd.type = ne_type('real', [1.0 1.0], 'kg/m^3');
    rd.default = 920.0;
    % 84 85
    mlp = schema.parameter('mech_loss');
    mlp.description = 'Mechanical loss power';
    mlp.type = ne_type('real', [1.0 1.0], 'W');
    mlp.default = 350.0;
    % 89 92
    % 90 92
    % 91 92
    var_int_q = schema.local_variable('pump_delivery');
    var_int_q.description = 'Pump delivery (m^3/s)';
    % 94 95
    var_int_t = schema.local_variable('torque');
    var_int_t.description = 'Driving shaft torque (N*m)';
    % 97 98
    var_int_w = schema.local_variable('power_hyd');
    var_int_w.description = 'Output flow power (W)';
    % 100 101
    var_int_p = schema.local_variable('pressure_diff');
    var_int_p.description = 'Pressure differential (Pa)';
    % 103 104
    var_int_w = schema.local_variable('shaft_ang_vel');
    var_int_w.description = 'Driving shaft angular velocity (rad/s)';
    % 106 107
    var_int_e = schema.local_variable('efficiency');
    var_int_e.description = 'Pump efficiency';
    % 109 110
    schema.setup(@setup);
    % 111 112
end % function
function setup(root, cntrf_pump)
    % 114 116
    % 115 116
    cntrf_pump.branch_across('p', cntrf_pump.P.p, cntrf_pump.T.p);
    cntrf_pump.branch_through('q', cntrf_pump.T.q, cntrf_pump.P.q);
    % 118 119
    cntrf_pump.branch_across('w', cntrf_pump.S.w, []);
    cntrf_pump.branch_through('t', cntrf_pump.S.t, []);
    % 121 123
    % 122 123
    x_ref_velocity = cntrf_pump.ref_velocity.check('>', 0.0);
    cntrf_pump.parameter('x_ref_velocity', x_ref_velocity);
    cntrf_pump.parameter('x_c_f', cntrf_pump.c_f.check('>', 0.0));
    cntrf_pump.parameter('x_design_del', cntrf_pump.design_del.check('>', 0.0));
    % 127 128
    cntrf_pump.parameter('x_ref_density', cntrf_pump.ref_density.check('>', 0.0));
    % 129 130
    cntrf_pump.parameter('x_mech_loss', cntrf_pump.mech_loss.check('>=', 0.0));
    % 131 135
    % 132 135
    % 133 135
    % 134 135
    cntrf_pump.parameter('density', cntrf_pump.P.density);
    % 136 138
    % 137 138
    cntrf_pump.parameter('adjust_torque_unit', {[1.0],'rad'});
    % 139 140
    cntrf_pump.equation(@equation);
end % function
function e = equation(sys, cntrf_pump)
    % 143 145
    % 144 145
    e = sys.equation;
    % 146 147
    density = cntrf_pump.density;
    ref_velocity = cntrf_pump.x_ref_velocity;
    design_del = cntrf_pump.x_design_del;
    ref_density = cntrf_pump.x_ref_density;
    mech_loss = cntrf_pump.x_mech_loss;
    % 152 158
    % 153 158
    % 154 158
    % 155 158
    % 156 158
    % 157 158
    c_1 = cntrf_pump.c_1;
    c_2 = cntrf_pump.c_2;
    c_3 = cntrf_pump.c_3;
    c_4 = cntrf_pump.c_4;
    c_f = cntrf_pump.x_c_f;
    % 163 165
    % 164 165
    shaft_ang_vel = cntrf_pump.w;
    pump_delivery = cntrf_pump.q;
    % 167 169
    % 168 169
    pump_delivery_ref = mrdivide(mtimes(pump_delivery, ref_velocity), shaft_ang_vel);
    % 170 173
    % 171 173
    % 172 173
    pressure_ref_e = mtimes(mtimes(ref_density, minus(c_1, mtimes(c_2, pump_delivery_ref))), c_f);
    % 174 175
    pressure_ref_loss = mtimes(ref_density, plus(mtimes(c_3, mpower(pump_delivery_ref, 2.0)), mtimes(uplus(c_4), mpower(minus(design_del, pump_delivery_ref), 2.0))));
    % 176 178
    % 177 178
    power_ref_br = plus(mtimes(pressure_ref_e, pump_delivery_ref), mech_loss);
    power_ref_hyd = mtimes(minus(pressure_ref_e, pressure_ref_loss), pump_delivery_ref);
    % 180 181
    efficiency = mrdivide(power_ref_hyd, power_ref_br);
    % 182 183
    torque = mrdivide(mtimes(mtimes(mrdivide(power_ref_br, ref_velocity), mpower(mrdivide(shaft_ang_vel, ref_velocity), 2.0)), density), ref_density);
    % 184 187
    % 185 187
    % 186 187
    pressure_diff = mrdivide(mtimes(mtimes(minus(pressure_ref_e, pressure_ref_loss), mpower(mrdivide(shaft_ang_vel, ref_velocity), 2.0)), density), ref_density);
    % 188 190
    % 189 190
    power_hyd = mtimes(pressure_diff, pump_delivery);
    % 191 193
    % 192 193
    torque = mtimes(torque, cntrf_pump.adjust_torque_unit);
    % 194 196
    % 195 196
    e(1.0) = minus(cntrf_pump.p, pressure_diff);
    e(2.0) = minus(cntrf_pump.t, torque);
    % 198 201
    % 199 201
    % 200 201
end % function
