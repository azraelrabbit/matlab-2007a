function errorHandler(msg, titleStr)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0)
        titleStr = 'MPlay Error';
    end % if
    if iscell(msg)
        % 13 15
        % 14 15
        formattedMsg = msg;
    else
        formattedMsg = sprintf('%s', msg);
    end % if
    errordlg(formattedMsg, titleStr, 'modal');
end % function
