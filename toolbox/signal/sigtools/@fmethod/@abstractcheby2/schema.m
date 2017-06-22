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
    c = schema.class(pk, 'abstractcheby2', parent);
    set(c, 'Description', 'abstract');
    % 12 13
    set(c, 'Description', 'abstract');
    % 14 15
    p = schema.prop(c, 'MatchExactly', 'passstop');
    set(p, 'AccessFlags.AbortSet', 'Off', 'AccessFlags.Init', 'Off', 'AccessFlags.Copy', 'Off', 'AccessFlags.Serialize', 'Off', 'SetFunction', @set_matchexactly, 'GetFunction', @get_matchexactly);
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(c, 'privMatchExactly', 'passstop');
    set(p, 'FactoryValue', 'stopband', 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
    % 28 30
    % 29 30
end % function
