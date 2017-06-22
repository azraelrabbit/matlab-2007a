function dlgApplyPresetTable(pt, dlgH)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    tableIdx = dlgH.getWidgetValue('PresetTableList');
    % 8 9
    if gt(tableIdx, 0.0)
        tableList = dlgH.getUserData('PresetTableList');
        currTable = tableList{plus(tableIdx, 1.0)};
        pt.applyPresetTable(currTable);
        dlgH.setWidgetValue('PresetTableList', 0.0);
    end % if
end % function
