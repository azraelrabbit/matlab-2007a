function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('siggui');
    % 9 11
    % 10 11
    c = schema.class(pk, 'specsfsspecifier', pk.findclass('fsspecifier'));
    % 12 13
    e = schema.event(c, 'UserModifiedSpecs');
end % function
