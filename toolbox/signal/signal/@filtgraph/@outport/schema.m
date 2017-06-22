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
    thisclass = schema.class(package, 'outport', parent);
    % 11 12
    findclass(package, 'nodeport');
    p = schema.prop(thisclass, 'to', 'filtgraph.nodeport vector');
    p.AccessFlags.PublicSet = 'Off';
end % function
