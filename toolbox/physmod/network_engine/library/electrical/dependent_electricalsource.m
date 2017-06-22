function dependent_electricalsource(root, schema)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    schema.descriptor = 'DependentElectricalSource';
    schema.visible = false;
    % 9 10
    p1 = schema.terminal('p1');
    p1.description = 'Positive LH Terminal';
    p1.domain = root.fl.electrical.electrical;
    p1.label = '+';
    p1.location = {'Top',[0.25]};
    % 15 16
    n1 = schema.terminal('n1');
    n1.description = 'Negative LH Terminal';
    n1.domain = root.fl.electrical.electrical;
    n1.label = '-';
    n1.location = {'Bottom',[0.25]};
    % 21 22
    p2 = schema.terminal('p2');
    p2.description = 'Positive RH Terminal';
    p2.domain = root.fl.electrical.electrical;
    p2.label = '';
    p2.location = {'Top',[0.75]};
    % 27 28
    n2 = schema.terminal('n2');
    n2.description = 'Negative RH Terminal';
    n2.domain = root.fl.electrical.electrical;
    n2.label = '';
    n2.location = {'Bottom',[0.75]};
    % 33 34
    schema.setup(@setup);
    % 35 36
end % function
function setup(root, electricalsource)
    % 38 40
    % 39 40
    electricalsource.branch_across('v1', electricalsource.p1.v, electricalsource.n1.v);
    electricalsource.branch_through('i1', electricalsource.p1.i, electricalsource.n1.i);
    electricalsource.branch_across('v2', electricalsource.p2.v, electricalsource.n2.v);
    electricalsource.branch_through('i2', electricalsource.p2.i, electricalsource.n2.i);
    % 44 45
end % function
