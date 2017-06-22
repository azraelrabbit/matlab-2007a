function translational(root, domain)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    v = domain.across_variable('v');
    v.dimension = [1.0 1.0];
    v.unit = 'm/s';
    % 10 11
    N = domain.through_variable('f');
    N.dimension = [1.0 1.0];
    N.unit = 'N';
    % 14 15
end % function
