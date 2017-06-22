function ideal_transformer(root, schema)
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
    schema.descriptor = 'Ideal Transformer';
    % 18 20
    % 19 20
    p1 = schema.terminal('p1');
    p1.description = 'Positive Pin 1';
    p1.domain = root.fl.electrical.electrical;
    p1.label = '+';
    p1.location = {'Left';[0.25]};
    % 25 26
    n1 = schema.terminal('n1');
    n1.description = 'Negative Pin 1';
    n1.domain = root.fl.electrical.electrical;
    n1.label = '-';
    n1.location = {'Left';[0.75]};
    % 31 32
    p2 = schema.terminal('p2');
    p2.description = 'Positive Pin 2';
    p2.domain = root.fl.electrical.electrical;
    p2.label = '+';
    p2.location = {'Right';[0.25]};
    % 37 38
    n2 = schema.terminal('n2');
    n2.description = 'Negative Pin 2';
    n2.domain = root.fl.electrical.electrical;
    n2.label = '-';
    n2.location = {'Right';[0.75]};
    % 43 45
    % 44 45
    n = schema.parameter('n');
    n.description = 'Winding ratio';
    n.type = ne_type('real', [1.0 1.0], '1');
    n.default = 1.0;
    % 49 51
    % 50 51
    var_int_i1 = schema.local_variable('current_1');
    var_int_i1.description = 'Winding 1 current (A) ';
    % 53 54
    var_int_v1 = schema.local_variable('voltage_1');
    var_int_v1.description = 'Winding 1 voltage (V)';
    % 56 57
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 59 60
    var_int_i2 = schema.local_variable('current_2');
    var_int_i2.description = 'Winding 2 current (A)';
    % 62 63
    var_int_v2 = schema.local_variable('voltage_2');
    var_int_v2.description = 'Winding 2 voltage (V)';
    % 65 66
    schema.setup(@setup);
    % 67 68
end % function
function setup(root, xformer)
    % 70 72
    % 71 72
    xformer.branch_across('v1', xformer.p1.v, xformer.n1.v);
    xformer.branch_through('i1', xformer.p1.i, xformer.n1.i);
    % 74 75
    xformer.branch_across('v2', xformer.p2.v, xformer.n2.v);
    xformer.branch_through('i2', xformer.p2.i, xformer.n2.i);
    % 77 79
    % 78 79
    xformer.parameter('x_n', xformer.n.check('>', 0.0));
    % 80 81
    xformer.equation(@equation);
    % 82 83
end % function
function e = equation(sys, xformer)
    % 85 88
    % 86 88
    % 87 88
    e = sys.equation;
    % 89 90
    n = xformer.x_n;
    current_1 = xformer.i1;
    voltage_1 = xformer.v1;
    power = mtimes(current_1, voltage_1);
    current_2 = xformer.i2;
    voltage_2 = xformer.v2;
    % 96 98
    % 97 98
    e(1.0) = minus(voltage_1, mtimes(n, voltage_2));
    e(2.0) = plus(current_2, mtimes(n, current_1));
end % function
