function mass(root, schema)
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
    schema.descriptor = 'Mass';
    % 16 18
    % 17 18
    M = schema.terminal('M');
    M.description = 'Mass';
    M.domain = root.fl.mechanical.translational.translational;
    M.location = {'Top';[0.5]};
    M.label = '';
    % 23 26
    % 24 26
    % 25 26
    mass = schema.parameter('mass');
    mass.description = 'Mass';
    mass.type = ne_type('real', [1.0 1.0], 'kg');
    mass.default = 1.0;
    % 30 31
    initial_velocity = schema.parameter('initial_velocity');
    initial_velocity.description = 'Initial velocity';
    initial_velocity.type = ne_type('real', [1.0 1.0], 'm/s');
    initial_velocity.default = 0.0;
    % 35 37
    % 36 37
    var_int_q = schema.local_variable('force');
    var_int_q.description = 'Inertia force (N)';
    % 39 40
    var_int_p = schema.local_variable('velocity');
    var_int_p.description = 'Mass absolute velocity (m/s)';
    % 42 43
    schema.setup(@setup);
    % 44 45
end % function
function setup(root, mass)
    % 47 49
    % 48 49
    mass.branch_across('v', mass.M.v, []);
    mass.branch_through('f', mass.M.f, []);
    % 51 53
    % 52 53
    mass.parameter('x_mass', mass.mass.check('>', 0.0));
    % 54 55
    mass.equation(@equation);
end % function
function e = equation(sys, mass)
    % 58 60
    % 59 60
    e = sys.equation;
    % 61 64
    % 62 64
    % 63 64
    x_mass = mass.x_mass;
    % 65 66
    velocity = mass.v;
    force = mass.f;
    initial_velocity = mass.initial_velocity;
    % 69 70
    if sys.dc
        e = minus(velocity, initial_velocity);
    else
        e = minus(force, mtimes(x_mass, velocity.der));
    end % if
    % 75 76
end % function
