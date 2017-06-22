function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    parent = findclass(package, 'port');
    thisclass = schema.class(package, 'inport', parent);
    % 11 12
    findclass(package, 'nodeport');
    p = schema.prop(thisclass, 'from', 'filtgraph.nodeport');
    p.AccessFlags.PublicSet = 'Off';
end % function
