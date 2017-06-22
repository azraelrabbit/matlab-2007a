function reference_rot(root, schema)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    schema.descriptor = 'Mechanical Rotational Reference';
    % 11 13
    % 12 13
    W = schema.terminal('W');
    W.description = 'Reference port';
    W.domain = root.fl.mechanical.rotational.rotational;
    W.label = '';
    W.location = 'top';
    % 18 20
    % 19 20
    schema.setup(@setup);
end % function
function setup(root, rot_ref)
    % 23 25
    % 24 25
    rot_ref.branch_across('w', rot_ref.W.w, []);
    % 26 27
    rot_ref.equation(@equation);
    % 28 29
end % function
function e = equation(sys, rot_ref)
    % 31 33
    % 32 33
    e = sys.equation;
    % 34 35
    e = rot_ref.w;
    % 36 37
end % function
