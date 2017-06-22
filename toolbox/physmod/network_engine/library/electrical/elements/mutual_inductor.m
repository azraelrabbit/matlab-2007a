function mutual_inductor(root, schema)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    schema.descriptor = 'Mutual Inductor';
    % 20 22
    % 21 22
    p1 = schema.terminal('p1');
    p1.description = 'Positive Pin 1';
    p1.domain = root.fl.electrical.electrical;
    p1.label = '+';
    p1.location = {'Left';[0.25]};
    % 27 28
    n1 = schema.terminal('n1');
    n1.description = 'Negative Pin 1';
    n1.domain = root.fl.electrical.electrical;
    n1.label = '-';
    n1.location = {'Left';[0.75]};
    % 33 34
    p2 = schema.terminal('p2');
    p2.description = 'Positive Pin 2';
    p2.domain = root.fl.electrical.electrical;
    p2.label = '+';
    p2.location = {'Right';[0.25]};
    % 39 40
    n2 = schema.terminal('n2');
    n2.description = 'Negative Pin 2';
    n2.domain = root.fl.electrical.electrical;
    n2.label = '-';
    n2.location = {'Right';[0.75]};
    % 45 47
    % 46 47
    L1 = schema.parameter('L1');
    L1.description = 'Inductance L1';
    L1.type = ne_type('real', [1.0 1.0], 'H');
    L1.default = {[10.0],'H'};
    % 51 52
    L2 = schema.parameter('L2');
    L2.description = 'Inductance L2';
    L2.type = ne_type('real', [1.0 1.0], 'H');
    L2.default = {[0.1],'H'};
    % 56 57
    k = schema.parameter('k');
    k.description = 'Coefficient of coupling';
    k.type = ne_type('real', [1.0 1.0], '1');
    k.default = .9;
    % 61 62
    i10 = schema.parameter('i10');
    i10.description = 'Winding 1 initial current';
    i10.type = ne_type('real', [1.0 1.0], 'A');
    i10.default = {[0.0],'A'};
    % 66 67
    i20 = schema.parameter('i20');
    i20.description = 'Winding 2 initial current';
    i20.type = ne_type('real', [1.0 1.0], 'A');
    i20.default = {[0.0],'A'};
    % 71 73
    % 72 73
    var_int_i1 = schema.local_variable('current_1');
    var_int_i1.description = 'Winding 1 current (A) ';
    % 75 76
    var_int_v1 = schema.local_variable('voltage_1');
    var_int_v1.description = 'Winding 1 voltage (V)';
    % 78 79
    var_int_pw = schema.local_variable('power');
    var_int_pw.description = 'Power (W)';
    % 81 82
    var_int_i2 = schema.local_variable('current_2');
    var_int_i2.description = 'Winding 2 current (A)';
    % 84 85
    var_int_v2 = schema.local_variable('voltage_2');
    var_int_v2.description = 'Winding 2 voltage (V)';
    % 87 88
    schema.setup(@setup);
    % 89 90
end % function
function setup(root, mutual_inductor)
    % 92 94
    % 93 94
    mutual_inductor.branch_across('v1', mutual_inductor.p1.v, mutual_inductor.n1.v);
    mutual_inductor.branch_through('i1', mutual_inductor.p1.i, mutual_inductor.n1.i);
    % 96 97
    mutual_inductor.branch_across('v2', mutual_inductor.p2.v, mutual_inductor.n2.v);
    mutual_inductor.branch_through('i2', mutual_inductor.p2.i, mutual_inductor.n2.i);
    % 99 101
    % 100 101
    mutual_inductor.parameter('x_L1', mutual_inductor.L1.check('>', 0.0));
    mutual_inductor.parameter('x_L2', mutual_inductor.L2.check('>', 0.0));
    mutual_inductor.parameter('x_k_0', mutual_inductor.k.check('>', 0.0));
    mutual_inductor.parameter('x_k', mutual_inductor.k.check('<', 1.0));
    % 105 106
    mutual_inductor.equation(@equation);
    % 107 108
end % function
function e = equation(sys, mutual_inductor)
    % 110 113
    % 111 113
    % 112 113
    e = sys.equation;
    % 114 115
    k = mutual_inductor.x_k;
    L1 = mutual_inductor.x_L1;
    L2 = mutual_inductor.x_L2;
    M = mtimes(k, sqrt(mtimes(L1, L2)));
    % 119 120
    current_1 = mutual_inductor.i1;
    voltage_1 = mutual_inductor.v1;
    power = mtimes(current_1, voltage_1);
    current_2 = mutual_inductor.i2;
    voltage_2 = mutual_inductor.v2;
    % 125 127
    % 126 127
    if sys.dc
        e(1.0) = minus(current_1, mutual_inductor.i10);
        e(2.0) = minus(current_2, mutual_inductor.i20);
    else
        e(1.0) = minus(plus(mtimes(minus(mtimes(L1, L2), mpower(M, 2.0)), current_2.der), mtimes(M, voltage_1)), mtimes(L1, voltage_2));
        e(2.0) = minus(plus(mtimes(minus(mtimes(L1, L2), mpower(M, 2.0)), current_1.der), mtimes(M, voltage_2)), mtimes(L2, voltage_1));
    end % if
end % function
