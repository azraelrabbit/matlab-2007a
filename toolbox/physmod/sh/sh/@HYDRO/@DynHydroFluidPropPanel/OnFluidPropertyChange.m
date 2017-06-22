function OnFluidPropertyChange(hThis, hDlg)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [viscValStr, densValStr, bulkValStr, errStr, propPanelVis] = ComputePropsAsStrings(hThis);
    tags = hThis.ChildTags;
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    hDlg.setWidgetValue(tags.error, errStr);
    hDlg.setWidgetValue(tags.density, densValStr);
    hDlg.setWidgetValue(tags.viscosity, viscValStr);
    hDlg.setWidgetValue(tags.modulus, bulkValStr);
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    hDlg.setVisible(tags.props, propPanelVis(1.0));
    hDlg.setVisible(tags.error, propPanelVis(2.0));
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    hDlg.resetSize(false);
    % 29 30
end % function
