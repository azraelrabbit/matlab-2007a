function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('farrow');
    ppk = findpackage('dfilt');
    c = schema.class(pk, 'abstractfd', ppk.findclass('abstractfilter'));
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'Arithmetic', 'filterdesign_arith');
    p.AccessFlags.AbortSet = 'off';
    p.GetFunction = @get_arith;
    p.SetFunction = @set_arith;
    if not(isfdtbxinstalled)
        p.AccessFlags.PublicGet = 'off';
        p.AccessFlags.PublicSet = 'off';
    end % if
    set(p, 'AccessFlags.Serialize', 'off', 'AccessFlags.Init', 'Off');
    % 22 23
    p = schema.prop(c, 'FracDelay', 'mxArray');
    set(p, 'FactoryValue', 0.0, 'AccessFlags.AbortSet', 'off', 'Setfunction', @set_delay, 'Getfunction', @get_delay);
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'privfracdelay', 'DFILTNonemptyVector');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    p = schema.prop(c, 'reffracdelay', 'DFILTNonemptyVector');
    set(p, 'SetFunction', @setreffracdelay, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    % 44 45
    p = schema.prop(c, 'privcoeffs', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    p = schema.prop(c, 'refcoeffs', 'mxArray');
    set(p, 'SetFunction', @setrefcoeffs, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 54 57
    % 55 57
    % 56 57
end % function
