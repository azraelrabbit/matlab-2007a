function spring_rot(root, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    schema.descriptor = 'Rotational Spring';
    % 15 17
    % 16 17
    R = schema.terminal('R');
    R.description = 'Spring rod';
    R.domain = root.fl.mechanical.rotational.rotational;
    RC.location = {'Left';[0.5]};
    % 21 22
    C = schema.terminal('C');
    C.description = 'Spring case';
    C.domain = root.fl.mechanical.rotational.rotational;
    C.location = {'Right';[0.5]};
    % 26 28
    % 27 28
    spr_rate = schema.parameter('spr_rate');
    spr_rate.description = 'Spring rate';
    spr_rate.type = ne_type('real', [1.0 1.0], 'N*m/rad');
    spr_rate.default = 10.0;
    % 32 33
    init_def = schema.parameter('init_def');
    init_def.description = 'Initial deformation';
    init_def.type = ne_type('real', [1.0 1.0], 'rad');
    init_def.default = 0.0;
    % 37 39
    % 38 39
    var_int_f = schema.local_variable('torque');
    var_int_f.description = 'Spring torque (N*m)';
    % 41 42
    var_int_v = schema.local_variable('deformation');
    var_int_v.description = 'Spring deformation (rad)';
    % 44 45
    schema.setup(@setup);
    % 46 47
end % function
function setup(root, spring_rot)
    % 49 51
    % 50 51
    spring_rot.branch_across('w', spring_rot.R.w, spring_rot.C.w);
    spring_rot.branch_through('t', spring_rot.R.t, spring_rot.C.t);
    % 53 55
    % 54 55
    spring_rot.parameter('x_spr_rate', spring_rot.spr_rate.check('>', 0.0));
    % 56 57
    spring_rot.variable('phi', [1.0 1.0], 'rad');
    % 58 59
    spring_rot.equation(@equation);
end % function
function e = equation(sys, spring_rot)
    % 62 64
    % 63 64
    e = sys.equation;
    % 65 67
    % 66 67
    spr_rate = spring_rot.x_spr_rate;
    init_def = spring_rot.init_def;
    % 69 70
    torque = spring_rot.t;
    rel_velocity = spring_rot.w;
    deformation = spring_rot.phi;
    % 73 74
    if sys.dc
        e(1.0) = minus(spring_rot.phi, init_def);
    else
        e(1.0) = minus(rel_velocity, spring_rot.phi.der);
    end % if
    % 79 80
    e(2.0) = minus(torque, mtimes(spr_rate, deformation));
    % 81 82
end % function
