function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('fdfmethod');
    % 9 10
    parent = findclass(pk, 'abstractnstages');
    c = schema.class(pk, 'multistagenyq', parent);
    % 12 13
    p = schema.prop(c, 'HalfbandDesignMethod', 'HalfbandFilterDesignMethods');
end % function
