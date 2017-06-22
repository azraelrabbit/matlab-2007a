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
    labelTxt.ColSpan = [1.0 3.0];
    labelTxt.WordWrap = true;
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.Items(1.0, 1.0).ValueBlkParam);
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    editElem = [];
    [retVal, editElem] = hThis.Items(1.0, 1.0).Render(editElem);
    unitElem = [];
    [retVal, unitElem] = Render(hThis.Items(2.0, 1.0), unitElem);
    % 31 32
    editElem.RowSpan = [1.0 1.0];
    editElem.ColSpan = [1.0 1.0];
    unitElem.RowSpan = [1.0 1.0];
    unitElem.ColSpan = [2.0 2.0];
    % 36 37
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 3.0;
        editElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [1.0 2.0];
        unitElem.RowSpan = [1.0 1.0];
        unitElem.ColSpan = [3.0 3.0];
        items = cellhorzcat(editElem, unitElem, labelTxt);
        colStretch = [1.0 1.0 0.0];
    case 1.0
        nRows = 1.0;
        nCols = 6.0;
        editElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [2.0 5.0];
        unitElem.RowSpan = [1.0 1.0];
        unitElem.ColSpan = [6.0 6.0];
        labelTxt.ColSpan = [1.0 1.0];
        items = cellhorzcat(editElem, unitElem, labelTxt);
        colStretch = [0.0 1.0 1.0 1.0 1.0 0.0];
    case 2.0
        nRows = 2.0;
        nCols = 5.0;
        labelTxt.ColSpan = [1.0 5.0];
        editElem.RowSpan = [2.0 2.0];
        editElem.ColSpan = [1.0 3.0];
        unitElem.RowSpan = [2.0 2.0];
        unitElem.ColSpan = [4.0 5.0];
        items = cellhorzcat(labelTxt, editElem, unitElem);
        colStretch = [1.0 0.0 0.0 1.0 0.0];
    otherwise
        nRows = 1.0;
        nCols = 3.0;
        editElem.RowSpan = [1.0 1.0];
        unitElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [1.0 1.0];
        unitElem.ColSpan = [3.0 3.0];
        items = cellhorzcat(editElem, unitElem);
        colStretch = [1.0 1.0 0.0];
    end % switch
    % 77 78
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.Tag = hThis.ObjId;
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = items;
    basePanel.ColStretch = colStretch;
    % 86 88
    % 87 88
    schema = basePanel;
end % function
