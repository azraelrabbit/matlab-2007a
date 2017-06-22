function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'AbstractEDAScript', pk.findclass('AbstractProp'));
    set(c, 'Description', 'abstract');
    % 11 12
    schema.prop(c, 'compile_cmd', 'string');
end % function
