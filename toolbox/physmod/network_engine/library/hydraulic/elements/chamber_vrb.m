function chamber_vrb(root, schema)
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
    schema.descriptor = 'Variable Volume Chamber';
    % 19 21
    % 20 21
    P = schema.input('P');
    P.description = 'Piston displacement';
    P.type = ne_type('real', [1.0 1.0], 'm');
    P.location = {'Top';[0.25]};
    % 25 27
    % 26 27
    A = schema.terminal('A');
    A.description = 'Chamber inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Top';[0.75]};
    % 31 33
    % 32 33
    area = schema.parameter('area');
    area.description = 'Piston area';
    area.type = ne_type('real', [1.0 1.0], 'm^2');
    area.default = .0005;
    % 37 38
    or = schema.parameter('or');
    or.description = 'Chamber orientation';
    or.type = ne_type('real', [1.0 1.0], '1');
    or.default = 1.0;
    % 42 43
    V_dead = schema.parameter('V_dead');
    V_dead.description = 'Chamber dead volume';
    V_dead.type = ne_type('real', [1.0 1.0], 'm^3');
    V_dead.default = .0001;
    % 47 48
    k_sh = schema.parameter('k_sh');
    k_sh.description = 'Specific heat ratio';
    k_sh.type = ne_type('real', [1.0 1.0], '1');
    k_sh.default = 1.4;
    % 52 53
    initial_pressure = schema.parameter('initial_pressure');
    initial_pressure.description = 'Initial pressure';
    initial_pressure.type = ne_type('real', [1.0 1.0], 'Pa');
    initial_pressure.default = 0.0;
    % 57 59
    % 58 59
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate into the chamber (m^3/s)';
    % 61 62
    var_int_p = schema.local_variable('pressure');
    var_int_p.description = 'Pressure at the inlet (Pa)';
    % 64 65
    var_int_v = schema.local_variable('volume');
    var_int_v.description = 'Instantaneous chamber volume (m^3)';
    % 67 68
    var_int_vf = schema.local_variable('fl_volume');
    var_int_vf.description = 'Compressed fluid volume (m^3)';
    % 70 72
    % 71 72
    schema.setup(@setup);
    % 73 74
end % function
function setup(root, chamber_var)
    % 76 78
    % 77 78
    chamber_var.branch_across('p', chamber_var.A.p, []);
    chamber_var.branch_through('q', chamber_var.A.q, []);
    % 80 82
    % 81 82
    chamber_var.parameter('x_area', chamber_var.area.check('>', 0.0));
    chamber_var.parameter('x_V_dead', chamber_var.V_dead.check('>', 0.0));
    x_k_sh = chamber_var.k_sh.check('>=', 1.0, chamber_var.k_sh.default);
    x_k_sh = x_k_sh.check('<', 2.0, chamber_var.k_sh.default);
    chamber_var.parameter('x_k_sh', x_k_sh);
    x_or = chamber_var.or;
    if eq(x_or, 2.0)
        x_or = -1.0;
    end % if
    chamber_var.parameter('x_or', x_or);
    % 92 93
    chamber_var.parameter('bulk', chamber_var.A.bulk);
    chamber_var.parameter('alpha', chamber_var.A.alpha);
    % 95 96
    chamber_var.parameter('p_a', {[101325.0],'Pa'});
    chamber_var.parameter('min_volume', {[1e-06],'m^3'});
    % 98 101
    % 99 101
    % 100 101
    chamber_var.equation(@equation);
end % function
function e = equation(sys, chamber_var)
    % 104 106
    % 105 106
    e = sys.equation;
    % 107 110
    % 108 110
    % 109 110
    area = chamber_var.x_area;
    or = chamber_var.x_or;
    V_dead = chamber_var.x_V_dead;
    k_sh = chamber_var.x_k_sh;
    min_volume = chamber_var.min_volume;
    initial_pressure = chamber_var.initial_pressure;
    % 116 117
    bulk = chamber_var.bulk;
    alpha = chamber_var.alpha;
    p_a = chamber_var.p_a;
    % 120 122
    % 121 122
    pressure = chamber_var.p;
    flow_rate = chamber_var.q;
    pist_displacement = chamber_var.P;
    % 125 126
    p_abs = plus(p_a, pressure);
    p_nom = mpower(mrdivide(p_a, p_abs), mrdivide(1.0, k_sh));
    p_den = mrdivide(mtimes(p_nom, bulk), mtimes(k_sh, p_abs));
    % 129 131
    % 130 131
    volume = plus(V_dead, mtimes(mtimes(area, or), pist_displacement));
    if lt(volume, min_volume)
        volume = min_volume;
    end % if
    % 135 136
    bulk_inst = mrdivide(mtimes(bulk, plus(1.0, mtimes(alpha, p_nom))), plus(1.0, mtimes(alpha, p_den)));
    % 137 138
    fl_volume = mrdivide(mtimes(volume, pressure), bulk_inst);
    % 139 140
    if sys.dc
        e(1.0) = minus(chamber_var.p, initial_pressure);
    else
        e(1.0) = minus(chamber_var.q, mtimes(mrdivide(volume, bulk_inst), chamber_var.p.der));
    end % if
    % 145 146
end % function
