function OnActStyleSelectChange(hThis, hSource, hDlg, widgetVal)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hThis.SelActStyle = hSource.Choices{plus(widgetVal(1.0), 1.0), 1.0};
    % 7 8
    panelVisArray = zeros(1.0, 7.0);
    panelVisArray = hThis.ComputePanelVis(hThis.SelPrim, hThis.SelActStyle, true);
    % 10 11
    hKidLst = hThis.Items(1.0, 1.0);
    for idx=1.0:7.0
        hDlg.setVisible(hKidLst.Items(idx, 1.0).ObjId, panelVisArray(idx))
    end % for
end % function
