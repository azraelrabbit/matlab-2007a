function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    package = findpackage('mfilt');
    parent = findclass(package, 'abstractsiso');
    thisclass = schema.class(package, 'abstractpolyphase', parent);
    set(thisclass, 'Description', 'abstract');
    % 12 13
    p = schema.prop(thisclass, 'PolyphaseMatrix', 'mxArray');
    p.AccessFlags.PublicGet = 'Off';
    p.AccessFlags.PublicSet = 'Off';
    p.AccessFlags.AbortSet = 'off';
    % 17 18
    p.SetFunction = @setpolyphasematrix;
    p.GetFunction = @getpolyphasematrix;
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(thisclass, 'privpolym', 'mxArray');
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    p = schema.prop(thisclass, 'refpolym', 'mxArray');
    set(p, 'SetFunction', @setrefpolym, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off', 'AccessFlags.Init', 'Off', 'AccessFlags.AbortSet', 'off');
    % 33 36
    % 34 36
    % 35 36
end % function
