function sensor_voltage(root, schema)
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
    schema.descriptor = 'Voltage Sensor';
    % 18 20
    % 19 20
    p = schema.terminal('p');
    p.description = 'Sensor positive probe';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Top';[0.5]};
    % 25 26
    V = schema.output('V');
    V.description = 'Voltage output';
    V.type = ne_type('real', [1.0 1.0], 'V');
    V.label = 'V';
    V.location = {'Bottom';[0.25]};
    % 31 32
    n = schema.terminal('n');
    n.description = 'Sensor negative probe';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Bottom';[0.75]};
    % 37 40
    % 38 40
    % 39 40
    schema.setup(@setup);
    % 41 42
end % function
function setup(root, voltage_sensor)
    % 44 46
    % 45 46
    voltage_sensor.branch_across('v', voltage_sensor.p.v, voltage_sensor.n.v);
    voltage_sensor.branch_through('i', voltage_sensor.p.i, voltage_sensor.n.i);
    % 48 49
    voltage_sensor.equation(@equation);
end % function
function e = equation(sys, voltage_sensor)
    % 52 54
    % 53 54
    e = sys.equation;
    % 55 56
    e(1.0) = voltage_sensor.i;
    e(2.0) = minus(voltage_sensor.V, voltage_sensor.v);
end % function
