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
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.Label);
    % 23 24
    displayBox.Name = hThis.Label;
    displayBox.Type = 'edit';
    displayBox.Tag = horzcat(hThis.ObjId, '.', hThis.Label, '.Display');
    displayBox.HideName = false;
    displayBox.RowSpan = [1.0 1.0];
    displayBox.ColSpan = [1.0 1.0];
    displayBox.Value = hThis.Value;
    displayBox.Enabled = false;
    displayBox.ToolTip = hThis.Label;
    displayBox.HideName = true;
    % 34 35
    switch hThis.LabelAttrb
    case 1.0
        nRows = 1.0;
        nCols = 3.0;
        displayBox.ColSpan = [2.0 3.0];
        labelTxt.ColSpan = [1.0 1.0];
        colStretch = [1.0 1.0 1.0];
        items = cellhorzcat(labelTxt, displayBox);
    case 2.0
        nRows = 1.0;
        nCols = 1.0;
        colStretch = 1.0;
        items = cellhorzcat(labelTxt);
    otherwise
        nRows = 1.0;
        nCols = 1.0;
        colStretch = 1.0;
        labelTxt.Alignment = 4.0;
        items = cellhorzcat(displayBox);
    end % switch
    % 55 56
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    if exist('colStretch', 'var') && not(isempty(colStretch))
        basePanel.ColStretch = colStretch;
    end % if
    basePanel.Items = items;
    % 65 66
    schema = basePanel;
end % function
