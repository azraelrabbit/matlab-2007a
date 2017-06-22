function schema
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pk = findpackage('sigutils');
    % 11 12
    c = schema.class(pk, 'overflowstack', pk.findclass('stack'));
    % 13 14
    e = schema.event(c, 'OverflowOccurred');
end % function
