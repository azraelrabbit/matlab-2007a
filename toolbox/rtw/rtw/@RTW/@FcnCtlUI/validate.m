function validate(hSrc, hDlg)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [status, msg] = hSrc.fcnclass.validate(hDlg, '', false);
    % 8 9
    if not(strcmp(msg, 'Canceled'))
        hSrc.validationResult = msg;
        hSrc.validationStatus = status;
    end % if
end % function
