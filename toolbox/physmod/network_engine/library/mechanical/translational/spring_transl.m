function spring_transl(root, schema)
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
    schema.descriptor = 'Translational Spring';
    % 15 17
    % 16 17
    R = schema.terminal('R');
    R.description = 'Spring rod';
    R.domain = root.fl.mechanical.translational.translational;
    R.location = {'Left';[0.5]};
    % 21 22
    C = schema.terminal('C');
    C.description = 'Spring case';
    C.domain = root.fl.mechanical.translational.translational;
    C.location = {'Right';[0.5]};
    % 26 28
    % 27 28
    spr_rate = schema.parameter('spr_rate');
    spr_rate.description = 'Spring rate';
    spr_rate.type = ne_type('real', [1.0 1.0], 'N/m');
    spr_rate.default = 1000.0;
    % 32 33
    init_def = schema.parameter('init_def');
    init_def.description = 'Initial deformation';
    init_def.type = ne_type('real', [1.0 1.0], 'm');
    init_def.default = 0.0;
    % 37 39
    % 38 39
    var_int_f = schema.local_variable('force');
    var_int_f.description = 'Spring force (N)';
    % 41 42
    var_int_v = schema.local_variable('deformation');
    var_int_v.description = 'Spring deformation (m)';
    % 44 45
    schema.setup(@setup);
    % 46 47
end % function
function setup(root, transl_spring)
    % 49 52
    % 50 52
    % 51 52
    transl_spring.branch_across('v', transl_spring.R.v, transl_spring.C.v);
    transl_spring.branch_through('f', transl_spring.R.f, transl_spring.C.f);
    % 54 56
    % 55 56
    transl_spring.parameter('x_spr_rate', transl_spring.spr_rate.check('>', 0.0));
    % 57 58
    transl_spring.variable('x', [1.0 1.0], 'm');
    % 59 60
    transl_spring.equation(@equation);
end % function
function e = equation(sys, transl_spring)
    % 63 65
    % 64 65
    e = sys.equation;
    % 66 68
    % 67 68
    spr_rate = transl_spring.x_spr_rate;
    init_def = transl_spring.init_def;
    % 70 71
    force = transl_spring.f;
    rel_velocity = transl_spring.v;
    deformation = transl_spring.x;
    % 74 75
    if sys.dc
        e(1.0) = minus(transl_spring.x, init_def);
    else
        e(1.0) = minus(rel_velocity, transl_spring.x.der);
    end % if
    e(2.0) = minus(force, mtimes(spr_rate, deformation));
    % 81 82
end % function
