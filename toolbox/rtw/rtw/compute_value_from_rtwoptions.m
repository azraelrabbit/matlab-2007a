function out = compute_value_from_rtwoptions(hModel)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    rtwoptions = get_param(hModel, 'RTWOptions');
    tmp = findstr(rtwoptions, 'FileSizeThreshold');
    if isempty(tmp)
        tmp = findstr(rtwoptions, 'FunctionSizeThreshold');
        if isempty(tmp)
            % 12 14
            % 13 14
            out = 1.0;
        else
            % 16 17
            out = 2.0;
        end % if
    else
        tmp = findstr(rtwoptions, 'FunctionSizeThreshold');
        if isempty(tmp)
            % 22 23
            out = 3.0;
        else
            % 25 27
            % 26 27
            out = 4.0;
        end % if
    end % if
end % function
