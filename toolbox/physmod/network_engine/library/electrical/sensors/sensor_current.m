function sensor_current(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    schema.descriptor = 'Current Sensor';
    % 18 20
    % 19 20
    p = schema.terminal('p');
    p.description = 'Sensor positive probe';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Left';[0.5]};
    % 25 26
    I = schema.output('I');
    I.description = 'Current output';
    I.type = ne_type('real', [1.0 1.0], 'A');
    I.label = 'I';
    I.location = {'Right';[0.25]};
    % 31 32
    n = schema.terminal('n');
    n.description = 'Sensor negative probe';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Right';[0.75]};
    % 37 40
    % 38 40
    % 39 40
    schema.setup(@setup);
    % 41 42
end % function
function setup(root, current_sensor)
    % 44 46
    % 45 46
    current_sensor.branch_across('v', current_sensor.p.v, current_sensor.n.v);
    current_sensor.branch_through('i', current_sensor.p.i, current_sensor.n.i);
    % 48 49
    current_sensor.equation(@equation);
end % function
function e = equation(sys, current_sensor)
    % 52 54
    % 53 54
    e = sys.equation;
    % 55 56
    e(1.0) = current_sensor.v;
    e(2.0) = minus(current_sensor.I, current_sensor.i);
end % function
