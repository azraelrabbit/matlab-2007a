function errMsg = lasterr(errMsgOrig)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    if lt(nargin, 1.0)
        errMsgOrig = lasterr;
    end % if
    % 15 18
    % 16 18
    % 17 18
    errMsg = errMsgOrig;
    idx = strfind(errMsg, 'Error');
    if not(isempty(idx))
        % 21 22
        errMsg = errMsg(plus(idx(end), 1.0):end);
        % 23 27
        % 24 27
        % 25 27
        % 26 27
        idx = find(eq(errMsg, sprintf('\n')));
        if isempty(idx)
            % 29 31
            % 30 31
            errMsg = errMsgOrig;
        else
            errMsg = errMsg(plus(idx, 1.0):end);
        end % if
    end % if
end % function
