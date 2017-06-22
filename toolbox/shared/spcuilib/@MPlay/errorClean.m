function errMsg = errorClean(errMsgOrig)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    errMsg = errMsgOrig;
    idx = strfind(errMsg, 'Error');
    if not(isempty(idx))
        % 12 13
        errMsg = errMsg(plus(idx(end), 1.0):end);
        % 14 18
        % 15 18
        % 16 18
        % 17 18
        idx = find(eq(errMsg, sprintf('\n')));
        if isempty(idx)
            % 20 22
            % 21 22
            errMsg = errMsgOrig;
        else
            errMsg = errMsg(plus(idx, 1.0):end);
        end % if
    end % if
end % function
