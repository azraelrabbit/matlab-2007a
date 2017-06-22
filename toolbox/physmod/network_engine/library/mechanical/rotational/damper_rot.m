function damper_rot(root, schema)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    schema.descriptor = 'Rotational Damper';
    % 16 18
    % 17 18
    R = schema.terminal('R');
    R.description = 'Damper rod';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Left';[0.5]};
    % 22 23
    C = schema.terminal('C');
    C.description = 'Damper case';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.5]};
    % 27 29
    % 28 29
    damping = schema.parameter('D');
    damping.description = 'Damping coefficient';
    damping.type = ne_type('real', [1.0 1.0], '(N*m)*s/rad');
    damping.default = .001;
    % 33 35
    % 34 35
    var_int_f = schema.local_variable('torque');
    var_int_f.description = 'Damping torque (N*m)';
    % 37 38
    var_int_v = schema.local_variable('velocity');
    var_int_v.description = 'Damper relative velocity (rad/s)';
    % 40 41
    var_int_p = schema.local_variable('power');
    var_int_p.description = 'Power dissipated in the damper (W)';
    % 43 44
    schema.setup(@setup);
    % 45 46
end % function
function setup(root, damper)
    % 48 50
    % 49 50
    damper.branch_across('w', damper.R.w, damper.C.w);
    damper.branch_through('t', damper.R.t, damper.C.t);
    % 52 54
    % 53 54
    damper.parameter('x_D', damper.D.check('>', 0.0));
    % 55 56
    damper.equation(@equation);
end % function
function e = equation(sys, damper)
    % 59 61
    % 60 61
    e = sys.equation;
    % 62 64
    % 63 64
    D = damper.x_D;
    % 65 66
    rel_velocity = damper.w;
    torque = mtimes(D, rel_velocity);
    power = mtimes(torque, rel_velocity);
    % 69 70
    e = minus(torque, damper.t);
    % 71 72
end % function
