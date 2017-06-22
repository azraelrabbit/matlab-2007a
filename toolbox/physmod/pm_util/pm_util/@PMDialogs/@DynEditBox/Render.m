function [retVal, schema] = Render(hThis, schema)
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
    retVal = true;
    % 16 17
    labelTxt.Name = hThis.Label;
    labelTxt.Type = 'text';
    labelTxt.RowSpan = [1.0 1.0];
    labelTxt.ColSpan = [1.0 1.0];
    labelTxt.WordWrap = true;
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.ValueBlkParam);
    % 23 25
    % 24 25
    editBox.Name = hThis.Label;
    editBox.Type = 'edit';
    editBox.Tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Edit');
    editBox.HideName = false;
    editBox.RowSpan = [1.0 1.0];
    editBox.ColSpan = [1.0 1.0];
    editBox.Value = hThis.Value;
    editBox.Enabled = hThis.EnableStatus;
    editBox.ToolTip = hThis.Label;
    editBox.Source = hThis;
    editBox.ObjectProperty = 'Value';
    editBox.ObjectMethod = 'notifyListeners';
    editBox.MethodArgs = {'%dialog','%value','%tag'};
    editBox.ArgDataTypes = {'handle','mxArray','string'};
    % 39 40
    editBox.Mode = true;
    editBox.HideName = true;
    % 42 43
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 1.0;
        colStretch = 1.0;
        labelTxt.Alignment = 4.0;
        items = cellhorzcat(editBox);
    case 1.0
        nRows = 1.0;
        nCols = 3.0;
        editBox.ColSpan = [2.0 3.0];
        labelTxt.ColSpan = [1.0 1.0];
        colStretch = [1.0 1.0 1.0];
        items = cellhorzcat(labelTxt, editBox);
    case 2.0
        % 58 59
        nRows = 2.0;
        nCols = 1.0;
        editBox.RowSpan = [2.0 2.0];
        colStretch = 1.0;
        items = cellhorzcat(labelTxt, editBox);
    otherwise
        nRows = 1.0;
        nCols = 1.0;
        colStretch = 1.0;
        items = cellhorzcat(editBox);
    end % switch
    % 70 71
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    if exist('colStretch', 'var') && not(isempty(colStretch))
        basePanel.ColStretch = colStretch;
    end % if
    basePanel.Items = items;
    % 80 81
    schema = basePanel;
end % function
