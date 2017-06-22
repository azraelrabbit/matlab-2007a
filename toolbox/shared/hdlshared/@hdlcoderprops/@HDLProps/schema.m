function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    mlock;
    % 12 13
    pkg = findpackage('hdlcoderprops');
    c = schema.class(pkg, 'HDLProps');
    % 15 16
    findclass(findpackage('propset'), 'tree');
    findclass(pkg, 'CLI');
    % 18 20
    % 19 20
    schema.prop(c, 'INI', 'propset.tree');
    % 21 23
    % 22 23
    schema.prop(c, 'CLI', 'hdlcoderprops.CLI');
    % 24 25
    p = schema.prop(c, 'TargetLanguageListener', 'handle.listener');
    set(p, 'AccessFlags.PublicSet', 'Off', 'AccessFlags.PublicGet', 'Off');
end % function
