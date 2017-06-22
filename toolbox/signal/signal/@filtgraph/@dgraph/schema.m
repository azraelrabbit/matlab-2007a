function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    % 9 10
    thisclass = schema.class(package, 'dgraph');
    thisclass.Description = 'abstract';
    % 12 13
    findclass(package, 'nodelist');
    p = schema.prop(thisclass, 'nodeList', 'filtgraph.nodelist');
    p.AccessFlags.PublicSet = 'On';
    % 16 17
    p = schema.prop(thisclass, 'numNodes', 'double');
    p.AccessFlags.PublicSet = 'On';
end % function
