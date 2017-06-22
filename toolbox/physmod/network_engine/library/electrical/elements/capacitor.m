function capacitor(root, schema)
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
    schema.descriptor = 'Capacitor';
    % 22 24
    % 23 24
    c = schema.parameter('c');
    c.description = 'Capacitance';
    c.type = ne_type('real', [1.0 1.0], 'F');
    c.default = {[1e-06],'F'};
    % 28 29
    v0 = schema.parameter('v0');
    v0.description = 'Initial voltage';
    v0.type = ne_type('real', [1.0 1.0], 'V');
    v0.default = {[0.0],'V'};
    % 33 34
    r = schema.parameter('r');
    r.description = 'Series resistance';
    r.type = ne_type('real', [1.0 1.0], 'Ohm');
    r.default = {[1e-06],'Ohm'};
    % 38 39
    g = schema.parameter('g');
    g.description = 'Parallel conductance';
    g.type = ne_type('real', [1.0 1.0], '1/Ohm');
    g.default = {[0.0],'1/Ohm'};
    % 43 45
    % 44 45
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Capacitor current (A)';
    % 47 48
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage across capacitor (V)';
    % 50 51
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 53 54
    schema.setup(@setup);
    % 55 56
end % function
function setup(root, capacitor)
    % 58 61
    % 59 61
    % 60 61
    capacitor.parameter('x_c', capacitor.c.check('>', 0.0));
    capacitor.equation(@equation);
    % 63 66
    % 64 66
    % 65 66
    capacitor.variable('vc', [1.0 1.0], 'V');
    % 67 68
end % function
function e = equation(sys, capacitor)
    % 70 71
    e = sys.equation;
    % 72 73
    current = capacitor.i;
    voltage = capacitor.v;
    power = mtimes(current, voltage);
    % 76 80
    % 77 80
    % 78 80
    % 79 80
    e(1.0) = minus(plus(mtimes(capacitor.i, capacitor.r), capacitor.vc), capacitor.v);
    if sys.dc
        e(2.0) = minus(capacitor.vc, capacitor.v0);
    else
        e(2.0) = minus(plus(mtimes(capacitor.x_c, capacitor.vc.der), mtimes(capacitor.g, capacitor.vc)), capacitor.i);
    end % if
    % 86 87
end % function
