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
    parent = findclass(package, 'dgraph');
    thisclass = schema.class(package, 'stage', parent);
    % 12 13
    findclass(package, 'nodeport');
    p = schema.prop(thisclass, 'prevInputPorts', 'filtgraph.nodeport vector');
    p.AccessFlags.PublicSet = 'On';
    % 16 17
    p = schema.prop(thisclass, 'prevOutputPorts', 'filtgraph.nodeport vector');
    p.AccessFlags.PublicSet = 'On';
    % 19 20
    p = schema.prop(thisclass, 'nextInputPorts', 'filtgraph.nodeport vector');
    p.AccessFlags.PublicSet = 'On';
    % 22 23
    p = schema.prop(thisclass, 'nextOutputPorts', 'filtgraph.nodeport vector');
    p.AccessFlags.PublicSet = 'On';
    % 25 26
    findclass(package, 'indexparam');
    p = schema.prop(thisclass, 'mainParamList', 'filtgraph.indexparam vector');
    p.AccessFlags.PublicSet = 'On';
    % 29 30
    findclass(package, 'qindexparam');
    p = schema.prop(thisclass, 'qparamList', 'filtgraph.qindexparam vector');
    p.AccessFlags.PublicSet = 'On';
    % 33 34
    p = schema.prop(thisclass, 'numStages', 'double');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = 1.0;
    p.AccessFlags.Init;
end % function
