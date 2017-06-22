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
    parent = findclass(package, 'singleton');
    % 12 13
    thisclass = schema.class(package, 'dtfwnum', parent);
    set(thisclass, 'Description', 'abstract');
    % 15 16
    p = schema.prop(thisclass, 'Numerator', 'mxArray');
    set(p, 'SetFunction', @setnumerator, 'GetFunction', @getnumerator, 'FactoryValue', 1.0);
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    p = schema.prop(thisclass, 'privnum', 'DFILTNonemptyVector');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    p = schema.prop(thisclass, 'refnum', 'DFILTNonemptyVector');
    p.SetFunction = @setrefnum;
    set(p, 'SetFunction', @setrefnum, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 35 38
    % 36 38
    % 37 38
end % function
