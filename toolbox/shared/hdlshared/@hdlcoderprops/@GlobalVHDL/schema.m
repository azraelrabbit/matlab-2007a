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
    c = schema.class(pk, 'GlobalVHDL', pk.findclass('AbstractGlobalLanguage'));
    % 13 15
    % 14 15
    schema.prop(c, 'inline_configurations', 'bool');
    schema.prop(c, 'package_suffix', 'string');
    schema.prop(c, 'use_aggregates_for_const', 'bool');
    schema.prop(c, 'safe_zero_concat', 'bool');
    % 19 20
    schema.prop(c, 'split_arch_file_postfix', 'string');
    schema.prop(c, 'split_entity_file_postfix', 'string');
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    schema.prop(c, 'vhdl_package_body_decl', 'string');
    schema.prop(c, 'vhdl_package_body_end', 'string');
    schema.prop(c, 'vhdl_package_comment', 'string');
    schema.prop(c, 'vhdl_package_constants', 'string');
    schema.prop(c, 'vhdl_package_decl', 'string');
    schema.prop(c, 'vhdl_package_decl_end', 'string');
    schema.prop(c, 'vhdl_package_function_headers', 'string');
    schema.prop(c, 'vhdl_package_functions', 'string');
    schema.prop(c, 'vhdl_package_library', 'string');
    schema.prop(c, 'vhdl_package_type_defs', 'string');
end % function
