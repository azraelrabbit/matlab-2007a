function OnSelectChange(hThis, hSource, hDlg, widgetVal, tagVal)
    % 1 31
    % 2 31
    % 3 31
    % 4 31
    % 5 31
    % 6 31
    % 7 31
    % 8 31
    % 9 31
    % 10 31
    % 11 31
    % 12 31
    % 13 31
    % 14 31
    % 15 31
    % 16 31
    % 17 31
    % 18 31
    % 19 31
    % 20 31
    % 21 31
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    panelVisArray = hThis.ComputePanelVis(widgetVal(1.0), true);
    % 32 33
    hKidLst = hThis.Items(1.0, 1.0);
    for idx=1.0:6.0
        hDlg.setVisible(hKidLst.Items(idx, 1.0).ObjId, panelVisArray(idx))
    end % for
end % function