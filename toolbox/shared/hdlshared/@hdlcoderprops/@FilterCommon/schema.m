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
    c = schema.class(pk, 'FilterCommon', pk.findclass('AbstractProp'));
    % 13 14
    p = schema.prop(c, 'filter_fir_final_adder', 'HDLFinalAddersType');
    set(p, 'SetFunction', @set_filter_fir_final_adder);
    % 16 17
    schema.prop(c, 'filter_input_type_std_logic', 'bool');
    schema.prop(c, 'filter_output_type_std_logic', 'bool');
    schema.prop(c, 'filter_multipliers', 'HDLMultipliersType');
    schema.prop(c, 'filter_coeff_name', 'string');
    schema.prop(c, 'filter_pipelined', 'bool');
    % 22 23
    p = vertcat(schema.prop(c, 'filter_registered_input', 'bool'), schema.prop(c, 'filter_registered_output', 'bool'));
    % 24 27
    % 25 27
    % 26 27
    set(p, 'FactoryValue', true);
    % 28 29
    p = schema.prop(c, 'filter_name', 'string');
    set(p, 'FactoryValue', 'filter');
    % 31 32
    p = schema.prop(c, 'filter_input_name', 'string');
    set(p, 'FactoryValue', 'filter_in');
    % 34 35
    p = schema.prop(c, 'filter_output_name', 'string');
    set(p, 'FactoryValue', 'filter_out');
    % 37 38
    p = schema.prop(c, 'filter_fracdelay_name', 'string');
    set(p, 'FactoryValue', 'filter_fd');
    % 40 41
    p = schema.prop(c, 'filter_scalewarnbits', 'int32');
    set(p, 'FactoryValue', 3.0);
    % 43 44
    p = schema.prop(c, 'filter_excess_latency', 'int32');
    set(p, 'FactoryValue', 0.0);
    % 46 47
    schema.prop(c, 'filter_reuseaccum', 'bool');
    schema.prop(c, 'filter_serialsegment_inputs', 'mxArray');
    schema.prop(c, 'filter_dalutpartition', 'mxArray');
    p = schema.prop(c, 'filter_daradix', 'power2_scalar');
    set(p, 'FactoryValue', 2.0);
    % 52 53
    p = schema.prop(c, 'foldingfactor', 'mxArray');
    set(p, 'FactoryValue', 1.0);
    % 55 56
    schema.prop(c, 'entitynamelist', 'mxArray');
    schema.prop(c, 'entitypathlist', 'mxArray');
    schema.prop(c, 'entityportlist', 'mxArray');
    schema.prop(c, 'entityarchlist', 'mxArray');
    % 60 61
    schema.prop(c, 'lasttopleveltargetlang', 'mxArray');
    schema.prop(c, 'lasttoplevelname', 'mxArray');
    schema.prop(c, 'lasttoplevelports', 'mxArray');
    schema.prop(c, 'lasttoplevelportnames', 'mxArray');
    schema.prop(c, 'lasttopleveldecls', 'mxArray');
    schema.prop(c, 'lasttoplevelinstance', 'mxArray');
    schema.prop(c, 'lasttopleveltimestamp', 'mxArray');
end % function
function fffa = set_filter_fir_final_adder(this, fffa)
    % 70 72
    % 71 72
    if strncmpi(fffa, 'pipelined', length(fffa))
        set(this, 'filter_pipelined', true);
    end % if
end % function
