function hydraulic_res_linear(root, schema)
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
    % 16 17
    schema.descriptor = 'Linear Hydraulic Resistance';
    % 18 21
    % 19 21
    % 20 21
    A = schema.terminal('A');
    A.description = 'Tube inlet';
    A.domain = root.fl.hydraulic.hydraulic;
    A.location = {'Left';[0.5]};
    % 25 26
    B = schema.terminal('B');
    B.description = 'Tube outlet';
    B.domain = root.fl.hydraulic.hydraulic;
    B.location = {'Right';[0.5]};
    % 30 32
    % 31 32
    res = schema.parameter('resistance');
    res.description = 'Resistance';
    res.type = ne_type('real', [1.0 1.0], 'Pa/(m^3/s)');
    res.default = 1e+10;
    % 36 38
    % 37 38
    var_int_q = schema.local_variable('flow_rate');
    var_int_q.description = 'Flow rate through the element (m^3/s)';
    % 40 41
    var_int_pr = schema.local_variable('pr_differential');
    var_int_pr.description = 'Pressure differential across the resistance (Pa)';
    % 43 44
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power dissipated in the resistance (W)';
    % 46 47
    schema.setup(@setup);
    % 48 49
end % function
function setup(root, lin_res)
    % 51 53
    % 52 53
    lin_res.branch_across('p', lin_res.A.p, lin_res.B.p);
    lin_res.branch_through('q', lin_res.A.q, lin_res.B.q);
    % 55 57
    % 56 57
    lin_res.parameter('x_resistance', lin_res.resistance.check('>', 0.0));
    % 58 59
    lin_res.equation(@equation);
end % function
function e = equation(sys, lin_res)
    % 62 64
    % 63 64
    e = sys.equation;
    % 65 67
    % 66 67
    res = lin_res.x_resistance;
    flow_rate = lin_res.q;
    pr_differential = mtimes(res, flow_rate);
    % 70 71
    power = mtimes(pr_differential, flow_rate);
    % 72 73
    e(1.0) = minus(lin_res.p, pr_differential);
    % 74 75
end % function
