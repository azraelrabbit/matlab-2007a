function rotational(root, domain)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    w = domain.across_variable('w');
    w.dimension = [1.0 1.0];
    w.unit = 'rad/s';
    % 10 11
    t = domain.through_variable('t');
    t.dimension = [1.0 1.0];
    t.unit = 'N*m';
    % 14 15
end % function
