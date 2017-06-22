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
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'AbstractGlobalLanguage', pk.findclass('AbstractProp'));
    % 13 14
    set(c, 'Description', 'abstract');
    % 15 16
    p = vertcat(schema.prop(c, 'base_data_type', 'string'), schema.prop(c, 'reg_data_type', 'string'), schema.prop(c, 'comment_char', 'string'), schema.prop(c, 'assign_prefix', 'string'), schema.prop(c, 'assign_op', 'string'), schema.prop(c, 'array_deref', 'string'));
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 25 26
    schema.prop(c, 'filename_suffix', 'string');
    % 27 30
    % 28 30
    % 29 30
    p = schema.prop(c, 'loop_unrolling', 'bool');
    set(p, 'SetFunction', @set_loop_unrolling);
    % 32 35
    % 33 35
    % 34 35
    p = schema.prop(c, 'split_entity_arch', 'bool');
    set(p, 'SetFunction', @set_split_entity_arch);
    % 37 40
    % 38 40
    % 39 40
    p = schema.prop(c, 'vhdl_package_required', 'bool');
    set(p, 'FactoryValue', false);
end % function
