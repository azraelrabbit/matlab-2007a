function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'nodelist');
    % 10 11
    findclass(package, 'node');
    p = schema.prop(thisclass, 'nodes', 'filtgraph.node vector');
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'On';
    % 15 16
    p = schema.prop(thisclass, 'nodeCount', 'double');
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.PublicGet = 'Off';
end % function
