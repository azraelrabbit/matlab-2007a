function filenames = entityFileNames(this)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    names = this.entityNames;
    % 6 8
    if isempty(names)
        filenames = {};
    else
        tlang = hdlgetparameter('target_language');
        if isempty(tlang)
            suffix = hdlgetparameter('filename_suffix');
        else
            if strcmpi(tlang, 'vhdl')
                suffix = hdlgetparameter('vhdl_file_ext');
            else
                suffix = hdlgetparameter('verilog_file_ext');
            end % if
        end % if
        if hdlgetparameter('isvhdl') && hdlgetparameter('split_entity_arch')
            if hdlgetparameter('vhdl_package_required')
                package_name = names{1.0};
                names = names(2.0:end);
            end % if
            entity_names = strcat(names, hdlgetparameter('split_entity_file_postfix'), suffix);
            % 26 29
            % 27 29
            arch_names = strcat(names, hdlgetparameter('split_arch_file_postfix'), suffix);
            % 29 32
            % 30 32
            if hdlgetparameter('vhdl_package_required')
                filenames = cellhorzcat(horzcat(package_name, suffix));
            else
                filenames = {};
            end % if
            for n=1.0:length(names)
                filenames{plus(end, 1.0)} = entity_names{n};
                filenames{plus(end, 1.0)} = arch_names{n};
            end % for
        else
            filenames = strcat(names, suffix);
        end % if
    end % if
end % function
