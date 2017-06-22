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
    thisclass = schema.class(package, 'dg_dfilt');
    % 11 12
    p = schema.prop(thisclass, 'label', 'string');
    p.FactoryValue = 'dfilt';
    p.AccessFlags.Init;
    % 15 16
    p = schema.prop(thisclass, 'expandOrientation', 'ExpansionOrientation');
    p.FactoryValue = 'ud';
    % 18 19
    findclass(package, 'stage');
    p = schema.prop(thisclass, 'stage', 'filtgraph.stage vector');
    p.AccessFlags.PublicSet = 'Off';
    % 22 23
    p = schema.prop(thisclass, 'gridGrowingFactor', 'double_vector');
    p.FactoryValue = [1.0 1.0];
    % 25 26
    p = schema.prop(thisclass, 'stageGridNumber', 'double_vector');
    p.FactoryValue = [1.0 1.0];
end % function
