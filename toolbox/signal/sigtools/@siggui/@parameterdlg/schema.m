function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    findclass(findpackage('sigdatatypes'), 'parameter');
    % 10 11
    c = schema.class(pk, 'parameterdlg', pk.findclass('helpdialog'));
    % 12 13
    p = vertcat(schema.prop(c, 'Name', 'String'), schema.prop(c, 'Label', 'String'), schema.prop(c, 'Parameters', 'sigdatatypes.parameter vector'), schema.prop(c, 'HelpLocation', 'string vector'), schema.prop(c, 'Tool', 'string'), schema.prop(c, 'StaticParameters', 'string vector'), schema.prop(c, 'DisabledParameters', 'string vector'));
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(c, 'UserModifiedListener', 'handle.listener');
    % 24 26
    % 25 26
    set(p, 'AccessFlags.PublicGet', 'off', 'AccessFlags.PublicSet', 'off');
end % function
