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
    chkBox.Name = hThis.Label;
    chkBox.Type = 'checkbox';
    chkBox.Tag = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam, '.Check');
    chkBox.HideName = false;
    chkBox.RowSpan = [1.0 1.0];
    chkBox.ColSpan = [1.0 1.0];
    chkBox.Value = hThis.Value;
    chkBox.Enabled = hThis.EnableStatus;
    chkBox.ToolTip = hThis.Label;
    chkBox.Source = hThis;
    chkBox.ObjectProperty = 'Value';
    chkBox.Mode = true;
    chkBox.ObjectMethod = 'OnChkBoxChange';
    chkBox.MethodArgs = {'%dialog','%value','%tag'};
    chkBox.ArgDataTypes = {'handle','mxArray','string'};
    % 32 33
    if ne(hThis.LabelAttrb, 0.0)
        chkBox.HideName = true;
    end % if
    % 36 37
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = [1.0 1.0];
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.RowStretch = 0.0;
    basePanel.Items = cellhorzcat(chkBox);
    % 44 45
    schema = basePanel;
end % function
