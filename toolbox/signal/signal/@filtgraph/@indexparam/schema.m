function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'indexparam');
    % 10 11
    p = schema.prop(thisclass, 'index', 'double');
    p.AccessFlags.PublicSet = 'On';
    % 13 14
    p = schema.prop(thisclass, 'params', 'string vector');
    p.AccessFlags.PublicSet = 'On';
end % function
