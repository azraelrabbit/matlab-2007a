function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    package = findpackage('rfckt');
    parent = findclass(package, 'rlcckt');
    % 9 11
    % 10 11
    h = schema.class(package, 'seriesrlc', parent);
end % function
