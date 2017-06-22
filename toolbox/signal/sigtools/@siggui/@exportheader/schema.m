function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 10
    c = schema.class(pk, 'exportheader', pk.findclass('actionclosedlg'));
    % 11 13
    % 12 13
    schema.prop(c, 'Filter', 'MATLAB array');
    p = schema.prop(c, 'Filename', 'string');
    % 15 16
    set(p, 'FactoryValue', 'fdacoefs.h');
    % 17 18
    pk.findclass('varsinheader');
    pk.findclass('datatypeselector');
    % 20 22
    % 21 22
    p = schema.prop(c, 'Listeners', 'handle.listener vector');
    % 23 26
    % 24 26
    % 25 26
    set(p, 'AccessFlag.PublicSet', 'Off', 'AccessFlag.PublicGet', 'Off');
end % function
