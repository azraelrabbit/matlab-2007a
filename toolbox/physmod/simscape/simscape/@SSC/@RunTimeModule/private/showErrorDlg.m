function showErrorDlg(message)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 1.0)
        errorMsg = lasterror;
        message = errorMsg.message;
    end % if
    % 13 15
    % 14 15
    configData = RunTimeModule_config;
    % 16 17
    errordlg(message, pm_message(configData.Label.ErrorDlgTitle_msgid), 'modal');
    beep;
end % function
