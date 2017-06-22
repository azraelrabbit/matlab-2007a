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
    c = schema.class(pk, 'undomanager', pk.findclass('siggui'));
    % 11 12
    p = vertcat(schema.prop(c, 'Limit', 'double'), schema.prop(c, 'UndoStack', 'handle'), schema.prop(c, 'RedoStack', 'handle'));
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    set(p, 'AccessFlags.PublicSet', 'off', 'AccessFlags.PublicGet', 'off');
    % 18 19
    schema.event(c, 'UndoPerformed');
    schema.event(c, 'RedoPerformed');
end % function
