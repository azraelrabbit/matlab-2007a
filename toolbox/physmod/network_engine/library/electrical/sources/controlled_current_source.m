function controlled_current_source(root, schema)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    schema.descriptor = 'Controlled Current Source';
    % 12 14
    % 13 14
    iT = schema.input('iT');
    iT.description = 'Control signal';
    iT.type = ne_type('real', [1.0 1.0], 'A');
    iT.label = '';
    iT.location = {'Bottom';[0.25]};
    % 19 20
    n = schema.terminal('n');
    n.description = 'Negative Pin';
    n.domain = root.fl.electrical.electrical;
    n.label = '';
    n.location = {'Bottom';[0.75]};
    % 25 26
    p = schema.terminal('p');
    p.description = 'Positive Pin';
    p.domain = root.fl.electrical.electrical;
    p.label = '';
    p.location = {'Top';[0.5]};
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    var_int_i = schema.local_variable('current');
    var_int_i.description = 'Current (A)';
    % 37 38
    var_int_v = schema.local_variable('voltage');
    var_int_v.description = 'Voltage (V)';
    % 40 41
    var_int_w = schema.local_variable('power');
    var_int_w.description = 'Power (W)';
    % 43 45
    % 44 45
    schema.setup(@setup);
    % 46 47
end % function
function setup(root, controlled_current_source)
    % 49 51
    % 50 51
    controlled_current_source.branch_across('v', controlled_current_source.p.v, controlled_current_source.n.v);
    controlled_current_source.branch_through('i', controlled_current_source.p.i, controlled_current_source.n.i);
    % 53 54
    controlled_current_source.equation(@equation);
    % 55 56
end % function
function e = equation(sys, controlled_current_source)
    % 58 60
    % 59 60
    e = sys.equation;
    % 61 62
    current = controlled_current_source.i;
    voltage = controlled_current_source.v;
    power = mtimes(current, voltage);
    % 65 66
    e(1.0) = plus(controlled_current_source.i, controlled_current_source.iT);
    % 67 68
end % function
