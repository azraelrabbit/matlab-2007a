function retVal = ert_multi_instance_error_code(modelName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    retVal = LocalGetRTWOption(modelName, 'MultiInstanceErrorCode');
end % function
function value = LocalGetRTWOption(modelName, tlcVar)
    defVal = 'Warning';
    % 11 13
    rtwoptions = get_param(modelName, 'rtwoptions');
    % 13 15
    str = horzcat('-a', tlcVar, '=');
    idx = findstr(rtwoptions, str);
    % 16 18
    if isempty(idx)
        % 18 20
        value = defVal;
    else
        % 21 24
        % 22 24
        strLen = length(str);
        startIdx = plus(idx, strLen);
        nextChar = rtwoptions(startIdx);
        % 26 28
        if ne(nextChar, '"')
            value = str2num(nextChar);
        else
            if eq(nextChar, '"')
                startIdx = plus(startIdx, 1.0);
                endIdx = findstr(rtwoptions(startIdx:end), '"');
                value = rtwoptions(startIdx:minus(plus(startIdx, endIdx), 2.0));
            else
                value = defVal;
            end % if
        end % if
    end % if
end % function
