function sensor_torque(root, schema)
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
    % 19 20
    schema.descriptor = 'Ideal Torque Sensor';
    % 21 23
    % 22 23
    R = schema.terminal('R');
    R.description = 'Sensor positive probe';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Left';[0.5]};
    % 27 28
    C = schema.terminal('C');
    C.description = 'Sensor negative (reference) probe';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.25]};
    % 32 33
    T = schema.output('T');
    T.description = 'Force';
    T.type = ne_type('real', [1.0 1.0], 'N*m');
    T.location = {'Right';[0.75]};
    % 37 38
    schema.setup(@setup);
    % 39 40
end % function
function setup(root, trq_sensor)
    % 42 44
    % 43 44
    trq_sensor.branch_across('w', trq_sensor.R.w, trq_sensor.C.w);
    trq_sensor.branch_through('t', trq_sensor.R.t, trq_sensor.C.t);
    % 46 47
    trq_sensor.equation(@equation);
end % function
function e = equation(sys, trq_sensor)
    % 50 52
    % 51 52
    e = sys.equation;
    % 53 54
    torque = trq_sensor.t;
    rel_velocity = 0.0;
    % 56 57
    e(1.0) = minus(trq_sensor.w, rel_velocity);
    e(2.0) = minus(trq_sensor.T, trq_sensor.t);
    % 59 60
end % function
