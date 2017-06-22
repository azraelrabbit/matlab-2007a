function inductor(root, schema)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.extends(root.fl.electrical.branch);
    schema.descriptor = 'Inductor';
    % 22 24
    % 23 24
    l = schema.parameter('l');
    l.description = 'Inductance';
    l.type = ne_type('real', [1.0 1.0], 'H');
    l.default = {[1e-06],'H'};
    % 28 29
    i0 = schema.parameter('i0');
    i0.description = 'Initial current';
    i0.type = ne_type('real', [1.0 1.0], 'A');
    i0.default = {[0.0],'A'};
    % 33 34
    r = schema.parameter('r');
    r.description = 'Series resistance';
    r.type = ne_type('real', [1.0 1.0], 'Ohm');
    r.default = {[0.0],'Ohm'};
    % 38 39
    g = schema.parameter('g');
    g.description = 'Parallel conductance';
    g.type = ne_type('real', [1.0 1.0], '1/Ohm');
    g.default = {[1e-09],'1/Ohm'};
    % 43 45
    % 44 45
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Inductor current (A) ';
    % 47 48
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage across inductor (V)';
    % 50 51
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 53 54
    schema.setup(@setup);
    % 55 56
end % function
function setup(root, inductor)
    % 58 61
    % 59 61
    % 60 61
    inductor.parameter('x_l', inductor.l.check('>', 0.0));
    inductor.equation(@equation);
    % 63 66
    % 64 66
    % 65 66
    inductor.variable('i_L', [1.0 1.0], 'A');
    % 67 68
end % function
function e = equation(sys, inductor)
    % 70 71
    e = sys.equation;
    % 72 73
    current = inductor.i;
    voltage = inductor.v;
    power = mtimes(current, voltage);
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    if sys.dc
        e(1.0) = minus(plus(inductor.i0, mtimes(inductor.v, inductor.g)), inductor.i);
    else
        e(1.0) = minus(plus(mtimes(inductor.i_L, inductor.r), mtimes(inductor.x_l, inductor.i_L.der)), inductor.v);
    end % if
    e(2.0) = minus(plus(mtimes(inductor.v, inductor.g), inductor.i_L), inductor.i);
    % 86 87
end % function
