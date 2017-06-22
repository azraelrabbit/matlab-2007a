function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mlock;
    % 9 10
    pkg = findpackage('propset');
    inhClass = findclass(pkg, 'abstractset');
    h = schema.class(pkg, 'tree', inhClass);
end % function
