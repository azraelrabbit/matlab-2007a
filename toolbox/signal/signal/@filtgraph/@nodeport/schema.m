function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'nodeport');
    % 10 11
    p = schema.prop(thisclass, 'node', 'double');
    p.AccessFlags.PublicSet = 'On';
    % 13 14
    p = schema.prop(thisclass, 'port', 'double');
    p.AccessFlags.PublicSet = 'On';
end % function
