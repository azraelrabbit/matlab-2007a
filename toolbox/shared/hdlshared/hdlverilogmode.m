function hdlverilogmode
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if hdlisfiltercoder
        hprop = PersistentHDLPropSet;
        set(hprop.CLI, 'TargetLanguage', 'verilog', 'LoopUnrolling', 'on', 'SplitEntityArch', 'off');
    end % if
    % 11 12
    hdlsetparameter('target_language', 'verilog');
    hdlsetparameter('isvhdl', 0.0);
    hdlsetparameter('isverilog', 1.0);
    hdlsetparameter('base_data_type', 'wire');
    hdlsetparameter('reg_data_type', 'reg ');
    hdlsetparameter('comment_char', '//');
    hdlsetparameter('assign_prefix', 'assign ');
    hdlsetparameter('assign_op', '=');
    hdlsetparameter('array_deref', '[]');
    hdlsetparameter('filename_suffix', hdlgetparameter('verilog_file_ext'));
    hdlsetparameter('loop_unrolling', 1.0);
    hdlsetparameter('split_entity_arch', 0.0);
end % function
