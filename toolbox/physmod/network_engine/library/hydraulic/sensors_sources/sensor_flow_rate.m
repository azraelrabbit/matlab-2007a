function sensor_flow_rate(root, schema)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    schema.descriptor = 'Ideal Hydraulic Flow Rate Sensor';
    % 19 21
    % 20 21
    A = schema.terminal('A');
    A.description = 'Sensor positive probe';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 25 26
    Q = schema.output('Q');
    Q.description = 'Flow rate output';
    Q.type = ne_type('real', [1.0 1.0], 'm^3/s');
    Q.location = {'Right';[0.25]};
    % 30 31
    B = schema.terminal('B');
    B.description = 'Sensor negative (reference) probe';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.75]};
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    schema.setup(@setup);
    % 40 41
end % function
function setup(root, fl_rate_sensor)
    % 43 45
    % 44 45
    fl_rate_sensor.branch_across('p', fl_rate_sensor.A.p, fl_rate_sensor.B.p);
    fl_rate_sensor.branch_through('q', fl_rate_sensor.A.q, fl_rate_sensor.B.q);
    % 47 48
    fl_rate_sensor.equation(@equation);
end % function
function e = equation(sys, fl_rate_sensor)
    % 51 53
    % 52 53
    e = sys.equation;
    % 54 55
    e(1.0) = fl_rate_sensor.p;
    e(2.0) = minus(fl_rate_sensor.Q, fl_rate_sensor.q);
end % function
