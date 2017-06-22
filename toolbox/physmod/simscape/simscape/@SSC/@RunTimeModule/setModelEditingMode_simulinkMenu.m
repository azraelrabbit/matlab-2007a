function success = setModelEditingMode_simulinkMenu(this, hModel, requestedMode)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    try
        success = this.setModelEditingMode(hModel, requestedMode);
    catch
        showErrorDlg;
        success = false;
    end % try
end % function
