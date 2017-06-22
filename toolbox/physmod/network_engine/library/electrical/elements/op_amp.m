function op_amp(root, schema)
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
    schema.descriptor = 'Op-Amp';
    % 12 14
    % 13 14
    p = schema.terminal('p');
    p.description = 'Positive Pin';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Left';[0.25]};
    % 19 20
    n = schema.terminal('n');
    n.description = 'Negative Pin';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Left';[0.75]};
    % 25 26
    out = schema.terminal('out');
    out.description = 'Output Pin';
    out.domain = root.fl.electrical.electrical;
    out.label = '';
    out.location = {'Right';[0.25]};
    % 31 33
    % 32 33
    schema.setup(@setup);
    % 34 35
end % function
function setup(root, opamp)
    % 37 39
    % 38 39
    opamp.branch_across('v1', opamp.p.v, opamp.n.v);
    opamp.branch_through('i1', opamp.p.i, opamp.n.i);
    % 41 42
    opamp.equation(@equation);
end % function
function e = equation(sys, opamp)
    % 45 47
    % 46 47
    e = sys.equation;
    % 48 50
    % 49 50
    e(1.0) = opamp.v1;
    e(2.0) = opamp.i1;
end % function
