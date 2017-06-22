function filename = hdlentitytopfilename
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    topname = hdlentitytop;
    % 17 19
    if isempty(topname)
        filename = '';
    else
        % 21 23
        tlang = hdlgetparameter('target_language');
        % 23 25
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
            filename = cellhorzcat(horzcat(topname, hdlgetparameter('split_entity_file_postfix'), suffix), horzcat(topname, hdlgetparameter('split_arch_file_postfix'), suffix));
        else
            % 36 40
            % 37 40
            % 38 40
            % 39 41
            filename = horzcat(topname, suffix);
        end % if
    end % if
end % function
