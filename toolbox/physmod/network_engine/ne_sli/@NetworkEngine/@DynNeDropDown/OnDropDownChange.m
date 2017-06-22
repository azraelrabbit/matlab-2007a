function OnDropDownChange(hThis, hSource, hDlg, widgetVal, tagVal)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    hThis.Value = hThis.Choices{plus(widgetVal, 1.0), 1.0};
    hThis.hStateMgr.CurrentState = plus(widgetVal, 1.0);
    hThis.hStateMgr.hDialog = hDlg;
    hThis.hStateMgr.SetStateOnDDGDialog();
    % 19 22
    % 20 22
    % 21 22
    hDlg.resetSize(true);
    hDlg.resetSize(true);
end % function
