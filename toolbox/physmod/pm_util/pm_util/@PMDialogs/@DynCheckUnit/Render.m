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
    labelTxt.Tag = sprintf('%s.%s_label.Text', hThis.ObjId, hThis.Items(1.0, 1.0).ValueBlkParam);
    % 21 24
    % 22 24
    % 23 24
    hThis.Items(1.0, 1.0).BuddyItems = hThis.Items(2.0, 1.0);
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    chkElem = [];
    [retVal, chkElem] = hThis.Items(1.0, 1.0).Render(chkElem);
    % 31 32
    unitElem = [];
    [retVal, unitElem] = Render(hThis.Items(2.0, 1.0), unitElem);
    if eq(hThis.Items(1.0, 1.0).Value, false)
        unitElem.Items{1.0, 1.0}.Enabled = false;
    end % if
    % 37 38
    chkElem.RowSpan = [1.0 1.0];
    chkElem.ColSpan = [1.0 1.0];
    unitElem.RowSpan = [1.0 1.0];
    unitElem.ColSpan = [2.0 2.0];
    % 42 43
    switch hThis.LabelAttrb
    case 0.0
        nRows = 1.0;
        nCols = 2.0;
        chkElem.RowSpan = [1.0 1.0];
        chkElem.ColSpan = [1.0 1.0];
        unitElem.RowSpan = [1.0 1.0];
        unitElem.ColSpan = [2.0 2.0];
        items = cellhorzcat(chkElem, unitElem);
        colStretch = [1.0 1.0];
    case 1.0
        nRows = 1.0;
        nCols = 6.0;
        chkElem.RowSpan = [1.0 1.0];
        chkElem.ColSpan = [2.0 4.0];
        unitElem.RowSpan = [1.0 1.0];
        unitElem.ColSpan = [5.0 6.0];
        labelTxt.ColSpan = [1.0 1.0];
        items = cellhorzcat(chkElem, unitElem, labelTxt);
        colStretch = [0.0 1.0 1.0 1.0 0.0 0.0];
    case 2.0
        nRows = 2.0;
        nCols = 5.0;
        labelTxt.ColSpan = [1.0 5.0];
        chkElem.RowSpan = [2.0 2.0];
        chkElem.ColSpan = [1.0 3.0];
        unitElem.RowSpan = [2.0 2.0];
        unitElem.ColSpan = [4.0 5.0];
        items = cellhorzcat(labelTxt, chkElem, unitElem);
        colStretch = [1.0 1.0 1.0 1.0 0.0];
    otherwise
        nRows = 1.0;
        nCols = 3.0;
        chkElem.RowSpan = [1.0 1.0];
        unitElem.RowSpan = [1.0 1.0];
        chkElem.ColSpan = [1.0 1.0];
        unitElem.ColSpan = [3.0 3.0];
        items = cellhorzcat(chkElem, unitElem);
        colStretch = [1.0 1.0 0.0];
    end % switch
    % 83 84
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.Tag = hThis.ObjId;
    basePanel.LayoutGrid = horzcat(nRows, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = items;
    basePanel.ColStretch = colStretch;
    basePanel.RowStretch = zeros(1.0, nRows);
    % 93 95
    % 94 95
    schema = basePanel;
end % function
