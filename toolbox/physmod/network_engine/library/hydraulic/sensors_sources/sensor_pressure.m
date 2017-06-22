function sensor_pressure(root, schema)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    schema.descriptor = 'Ideal Hydraulic Pressure Sensor';
    % 17 19
    % 18 19
    A = schema.terminal('A');
    A.description = 'Sensor positive probe';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.25]};
    % 23 24
    B = schema.terminal('B');
    B.description = 'Sensor negative (reference) probe';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.25]};
    % 28 29
    P = schema.output('P');
    P.description = 'Pressure output';
    P.type = ne_type('real', [1.0 1.0], 'Pa');
    P.location = {'Right';[0.75]};
    % 33 36
    % 34 36
    % 35 36
    schema.setup(@setup);
    % 37 38
end % function
function setup(root, pr_sensor)
    % 40 42
    % 41 42
    pr_sensor.branch_across('p', pr_sensor.A.p, pr_sensor.B.p);
    pr_sensor.branch_through('q', pr_sensor.A.q, pr_sensor.B.q);
    pr_sensor.equation(@equation);
end % function
function e = equation(sys, pr_sensor)
    % 47 49
    % 48 49
    e = sys.equation;
    % 50 51
    e(1.0) = pr_sensor.q;
    e(2.0) = minus(pr_sensor.P, pr_sensor.p);
end % function
