function sensor_force(root, schema)
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
    schema.descriptor = 'Ideal Force Sensor';
    % 21 23
    % 22 23
    R = schema.terminal('R');
    R.description = 'Sensor positive probe';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 27 28
    C = schema.terminal('C');
    C.description = 'Sensor negative (reference) probe';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.25]};
    % 32 33
    F = schema.output('F');
    F.description = 'Force';
    F.type = ne_type('real', [1.0 1.0], 'N');
    F.location = {'Right';[0.75]};
    % 37 38
    schema.setup(@setup);
    % 39 40
end % function
function setup(root, frc_sensor)
    % 42 44
    % 43 44
    frc_sensor.branch_across('v', frc_sensor.R.v, frc_sensor.C.v);
    frc_sensor.branch_through('f', frc_sensor.R.f, frc_sensor.C.f);
    % 46 47
    frc_sensor.equation(@equation);
end % function
function e = equation(sys, frc_sensor)
    % 50 52
    % 51 52
    e = sys.equation;
    % 53 54
    force = frc_sensor.f;
    rel_velocity = 0.0;
    % 56 57
    e(1.0) = minus(frc_sensor.v, rel_velocity);
    e(2.0) = minus(frc_sensor.F, frc_sensor.f);
    % 59 60
end % function
