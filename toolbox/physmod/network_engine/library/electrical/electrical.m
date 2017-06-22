function electrical(root, domain)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    v = domain.across_variable('v');
    v.dimension = [1.0 1.0];
    v.unit = 'V';
    % 10 11
    i = domain.through_variable('i');
    i.dimension = [1.0 1.0];
    i.unit = 'A';
    % 14 15
end % function
