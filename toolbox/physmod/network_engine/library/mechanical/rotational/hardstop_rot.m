function hardstop_rot(root, schema)
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
    schema.descriptor = 'Rotational Hard Stop';
    % 18 21
    % 19 21
    R = schema.terminal('R');
    R.description = 'Stop slider';
    R.domain = root.fl.mechanical.rotational.rotational;
    R.location = {'Left';[0.5]};
    % 24 26
    C = schema.terminal('C');
    C.description = 'Stop case';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.5]};
    % 29 32
    % 30 32
    upper_bnd = schema.parameter('upper_bnd');
    upper_bnd.description = 'Upper bound';
    upper_bnd.type = ne_type('real', [1.0 1.0], 'rad');
    upper_bnd.default = .1;
    % 35 37
    lower_bnd = schema.parameter('lower_bnd');
    lower_bnd.description = 'Lower bound';
    lower_bnd.type = ne_type('real', [1.0 1.0], 'rad');
    lower_bnd.default = -.1;
    % 40 42
    stiff_up = schema.parameter('stiff_up');
    stiff_up.description = 'Contact stiffness at upper bound';
    stiff_up.type = ne_type('real', [1.0 1.0], 'N*m/rad');
    stiff_up.default = 1e+06;
    % 45 47
    stiff_low = schema.parameter('stiff_neg');
    stiff_low.description = 'Contact stiffness at lower bound';
    stiff_low.type = ne_type('real', [1.0 1.0], 'N*m/rad');
    stiff_low.default = 1e+06;
    % 50 52
    D_up = schema.parameter('D_up');
    D_up.description = 'Contact damping at upper bound';
    D_up.type = ne_type('real', [1.0 1.0], 'N*m*s/rad');
    D_up.default = .01;
    % 55 57
    D_low = schema.parameter('D_low');
    D_low.description = 'Contact damping at lower bound';
    D_low.type = ne_type('real', [1.0 1.0], 'N*m*s/rad');
    D_low.default = .01;
    % 60 63
    % 61 63
    var_int_f = schema.local_variable('contact_torque');
    var_int_f.description = 'Contact torque (N*m)';
    % 64 66
    var_int_v = schema.local_variable('rel_angle');
    var_int_v.description = 'Slider-case relative angle (rad)';
    % 67 69
    schema.setup(@setup);
    % 69 71
end % function
function setup(root, rot_stop)
    % 72 75
    % 73 75
    rot_stop.branch_across('w', rot_stop.R.w, rot_stop.C.w);
    rot_stop.branch_through('t', rot_stop.R.t, rot_stop.C.t);
    % 76 79
    % 77 79
    rot_stop.parameter('x_lower_bnd', rot_stop.lower_bnd.check('<', rot_stop.upper_bnd));
    rot_stop.parameter('x_stiff_up', rot_stop.stiff_up.check('>', 0.0, rot_stop.stiff_up.default));
    rot_stop.parameter('x_stiff_low', rot_stop.stiff_neg.check('>', 0.0, rot_stop.stiff_up.default));
    rot_stop.parameter('x_D_up', rot_stop.D_up.check('>', 0.0, rot_stop.D_up.default));
    rot_stop.parameter('x_D_low', rot_stop.D_low.check('>', 0.0, rot_stop.D_low.default));
    % 83 85
    rot_stop.variable('phi', [1.0 1.0], 'rad');
    % 85 87
    rot_stop.equation(@equation);
end % function
function e = equation(sys, rot_stop)
    % 89 92
    % 90 92
    e = sys.equation;
    % 92 95
    % 93 95
    upper_bnd = rot_stop.upper_bnd;
    lower_bnd = rot_stop.x_lower_bnd;
    stiff_up = rot_stop.x_stiff_up;
    stiff_low = rot_stop.x_stiff_low;
    D_up = rot_stop.x_D_up;
    D_low = rot_stop.x_D_low;
    % 100 102
    rel_displacement = rot_stop.phi;
    rel_velocity = rot_stop.w;
    % 103 105
    if gt(rel_displacement, upper_bnd)
        % 105 107
        def = minus(rel_displacement, upper_bnd);
        contact_torque = plus(mtimes(stiff_up, def), mtimes(D_up, rel_velocity));
    else
        if lt(rel_displacement, lower_bnd)
            def = minus(rel_displacement, lower_bnd);
            contact_torque = plus(mtimes(stiff_low, def), mtimes(D_low, rel_velocity));
        else
            % 113 115
            def = 0.0;
            contact_torque = 0.0;
        end % if
        % 117 119
    end % if
    if sys.dc
        e(1.0) = rot_stop.phi;
    else
        e(1.0) = minus(rot_stop.phi.der, rot_stop.w);
    end % if
    e(2.0) = minus(contact_torque, rot_stop.t);
end % function
