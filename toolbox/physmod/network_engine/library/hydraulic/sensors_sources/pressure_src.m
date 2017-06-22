function pressure_src(root, schema)
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
    schema.descriptor = 'Ideal Hydraulic Pressure Source';
    % 16 18
    % 17 18
    S = schema.input('S');
    S.description = 'Control signal';
    S.location = {'Bottom';[0.25]};
    S.type = ne_type('real', [1.0 1.0], 'Pa');
    % 22 23
    T = schema.terminal('T');
    T.description = 'Source inlet';
    T.domain = root.fl.hydraulic.hydraulic;
    T.location = {'Bottom';[0.75]};
    % 27 28
    P = schema.terminal('P');
    P.description = 'Source outlet';
    P.domain = root.fl.hydraulic.hydraulic;
    P.location = {'Top';[0.5]};
    % 32 34
    % 33 34
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the source (m^3/s)';
    % 36 37
    var_int_p = schema.local_variable('pr_differential');
    var_int_p.description = 'Pressure differential across the source (Pa)';
    % 39 40
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Source power (W)';
    % 42 43
    schema.setup(@setup);
    % 44 45
end % function
function setup(root, hyd_pressure_src)
    % 47 49
    % 48 49
    hyd_pressure_src.branch_across('p', hyd_pressure_src.P.p, hyd_pressure_src.T.p);
    % 50 51
    hyd_pressure_src.branch_through('q', hyd_pressure_src.P.q, hyd_pressure_src.T.q);
    % 52 54
    % 53 54
    hyd_pressure_src.equation(@equation);
end % function
function e = equation(sys, hyd_pressure_src)
    % 57 59
    % 58 59
    e = sys.equation;
    % 60 61
    pr_differential = hyd_pressure_src.S;
    % 62 63
    flow_rate = hyd_pressure_src.q;
    % 64 65
    power = mtimes(pr_differential, flow_rate);
    % 66 67
    e(1.0) = minus(hyd_pressure_src.p, pr_differential);
    % 68 69
end % function
