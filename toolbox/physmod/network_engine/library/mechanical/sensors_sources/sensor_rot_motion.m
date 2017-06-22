function sensor_rot_motion(root, schema)
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
    schema.descriptor = 'Ideal Rotational Motion Sensor';
    % 19 21
    % 20 21
    R = schema.terminal('R');
    R.description = 'Sensor positive probe';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Left';[0.5]};
    % 25 26
    C = schema.terminal('C');
    C.description = 'Sensor negative (reference) probe';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.25]};
    % 30 31
    W = schema.output('W');
    W.description = 'Angular velocity output';
    W.type = ne_type('real', [1.0 1.0], 'rad/s');
    W.location = {'Right';[0.5]};
    % 35 36
    A = schema.output('A');
    A.description = 'Angle';
    A.type = ne_type('real', [1.0 1.0], 'rad');
    A.location = {'Right';[0.75]};
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    offset = schema.parameter('offset');
    offset.description = 'Initial angle';
    offset.type = ne_type('real', [1.0 1.0], 'rad');
    offset.default = 0.0;
    % 55 58
    % 56 58
    % 57 58
    schema.setup(@setup);
    % 59 60
end % function
function setup(root, mot_sensor)
    % 62 64
    % 63 64
    mot_sensor.branch_across('w', mot_sensor.R.w, mot_sensor.C.w);
    mot_sensor.branch_through('t', mot_sensor.R.t, mot_sensor.C.t);
    % 66 67
    mot_sensor.variable('phi', [1.0 1.0], 'rad');
    % 68 69
    mot_sensor.equation(@equation);
end % function
function e = equation(sys, mot_sensor)
    % 72 74
    % 73 74
    e = sys.equation;
    % 75 77
    % 76 77
    x_offset = mot_sensor.offset;
    % 78 79
    torque = 0.0;
    rel_velocity = mot_sensor.w;
    % 81 82
    e(1.0) = minus(mot_sensor.t, torque);
    if sys.dc
        e(2.0) = minus(mot_sensor.phi, x_offset);
    else
        e(2.0) = minus(mot_sensor.phi.der, rel_velocity);
    end % if
    e(3.0) = minus(mot_sensor.W, rel_velocity);
    e(4.0) = minus(mot_sensor.A, mot_sensor.phi);
end % function
