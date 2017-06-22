function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pk = findpackage('slmgr');
    c = schema.class(pk, 'VideoSignalConstraints', pk.findclass('SignalConstraints'));
end % function
