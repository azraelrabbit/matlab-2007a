function lib(root, lib)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    lib.descriptor = 'Mechanical';
    % 8 9
    lib.library('mechanisms');
    lib.library('rotational');
    lib.library('sensors_sources');
    lib.library('translational');
    % 13 14
end % function
