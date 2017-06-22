function [retVal, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    retVal = true;
    % 14 16
    tableInfo.Name = '';
    tableInfo.Type = 'table';
    tableInfo.Tag = hThis.ObjId;
    tableInfo.RowSpan = [1.0 1.0];
    tableInfo.ColSpan = [1.0 1.0];
    tableInfo.Mode = true;
    tableInfo.Source = hThis;
    tableInfo.ValueChangedCallback = @l_OnValueChangedCB;
    % 23 25
    tableInfo.Grid = true;
    tableInfo.HeaderVisibility = [0.0 1.0];
    tableInfo.ColHeader = cellhorzcat(xlate('Enable'), xlate('Variable Name'), xlate('Description'));
    % 27 33
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    tableInfo.ReadOnlyColumns = [1.0 2.0];
    tableInfo.ColumnCharacterWidth = [5.0 12.0 30.0];
    tableInfo.Editable = true;
    % 35 37
    nVars = numel(hThis.VarNames);
    tableInfo.Size = horzcat(nVars, 3.0);
    % 38 40
    tableData = {};
    for idx=1.0:nVars
        enableVal.Type = 'checkbox';
        % 42 45
        % 43 45
        enableVal.Value = hThis.StateList(idx);
        enableVal.Mode = true;
        tableData{idx, 1.0} = enableVal;
        % 47 49
        tableData{idx, 2.0} = hThis.VarNames{idx};
        % 49 51
        tableData{idx, 3.0} = hThis.VarDescriptions{idx};
    end % for
    % 52 54
    tableInfo.Data = tableData;
    % 54 56
    tablePanel.Source = hThis;
    tablePanel.Name = '';
    tablePanel.Type = 'panel';
    tablePanel.LayoutGrid = [1.0 1.0];
    tablePanel.ColSpan = [1.0 1.0];
    tablePanel.RowSpan = [1.0 1.0];
    tablePanel.Items = cellhorzcat(tableInfo);
    % 62 64
    schema = tablePanel;
end % function
function l_OnValueChangedCB(dlg, row, col, value)
    % 66 76
    % 67 76
    % 68 76
    % 69 76
    % 70 76
    % 71 76
    % 72 76
    % 73 76
    % 74 76
    hMyDlgSrc = dlg.getDialogSource();
    hBldrObj = hMyDlgSrc.BuilderObj();
    matchList = hBldrObj.TagSearch('DynNeVarLoggingPanel', 'Partial', 'First');
    if isempty(matchList)
        return;
    end % if
    % 81 83
    if eq(col, 0.0)
        matchList(1.0).StateList(plus(row, 1.0)) = value;
    end % if
end % function
