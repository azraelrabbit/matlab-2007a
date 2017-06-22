function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    pk.findclass('fsspecifier');
    pk.findclass('coeffspecifier');
    % 11 13
    % 12 13
    c = schema.class(pk, 'import', pk.findclass('sigcontainer'));
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(c, 'isImported', 'bool');
    p.AccessFlags.PublicSet = 'off';
    p.AccessFlags.PublicGet = 'off';
    % 21 22
    e = schema.event(c, 'FilterGenerated');
end % function
