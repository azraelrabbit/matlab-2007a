function accumulator_gas(root, schema)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    schema.descriptor = 'Gas-Charged Accumulator';
    % 23 25
    % 24 25
    A = schema.terminal('A');
    A.description = 'Accumulator inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Bottom';[0.5]};
    A.label = '';
    % 30 32
    % 31 32
    capacity = schema.parameter('capacity');
    capacity.description = 'Capacity';
    capacity.type = ne_type('real', [1.0 1.0], 'm^3');
    capacity.default = .008;
    % 36 37
    pr_preload = schema.parameter('pr_preload');
    pr_preload.description = 'Preload pressure (gauge)';
    pr_preload.type = ne_type('real', [1.0 1.0], 'Pa');
    pr_preload.default = 1e+06;
    % 41 42
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 46 47
    v = schema.parameter('v_init');
    v.description = 'Initial volume';
    v.type = ne_type('real', [1.0 1.0], 'm^3');
    v.default = 0.0;
    % 51 53
    % 52 53
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Accumulator flow rate (m^3/s)';
    % 55 56
    var_int_p = schema.local_variable('pr_fluid');
    var_int_p.description = 'Fluid pressure (Pa)';
    % 58 59
    var_int_v = schema.local_variable('fluid_volume');
    var_int_v.description = 'Initial fluid volume (m^3)';
    % 61 62
    schema.setup(@setup);
    % 63 64
end % function
function setup(root, accum_gas)
    % 66 68
    % 67 68
    accum_gas.branch_across('p', accum_gas.A.p, []);
    accum_gas.branch_through('q', accum_gas.A.q, []);
    % 70 72
    % 71 72
    accum_gas.parameter('x_capacity', accum_gas.capacity.check('>', 0.0));
    accum_gas.parameter('x_pr_preload', accum_gas.pr_preload.check('>', 0.0));
    x_k_sh = accum_gas.k_sh;
    x_k_sh = x_k_sh.check('>=', 1.0, accum_gas.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, accum_gas.k_sh.default);
    accum_gas.parameter('x_k_sh', x_k_sh);
    accum_gas.parameter('x_v_init', accum_gas.v_init.check('>=', 0.0).check('<=', accum_gas.capacity));
    % 79 81
    % 80 81
    p_a = {[101325.0],'Pa'};
    accum_gas.parameter('p_a', p_a);
    % 83 90
    % 84 90
    % 85 90
    % 86 90
    % 87 90
    % 88 90
    % 89 90
    x_gain = {[1e-13],'m^3/Pa'};
    accum_gas.parameter('x_gain', {[1e-13],'m^3/Pa'});
    % 92 94
    % 93 94
    v_init = accum_gas.v_init;
    pr_preload = accum_gas.pr_preload;
    capacity = accum_gas.capacity;
    x_vol_preload = mtimes(x_gain, plus(pr_preload, p_a));
    accum_gas.parameter('x_vol_preload', x_vol_preload);
    % 99 100
    if le(v_init, mtimes(plus(pr_preload, p_a), x_gain))
        x_p_init = minus(mrdivide(v_init, x_gain), p_a);
    else
        x_p_init = minus(mtimes(plus(pr_preload, p_a), mpower(minus(1.0, mrdivide(minus(v_init, x_vol_preload), capacity)), uminus(x_k_sh))), p_a);
    end % if
    accum_gas.parameter('x_p_init', x_p_init);
    accum_gas.equation(@equation);
end % function
function e = equation(sys, accum_gas)
    % 109 111
    % 110 111
    e = sys.equation;
    % 112 114
    % 113 114
    capacity = accum_gas.x_capacity;
    pr_preload = accum_gas.x_pr_preload;
    k_sh = accum_gas.x_k_sh;
    p_a = accum_gas.p_a;
    v_init = accum_gas.x_v_init;
    p_init = accum_gas.x_p_init;
    % 120 121
    gain = accum_gas.x_gain;
    % 122 123
    vol_preload = accum_gas.x_vol_preload;
    pr_fluid = accum_gas.p;
    flow_rate = accum_gas.q;
    % 126 127
    if le(pr_fluid, pr_preload)
        fluid_volume = mtimes(gain, plus(pr_fluid, p_a));
    else
        fluid_volume = plus(vol_preload, mtimes(capacity, minus(1.0, mpower(mrdivide(plus(pr_preload, p_a), plus(pr_fluid, p_a)), mrdivide(1.0, k_sh)))));
        % 131 132
    end % if
    % 133 135
    % 134 135
    if sys.dc
        e(1.0) = minus(pr_fluid, p_init);
    else
        e(1.0) = minus(accum_gas.q, fluid_volume.der);
    end % if
end % function
