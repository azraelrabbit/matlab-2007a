function reference_electrical(root, schema)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    schema.descriptor = 'Electrical Reference';
    % 10 12
    % 11 12
    V = schema.terminal('V');
    V.description = 'Reference port';
    V.domain = root.fl.electrical.electrical;
    V.label = '';
    V.location = 'top';
    % 17 19
    % 18 19
    schema.setup(@setup);
end % function
function setup(root, elec_ref)
    % 22 24
    % 23 24
    elec_ref.branch_across('v', elec_ref.V.v, []);
    % 25 26
    elec_ref.equation(@equation);
end % function
function e = equation(sys, elec_ref)
    % 29 31
    % 30 31
    e = sys.equation;
    % 32 33
    e = elec_ref.v;
    % 34 35
end % function
