function hydro_reference(root, schema)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.descriptor = 'Hydraulic Reference';
    % 11 13
    % 12 13
    P = schema.terminal('P');
    P.description = 'Reference port';
    P.domain = root.fl.hydraulic.hydraulic;
    P.label = '';
    P.location = 'top';
    % 18 20
    % 19 20
    schema.setup(@setup);
end % function
function setup(root, hydro_ref)
    % 23 24
    hydro_ref.branch_across('p', hydro_ref.P.p, []);
    % 25 26
    hydro_ref.equation(@equation);
end % function
function e = equation(sys, hydro_ref)
    % 29 31
    % 30 31
    e = sys.equation;
    % 32 33
    e(1.0) = hydro_ref.p;
end % function
