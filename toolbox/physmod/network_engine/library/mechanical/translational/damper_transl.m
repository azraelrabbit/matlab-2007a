function damper_transl(root, schema)
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
    schema.descriptor = 'Translational Damper';
    % 16 18
    % 17 18
    R = schema.terminal('R');
    R.description = 'Damper rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 22 23
    C = schema.terminal('C');
    C.description = 'Damper case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.5]};
    % 27 29
    % 28 29
    damping = schema.parameter('D');
    damping.description = 'Damping coefficient';
    damping.type = ne_type('real', [1.0 1.0], 'N*s/m');
    damping.default = 100.0;
    % 33 35
    % 34 35
    var_int_f = schema.local_variable('force');
    var_int_f.description = 'Damping force (N)';
    % 37 38
    var_int_v = schema.local_variable('rel_velocity');
    var_int_v.description = 'Damper relative velocity (m/s)';
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
    damper.branch_across('v', damper.R.v, damper.C.v);
    damper.branch_through('f', damper.R.f, damper.C.f);
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
    rel_velocity = damper.v;
    force = mtimes(D, rel_velocity);
    power = mtimes(force, rel_velocity);
    % 69 70
    e = minus(force, damper.f);
    % 71 72
end % function
