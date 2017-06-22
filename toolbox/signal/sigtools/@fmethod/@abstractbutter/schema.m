function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fmethod');
    parent = findclass(pk, 'abstractclassiciir');
    c = schema.class(pk, 'abstractbutter', parent);
    set(c, 'Description', 'abstract');
    % 12 13
    p = schema.prop(c, 'MatchExactly', 'passstop');
    set(p, 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.Copy', 'Off', 'AccessFlags.Serialize', 'Off', 'SetFunction', @set_matchexactly, 'GetFunction', @get_matchexactly);
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(c, 'privMatchExactly', 'passstop');
    set(p, 'FactoryValue', 'stopband', 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 26 28
    % 27 28
end % function
