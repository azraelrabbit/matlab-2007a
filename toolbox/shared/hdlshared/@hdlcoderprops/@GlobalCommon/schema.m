function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    mlock;
    % 9 11
    pk = findpackage('hdlcoderprops');
    c = schema.class(pk, 'GlobalCommon', pk.findclass('AbstractProp'));
    % 12 14
    schema.prop(c, 'async_reset', 'bool');
    schema.prop(c, 'bit_true_to_filter', 'bool');
    schema.prop(c, 'cast_before_sum', 'bool');
    schema.prop(c, 'checkhdl', 'bool');
    schema.prop(c, 'enableprefix', 'string');
    schema.prop(c, 'clockenablename', 'string');
    schema.prop(c, 'clockname', 'string');
    schema.prop(c, 'clockenableoutputname', 'string');
    % 21 23
    p = schema.prop(c, 'clockinputs', 'int32');
    set(p, 'SetFunction', @set_positive);
    % 24 26
    schema.prop(c, 'codegendir', 'string');
    % 26 28
    p = schema.prop(c, 'blockcount', 'int32');
    set(p, 'SetFunction', @set_positive);
    % 29 31
    schema.prop(c, 'codegensuccessful', 'bool');
    schema.prop(c, 'code_gen_method', 'string');
    schema.prop(c, 'debug', 'bool');
    schema.prop(c, 'rcs_cvs_tag', 'string');
    schema.prop(c, 'resetname', 'string');
    schema.prop(c, 'reset_asserted_level', 'bool');
    schema.prop(c, 'simulator_flags', 'string');
    % 37 39
    p = schema.prop(c, 'target_language', 'HDLTargetLanguageType');
    set(p, 'SetFunction', @set_target_language);
    % 40 42
    schema.prop(c, 'block_generate_label', 'string');
    schema.prop(c, 'clock_process_label', 'string');
    schema.prop(c, 'complex_imag_postfix', 'string');
    schema.prop(c, 'complex_real_postfix', 'string');
    schema.prop(c, 'entity_conflict_postfix', 'string');
    schema.prop(c, 'instance_generate_label', 'string');
    schema.prop(c, 'instance_prefix', 'string');
    schema.prop(c, 'output_generate_label', 'string');
    schema.prop(c, 'vector_prefix', 'string');
    % 50 53
    % 51 53
    p = schema.prop(c, 'gen_eda_scripts', 'bool');
    set(p, 'FactoryValue', true);
    % 54 57
    % 55 57
    p = schema.prop(c, 'hdlconfigfiles', 'mxArray');
    set(p, 'FactoryValue', {});
    % 58 61
    % 59 61
    schema.prop(c, 'codegenerationoutput', 'CodeGenerationOutputType');
    schema.prop(c, 'generatedmodelname', 'string');
    schema.prop(c, 'generatedmodelnameprefix', 'string');
    schema.prop(c, 'usedotlayout', 'bool');
    schema.prop(c, 'useslautoroute', 'bool');
    schema.prop(c, 'hiliteancestors', 'bool');
    schema.prop(c, 'hilitecolor', 'string');
    % 67 70
    % 68 70
    schema.prop(c, 'multiratebetafeature', 'bool');
    % 70 72
    p = schema.prop(c, 'verbose', 'int32');
    set(p, 'SetFunction', @set_verbose, 'FactoryValue', int32(1.0));
    % 73 75
    p = schema.prop(c, 'reserved_word_postfix', 'string');
    set(p, 'FactoryValue', '_rsvd');
    % 76 80
    % 77 80
    % 78 80
    schema.prop(c, 'gain_multipliers', 'HDLMultipliersType');
    schema.prop(c, 'product_of_elements_style', 'HDLFinalAddersType');
    schema.prop(c, 'sum_of_elements_style', 'HDLFinalAddersType');
    % 82 85
    % 83 85
    schema.prop(c, 'filter_target_language', 'HDLTargetLanguageType');
    schema.prop(c, 'tb_target_language', 'HDLTargetLanguageType');
    % 86 88
    p = schema.prop(c, 'vhdl_package_required', 'bool');
    set(p, 'FactoryValue', false);
    % 89 93
    % 90 93
    % 91 93
    p = schema.prop(c, 'initialize_real_signals', 'bool');
    set(p, 'FactoryValue', true);
    % 94 97
    % 95 97
    p = schema.prop(c, 'referencedmodels', 'mxArray');
    set(p, 'FactoryValue', {});
    % 98 100
    p = schema.prop(c, 'modelrates', 'mxArray');
    set(p, 'FactoryValue', [10.0 ;  20.0], 'SetFunction', @set_modelrates);
    % 101 103
    schema.prop(c, 'top_nodename', 'string');
    % 103 105
    p = schema.prop(c, 'isvhdl', 'bool');
    set(p, 'FactoryValue', true, 'AccessFlags.PublicSet', 'Off');
    % 106 108
    p = schema.prop(c, 'isverilog', 'bool');
    set(p, 'AccessFlags.PublicSet', 'Off');
    % 109 111
    p = schema.prop(c, 'vhdl_package_name', 'string');
    set(p, 'FactoryValue', 'package');
    % 112 114
    schema.prop(c, 'clock_rising_edge', 'bool');
    % 114 119
    % 115 119
    % 116 119
    % 117 119
    schema.prop(c, 'vhdl_file_ext', 'string');
    schema.prop(c, 'verilog_file_ext', 'string');
    % 120 124
    % 121 124
    % 122 124
    p = schema.prop(c, 'filename_suffix', 'string');
    set(p, 'SetFunction', @set_filename_suffix, 'GetFunction', @get_filename_suffix);
end % function
function fns = set_filename_suffix(this, fns)
    % 127 130
    % 128 130
    set(this, horzcat(this.target_language, '_file_ext'), fns);
end % function
function fns = get_filename_suffix(this, fns)
    % 132 135
    % 133 135
    fns = get(this, horzcat(this.target_language, '_file_ext'));
end % function
function value = set_positive(this, value)
    % 137 141
    % 138 141
    % 139 141
    if lt(value, 0.0)
        error('Value must be positive.');
    end % if
end % function
function mrates = set_modelrates(this, mrates)
    % 145 148
    % 146 148
    if not(isnumeric(mrates)) || all(gt(size(mrates), 1.0))
        error('''model_rates'' must be a numeric vector.')
    end % if
end % function
function verb = set_verbose(this, verb)
    % 152 155
    % 153 155
    if lt(verb, 0.0)
        error('''verbose'' cannot be negative.');
    end % if
    % 157 159
    verb = int32(verb);
end % function
