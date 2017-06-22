function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('dfilt');
    parent = findclass(pk, 'dtfwnum');
    % 10 11
    thisclass = schema.class(pk, 'dtfiir', parent);
    set(thisclass, 'Description', 'abstract');
    % 13 14
    p = schema.prop(thisclass, 'Denominator', 'mxArray');
    set(p, 'SetFunction', @setdenominator, 'GetFunction', @getdenominator, 'FactoryValue', 1.0);
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    p = schema.prop(thisclass, 'privden', 'DFILTNonemptyVector');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(thisclass, 'refden', 'DFILTNonemptyVector');
    set(p, 'SetFunction', @setrefden, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    % 34 35
    p = schema.prop(thisclass, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
    set(p, 'AccessFlags.Serialize', 'off', 'AccessFlags.Init', 'Off');
end % function
