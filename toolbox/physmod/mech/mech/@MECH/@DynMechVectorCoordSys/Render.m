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
    labelTxt.ColSpan = [1.0 3.0];
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    editElem = [];
    [retVal, editElem] = hThis.Items(1.0, 1.0).Render(editElem);
    coordSysElem = [];
    [retVal, coordSysElem] = Render(hThis.Items(2.0, 1.0), coordSysElem);
    % 27 28
    editElem.RowSpan = [1.0 1.0];
    editElem.ColSpan = [1.0 1.0];
    coordSysElem.RowSpan = [1.0 1.0];
    coordSysElem.ColSpan = [2.0 2.0];
    % 32 33
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 3.0;
        editElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [1.0 2.0];
        coordSysElem.RowSpan = [1.0 1.0];
        coordSysElem.ColSpan = [3.0 3.0];
        items = cellhorzcat(editElem, coordSysElem, labelTxt);
        colStretch = [0.0 0.0 0.0];
    case 1.0
        nRows = 1.0;
        nCols = 6.0;
        editElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [2.0 4.0];
        coordSysElem.RowSpan = [1.0 1.0];
        coordSysElem.ColSpan = [5.0 6.0];
        labelTxt.ColSpan = [1.0 1.0];
        items = cellhorzcat(editElem, coordSysElem, labelTxt);
        colStretch = [0.0 0.0 0.0 0.0 0.0 0.0];
    case 2.0
        nRows = 2.0;
        nCols = 5.0;
        labelTxt.ColSpan = [1.0 5.0];
        editElem.RowSpan = [2.0 2.0];
        editElem.ColSpan = [1.0 3.0];
        coordSysElem.RowSpan = [2.0 2.0];
        coordSysElem.ColSpan = [4.0 5.0];
        items = cellhorzcat(labelTxt, editElem, coordSysElem);
        colStretch = [0.0 0.0 0.0 0.0 0.0];
    case 3.0
        nRows = 2.0;
        nCols = 6.0;
        editElem.RowSpan = [1.0 2.0];
        editElem.ColSpan = [2.0 4.0];
        coordSysElem.RowSpan = [1.0 2.0];
        coordSysElem.ColSpan = [5.0 6.0];
        labelTxt.ColSpan = [1.0 1.0];
        labelTxt.RowSpan = [2.0 2.0];
        items = cellhorzcat(editElem, coordSysElem, labelTxt);
        colStretch = [0.0 0.0 0.0 0.0 0.0 0.0];
    case 4.0
        nRows = 2.0;
        nCols = 4.0;
        editElem.RowSpan = [1.0 2.0];
        editElem.ColSpan = [1.0 2.0];
        coordSysElem.RowSpan = [1.0 2.0];
        coordSysElem.ColSpan = [3.0 4.0];
        items = cellhorzcat(editElem, coordSysElem);
        colStretch = [0.0 0.0 0.0 0.0];
    otherwise
        nRows = 1.0;
        nCols = 3.0;
        editElem.RowSpan = [1.0 1.0];
        coordSysElem.RowSpan = [1.0 1.0];
        editElem.ColSpan = [1.0 1.0];
        coordSysElem.ColSpan = [3.0 3.0];
        items = cellhorzcat(editElem, coordSysElem);
        colStretch = [0.0 0.0 0.0];
    end % switch
    % 93 94
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.Tag = hThis.ObjId;
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = items;
    basePanel.ColStretch = colStretch;
    % 102 104
    % 103 104
    schema = basePanel;
end % function
