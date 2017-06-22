function reference_transl(root, schema)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.descriptor = 'Mechanical Translational Reference';
    % 11 13
    % 12 13
    V = schema.terminal('V');
    V.description = 'Reference port';
    V.domain = root.fl.mechanical.translational.translational;
    V.label = '';
    V.location = 'top';
    % 18 20
    % 19 20
    schema.setup(@setup);
end % function
function setup(root, transl_ref)
    % 23 25
    % 24 25
    transl_ref.branch_across('v', transl_ref.V.v, []);
    % 26 27
    transl_ref.equation(@equation);
end % function
function e = equation(sys, transl_ref)
    % 30 32
    % 31 32
    e = sys.equation;
    % 33 34
    e = transl_ref.v;
    % 35 36
end % function
