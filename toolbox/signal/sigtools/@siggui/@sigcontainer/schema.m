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
    c = schema.class(pk, 'sigcontainer', pk.findclass('siggui'));
    c.Description = 'abstract';
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(c, 'NotificationListener', 'handle.listener vector');
    % 16 19
    % 17 19
    % 18 19
    set(p, 'AccessFlags.PublicGet', 'Off', 'AccessFlags.PublicSet', 'Off');
end % function
