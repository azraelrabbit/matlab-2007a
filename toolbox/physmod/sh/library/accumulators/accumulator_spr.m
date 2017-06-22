function accumulator_spr(root, schema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    schema.descriptor = 'Spring-Loaded Accumulator';
    % 17 20
    % 18 20
    A = schema.terminal('A');
    A.description = 'Accumulator inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Bottom';[0.5]};
    A.label = '';
    % 24 27
    % 25 27
    capacity = schema.parameter('capacity');
    capacity.description = 'Capacity';
    capacity.type = ne_type('real', [1.0 1.0], 'm^3');
    capacity.default = .008;
    % 30 32
    pr_preload = schema.parameter('pr_preload');
    pr_preload.description = 'Preload pressure';
    pr_preload.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_preload.default = 1e+06;
    % 35 37
    pr_max = schema.parameter('pr_max');
    pr_max.description = 'Maximum pressure';
    pr_max.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_max.default = 3e+06;
    % 40 42
    v = schema.parameter('v_init');
    v.description = 'Initial fluid volume';
    v.type = ne_type('real', [1.0 1.0], 'm^3');
    v.default = 0.0;
    % 45 48
    % 46 48
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Accumulator flow rate (m^3/s)';
    % 49 51
    var_int_p = schema.local_variable('pr_fluid');
    var_int_p.description = 'Fluid pressure (Pa)';
    % 52 54
    var_int_v = schema.local_variable('fluid_volume');
    var_int_v.description = 'Initial fluid volume (m^3)';
    % 55 57
    schema.setup(@setup);
    % 57 59
end % function
function setup(root, accum_spring)
    % 60 63
    % 61 63
    accum_spring.branch_across('p', accum_spring.A.p, []);
    accum_spring.branch_through('q', accum_spring.A.q, []);
    % 64 67
    % 65 67
    accum_spring.parameter('x_capacity', accum_spring.capacity.check('>', 0.0));
    accum_spring.parameter('x_pr_preload', accum_spring.pr_preload.check('>', 0.0));
    accum_spring.parameter('x_pr_max', accum_spring.pr_max.check('>', accum_spring.pr_preload));
    % 69 71
    accum_spring.parameter('x_v_init', accum_spring.v_init.check('>=', 0.0).check('<=', accum_spring.capacity));
    % 71 74
    % 72 74
    x_gain = mrdivide(accum_spring.capacity, minus(accum_spring.pr_max, accum_spring.pr_preload));
    % 74 77
    % 75 77
    accum_spring.parameter('x_gain', x_gain);
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    x_gain_ad = mrdivide(x_gain, 1e+06);
    accum_spring.parameter('x_gain_ad', x_gain_ad);
    % 83 86
    % 84 86
    x_vol_preload = mtimes(accum_spring.pr_preload, x_gain_ad);
    accum_spring.parameter('x_vol_preload', x_vol_preload);
    x_vol_pr_max = plus(x_vol_preload, mtimes(x_gain, minus(accum_spring.pr_max, accum_spring.pr_preload)));
    % 88 90
    accum_spring.parameter('x_vol_pr_max', x_vol_pr_max);
    % 90 92
    x_v_init = accum_spring.v_init;
    if le(x_v_init, x_vol_preload)
        x_p_init = mrdivide(x_v_init, x_gain_ad);
    else
        if ge(x_v_init, x_vol_pr_max)
            x_p_init = plus(mrdivide(minus(x_v_init, x_vol_pr_max), x_gain_ad), accum_spring.pr_max);
        else
            x_p_init = plus(mrdivide(minus(x_v_init, x_vol_preload), x_gain), accum_spring.pr_preload);
        end % if
    end % if
    accum_spring.parameter('x_p_init', x_p_init);
    accum_spring.equation(@equation);
end % function
function e = equation(sys, accum_spring)
    e = sys.equation;
    % 106 109
    % 107 109
    capacity = accum_spring.x_capacity;
    pr_preload = accum_spring.x_pr_preload;
    pr_max = accum_spring.x_pr_max;
    p_init = accum_spring.x_p_init;
    % 112 114
    gain = accum_spring.x_gain;
    gain_ad = accum_spring.x_gain_ad;
    vol_preload = accum_spring.x_vol_preload;
    vol_pr_max = accum_spring.x_vol_pr_max;
    % 117 119
    pr_fluid = accum_spring.p;
    flow_rate = accum_spring.q;
    % 120 122
    if le(pr_fluid, pr_preload)
        fluid_volume = mtimes(gain_ad, pr_fluid);
    else
        if ge(pr_fluid, pr_max)
            fluid_volume = plus(vol_pr_max, mtimes(gain_ad, minus(pr_fluid, pr_max)));
        else
            fluid_volume = plus(vol_preload, mtimes(gain, minus(pr_fluid, pr_preload)));
        end % if
    end % if
    if sys.dc
        e(1.0) = minus(pr_fluid, p_init);
    else
        e(1.0) = minus(accum_spring.q, fluid_volume.der);
    end % if
end % function
