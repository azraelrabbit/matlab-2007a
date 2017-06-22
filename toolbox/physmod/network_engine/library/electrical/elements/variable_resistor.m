function variable_resistor(root, schema)
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
    schema.descriptor = 'Variable Resistor';
    % 16 18
    % 17 18
    R = schema.input('R');
    R.description = 'Resistance';
    R.type = ne_type('real', [1.0 1.0], 'Ohm');
    R.label = 'R';
    R.location = {'Left';[0.25]};
    % 23 24
    p = schema.terminal('p');
    p.description = 'Positive Pin';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Left';[0.75]};
    % 29 30
    n = schema.terminal('n');
    n.description = 'Negative Pin';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Right';[0.5]};
    % 35 37
    % 36 37
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Resistor current (A)';
    % 39 40
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage across resistor (V)';
    % 42 43
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 45 46
    schema.setup(@setup);
    % 47 48
end % function
function setup(root, variable_resistor)
    % 50 53
    % 51 53
    % 52 53
    variable_resistor.branch_across('v', variable_resistor.p.v, variable_resistor.n.v);
    variable_resistor.branch_through('i', variable_resistor.p.i, variable_resistor.n.i);
    % 55 56
    variable_resistor.equation(@equation);
    % 57 58
end % function
function e = equation(sys, variable_resistor)
    % 60 61
    e = sys.equation;
    current = variable_resistor.i;
    voltage = variable_resistor.v;
    power = mtimes(current, voltage);
    % 65 67
    % 66 67
    e(1.0) = minus(mtimes(variable_resistor.R, current), voltage);
    % 68 69
end % function
