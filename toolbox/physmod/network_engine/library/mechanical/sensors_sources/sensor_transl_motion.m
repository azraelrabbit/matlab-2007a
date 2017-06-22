function sensor_transl_motion(root, schema)
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
    schema.descriptor = 'Ideal Translational Motion Sensor';
    % 20 22
    % 21 22
    R = schema.terminal('R');
    R.description = 'Sensor positive probe';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 26 27
    C = schema.terminal('C');
    C.description = 'Sensor negative (reference) probe';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.25]};
    % 31 32
    V = schema.output('V');
    V.description = 'Velocity output';
    V.type = ne_type('real', [1.0 1.0], 'm/s');
    V.location = {'Right';[0.5]};
    % 36 37
    P = schema.output('P');
    P.description = 'Position output';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.location = {'Right';[0.75]};
    % 41 52
    % 42 52
    % 43 52
    % 44 52
    % 45 52
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    offset = schema.parameter('offset');
    offset.description = 'Initial position';
    offset.type = ne_type('real', [1.0 1.0], 'm');
    offset.default = 0.0;
    % 56 59
    % 57 59
    % 58 59
    schema.setup(@setup);
    % 60 61
end % function
function setup(root, mot_sensor)
    % 63 65
    % 64 65
    mot_sensor.branch_across('v', mot_sensor.R.v, mot_sensor.C.v);
    mot_sensor.branch_through('f', mot_sensor.R.f, mot_sensor.C.f);
    % 67 68
    mot_sensor.variable('x', [1.0 1.0], 'm');
    % 69 70
    mot_sensor.equation(@equation);
end % function
function e = equation(sys, mot_sensor)
    % 73 75
    % 74 75
    e = sys.equation;
    % 76 78
    % 77 78
    x_offset = mot_sensor.offset;
    % 79 80
    force = 0.0;
    rel_velocity = mot_sensor.v;
    % 82 83
    e(1.0) = minus(mot_sensor.f, force);
    if sys.dc
        e(2.0) = minus(mot_sensor.x, x_offset);
    else
        e(2.0) = minus(mot_sensor.x.der, rel_velocity);
    end % if
    e(3.0) = minus(mot_sensor.V, rel_velocity);
    e(4.0) = minus(mot_sensor.P, mot_sensor.x);
end % function
