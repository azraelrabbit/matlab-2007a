function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('filtgraph');
    thisclass = schema.class(package, 'port');
    % 10 11
    p = schema.prop(thisclass, 'nodeIndex', 'double');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = 0.0;
    p.AccessFlags.Init;
    % 15 16
    p = schema.prop(thisclass, 'selfIndex', 'double');
    p.AccessFlags.PublicSet = 'Off';
    p.FactoryValue = 0.0;
    p.AccessFlags.Init;
end % function
