function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    package = findpackage('dfilt');
    parent = findclass(package, 'latticear');
    % 12 13
    thisclass = schema.class(package, 'latticearma', parent);
    % 14 15
    p = schema.prop(thisclass, 'Ladder', 'mxArray');
    p.SetFunction = @setladder;
    p.GetFunction = @getladder;
    p.FactoryValue = 1.0;
    % 19 21
    % 20 21
    p = schema.prop(thisclass, 'privladder', 'DFILTNonemptyVector');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    p = schema.prop(thisclass, 'refladder', 'DFILTNonemptyVector');
    p.SetFunction = @setrefladder;
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 32 34
    % 33 34
end % function
