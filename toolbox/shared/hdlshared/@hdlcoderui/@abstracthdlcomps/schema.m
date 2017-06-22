function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    mlock;
    % 10 11
    pk = findpackage('hdlcoderui');
    c = schema.class(pk, 'abstracthdlcomps');
    set(c, 'Description', 'abstract');
    % 14 16
    % 15 16
    p = schema.prop(c, 'SubComponentName', 'string');
end % function
