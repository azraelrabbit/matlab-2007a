function hardstop_transl(root, schema)
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
    schema.descriptor = 'Translational Hard Stop';
    % 20 23
    % 21 23
    R = schema.terminal('R');
    R.description = 'Stop slider';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 26 28
    C = schema.terminal('C');
    C.description = 'Stop case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.5]};
    % 31 34
    % 32 34
    upper_bnd = schema.parameter('upper_bnd');
    upper_bnd.description = 'Upper bound';
    upper_bnd.type = ne_type('real', [1.0 1.0], 'm');
    upper_bnd.default = .1;
    % 37 39
    lower_bnd = schema.parameter('lower_bnd');
    lower_bnd.description = 'Lower bound';
    lower_bnd.type = ne_type('real', [1.0 1.0], 'm');
    lower_bnd.default = -.1;
    % 42 44
    stiff_up = schema.parameter('stiff_up');
    stiff_up.description = 'Contact stiffness at upper bound';
    stiff_up.type = ne_type('real', [1.0 1.0], 'N/m');
    stiff_up.default = 1e+06;
    % 47 49
    stiff_low = schema.parameter('stiff_low');
    stiff_low.description = 'Contact stiffness at lower bound';
    stiff_low.type = ne_type('real', [1.0 1.0], 'N/m');
    stiff_low.default = 1e+06;
    % 52 54
    D_up = schema.parameter('D_up');
    D_up.description = 'Contact damping at upper bound';
    D_up.type = ne_type('real', [1.0 1.0], 'N*s/m');
    D_up.default = 150.0;
    % 57 59
    D_low = schema.parameter('D_low');
    D_low.description = 'Contact damping at lower bound';
    D_low.type = ne_type('real', [1.0 1.0], 'N*s/m');
    D_low.default = 150.0;
    % 62 65
    % 63 65
    var_int_f = schema.local_variable('contact_force');
    var_int_f.description = 'Contact force (N)';
    % 66 68
    var_int_v = schema.local_variable('rel_displacement');
    var_int_v.description = 'Slider-case relative displacement (m)';
    % 69 71
    schema.setup(@setup);
    % 71 73
end % function
function setup(root, transl_stop)
    % 74 77
    % 75 77
    transl_stop.branch_across('v', transl_stop.R.v, transl_stop.C.v);
    transl_stop.branch_through('f', transl_stop.R.f, transl_stop.C.f);
    % 78 81
    % 79 81
    transl_stop.parameter('x_lower_bnd', transl_stop.lower_bnd.check('<', transl_stop.upper_bnd));
    % 81 83
    transl_stop.parameter('x_stiff_up', transl_stop.stiff_up.check('>', 0.0, transl_stop.stiff_up.default));
    % 83 85
    transl_stop.parameter('x_stiff_low', transl_stop.stiff_low.check('>', 0.0, transl_stop.stiff_up.default));
    % 85 87
    transl_stop.parameter('x_D_up', transl_stop.D_up.check('>=', 0.0, transl_stop.D_up.default));
    % 87 89
    transl_stop.parameter('x_D_low', transl_stop.D_low.check('>=', 0.0, transl_stop.D_low.default));
    % 89 92
    % 90 92
    transl_stop.variable('x', [1.0 1.0], 'm');
    % 92 94
    transl_stop.equation(@equation);
    % 94 96
end % function
function e = equation(sys, transl_stop)
    % 97 100
    % 98 100
    e = sys.equation;
    % 100 103
    % 101 103
    upper_bnd = transl_stop.upper_bnd;
    lower_bnd = transl_stop.x_lower_bnd;
    stiff_up = transl_stop.x_stiff_up;
    stiff_low = transl_stop.x_stiff_low;
    D_up = transl_stop.x_D_up;
    D_low = transl_stop.x_D_low;
    % 108 110
    rel_displacement = transl_stop.x;
    rel_velocity = transl_stop.v;
    % 111 113
    if gt(rel_displacement, upper_bnd)
        % 113 115
        def = minus(rel_displacement, upper_bnd);
        contact_force = plus(mtimes(stiff_up, def), mtimes(D_up, rel_velocity));
    else
        if lt(rel_displacement, lower_bnd)
            def = minus(rel_displacement, lower_bnd);
            contact_force = plus(mtimes(stiff_low, def), mtimes(D_low, rel_velocity));
        else
            % 121 123
            def = 0.0;
            contact_force = 0.0;
        end % if
        % 125 127
    end % if
    if sys.dc
        e(1.0) = transl_stop.x;
    else
        e(1.0) = minus(transl_stop.x.der, transl_stop.v);
    end % if
    e(2.0) = minus(contact_force, transl_stop.f);
end % function
