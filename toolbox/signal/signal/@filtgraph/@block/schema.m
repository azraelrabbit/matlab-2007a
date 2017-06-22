function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'block');
    % 10 11
    p = schema.prop(thisclass, 'nodeIndex', 'double');
    p.AccessFlags.PublicSet = 'Off';
    % 13 14
    p = schema.prop(thisclass, 'blocktype', 'BlockType');
    p.AccessFlags.PublicSet = 'Off';
    % 16 17
    c = package.findclass('inport');
    p = schema.prop(thisclass, 'inport', 'filtgraph.inport vector');
    % 19 20
    c = package.findclass('outport');
    p = schema.prop(thisclass, 'outport', 'filtgraph.outport vector');
    % 22 23
    p = schema.prop(thisclass, 'label', 'string');
    p.AccessFlags.PublicSet = 'On';
    p.FactoryValue = '';
    p.AccessFlags.Init;
    % 27 28
    p = schema.prop(thisclass, 'mainParam', 'string');
    p.AccessFlags.PublicSet = 'On';
    % 30 31
    p = schema.prop(thisclass, 'paramList', 'string vector');
    p.AccessFlags.PublicSet = 'On';
    % 33 34
    p = schema.prop(thisclass, 'orientation', 'Orientation');
    p.AccessFlags.PublicSet = 'On';
end % function
