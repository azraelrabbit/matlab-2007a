function branch(root, schema)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    schema.descriptor = 'Branch';
    schema.visible = false;
    % 9 10
    p = schema.terminal('p');
    p.description = 'Positive Terminal';
    p.domain = root.fl.electrical.electrical;
    p.label = '+';
    p.location = {'Left',[0.5]};
    % 15 16
    n = schema.terminal('n');
    n.description = 'Negative Terminal';
    n.domain = root.fl.electrical.electrical;
    n.label = '-';
    n.location = {'Right',[0.5]};
    % 21 22
    schema.setup(@setup);
    % 23 24
end % function
function setup(root, branch)
    % 26 28
    % 27 28
    branch.branch_across('v', branch.p.v, branch.n.v);
    branch.branch_through('i', branch.p.i, branch.n.i);
    % 30 31
end % function
