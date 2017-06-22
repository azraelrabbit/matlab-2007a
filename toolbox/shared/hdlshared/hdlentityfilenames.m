function filenames = hdlentityfilenames
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    names = hdlentitynames;
    % 20 22
    if isempty(names)
        filenames = {};
    else
        % 24 26
        if hdlisfiltercoder
            tlang = hdlgetparameter('lasttopleveltargetlang');
        else
            % 28 31
            % 29 31
            tlang = hdlgetparameter('target_language');
        end % if
        % 32 34
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
            % 48 51
            % 49 51
            arch_names = strcat(names, hdlgetparameter('split_arch_file_postfix'), suffix);
            % 51 54
            % 52 54
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
