function [retVal, schema] = Render(hThis, schema)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    retVal = true;
    % 14 15
    labelTxt.Name = hThis.Label;
    labelTxt.Type = 'text';
    labelTxt.RowSpan = [1.0 1.0];
    labelTxt.ColSpan = [1.0 1.0];
    labelTxt.WordWrap = true;
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.ValueBlkParam);
    % 21 23
    % 22 23
    combo.Name = hThis.Label;
    combo.Type = 'combobox';
    combo.Tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Combo');
    combo.HideName = true;
    combo.RowSpan = [1.0 1.0];
    combo.ColSpan = [1.0 1.0];
    % 29 31
    % 30 31
    tmpArray = hThis.Choices;
    if eq(ndims(tmpArray), 2.0) && ne(size(tmpArray, 1.0), 1.0)
        tmpArray = reshape(hThis.Choices, 1.0, size(hThis.Choices, 1.0));
    end % if
    % 35 36
    combo.Entries = tmpArray;
    combo.Value = hThis.Value;
    combo.Enabled = hThis.EnableStatus;
    combo.ToolTip = hThis.Label;
    combo.Source = hThis;
    combo.ObjectProperty = 'Value';
    combo.Mode = true;
    combo.ObjectMethod = 'notifyListeners';
    combo.MethodArgs = {'%dialog','%value','%tag'};
    combo.ArgDataTypes = {'handle','mxArray','string'};
    % 46 47
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 1.0;
        labelTxt.Alignment = 4.0;
        items = cellhorzcat(combo);
        colStretchData = 1.0;
    case 1.0
        nRows = 1.0;
        nCols = 3.0;
        combo.ColSpan = [2.0 3.0];
        items = cellhorzcat(labelTxt, combo);
        colStretchData = [1.0 1.0 1.0];
    case 2.0
        nRows = 2.0;
        nCols = 1.0;
        combo.RowSpan = [2.0 2.0];
        items = cellhorzcat(labelTxt, combo);
        colStretchData = 1.0;
    otherwise
        nRows = 1.0;
        nCols = 1.0;
        colStretchData = 1.0;
        items = cellhorzcat(combo);
    end % switch
    % 72 73
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = items;
    basePanel.ColStretch = colStretchData;
    basePanel.RowStretch = zeros(1.0, nRows);
    % 81 82
    schema = basePanel;
end % function
