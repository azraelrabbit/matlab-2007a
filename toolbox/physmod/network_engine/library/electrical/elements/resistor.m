function resistor(root, schema)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    schema.extends(root.fl.electrical.branch);
    schema.descriptor = 'Resistor';
    % 18 20
    % 19 20
    r = schema.parameter('R');
    r.description = 'Resistance';
    r.type = ne_type('real', [1.0 1.0], 'Ohm');
    r.default = {[1.0],'Ohm'};
    % 24 26
    % 25 26
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Resistor current (A)';
    % 28 29
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage across resistor (V)';
    % 31 32
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 34 35
    schema.setup(@setup);
    % 36 37
end % function
function setup(root, resistor)
    % 39 42
    % 40 42
    % 41 42
    resistor.parameter('x_r', resistor.R.check('>', 0.0));
    resistor.equation(@equation);
    % 44 45
end % function
function e = equation(sys, resistor)
    % 47 48
    e = sys.equation;
    % 49 50
    r = resistor.x_r;
    current = resistor.i;
    voltage = resistor.v;
    power = mtimes(current, voltage);
    % 54 56
    % 55 56
    e(1.0) = minus(mtimes(r, current), voltage);
    % 57 58
end % function
