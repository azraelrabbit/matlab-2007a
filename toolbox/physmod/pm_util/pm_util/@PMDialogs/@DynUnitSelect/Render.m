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
    % 13 14
    retVal = true;
    % 15 16
    labelTxt.Name = hThis.Label;
    labelTxt.Type = 'text';
    labelTxt.RowSpan = [1.0 1.0];
    labelTxt.ColSpan = [1.0 1.0];
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.ValueBlkParam);
    % 21 23
    % 22 23
    if eq(numel(hThis.Choices), 1.0)
        % 24 27
        % 25 27
        % 26 27
        combo.Name = hThis.Choices{1.0};
        combo.Type = 'text';
        combo.Tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Text');
        combo.RowSpan = [1.0 1.0];
        combo.ColSpan = [1.0 1.0];
    else
        combo.Name = hThis.Label;
        combo.Type = 'combobox';
        combo.Tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Combo');
        combo.HideName = hThis.HideName;
        combo.RowSpan = [1.0 1.0];
        combo.ColSpan = [1.0 1.0];
        combo.Entries = hThis.Choices;
        combo.ToolTip = hThis.Label;
        combo.Source = hThis;
        combo.ObjectProperty = 'Value';
        combo.Enabled = hThis.EnableStatus;
        combo.Mode = true;
        combo.ObjectMethod = 'notifyListeners';
        combo.MethodArgs = {'%dialog','%value','%tag'};
        combo.ArgDataTypes = {'handle','mxArray','string'};
    end % if
    % 49 50
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 1.0;
        labelTxt.Alignment = 4.0;
        items = cellhorzcat(combo);
    case 1.0
        nRows = 1.0;
        nCols = 3.0;
        combo.ColSpan = [2.0 3.0];
        items = cellhorzcat(labelTxt, combo);
    case 2.0
        nRows = 2.0;
        nCols = 1.0;
        combo.RowSpan = [2.0 2.0];
        items = cellhorzcat(labelTxt, combo);
    otherwise
        nRows = 1.0;
        nCols = 1.0;
        items = cellhorzcat(combo);
    end % switch
    % 71 72
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.RowStretch = zeros(1.0, nRows);
    basePanel.Items = items;
    % 79 80
    schema = basePanel;
end % function
