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
    unitLabelStr = 'Unit';
    % 15 16
    labelTxt.Name = horzcat(unitLabelStr, ':   ');
    labelTxt.Type = 'text';
    labelTxt.RowSpan = [1.0 1.0];
    labelTxt.ColSpan = [1.0 1.0];
    % 20 21
    editBox.Name = unitLabelStr;
    editBox.Type = 'edit';
    editBox.Tag = hThis.ObjId;
    editBox.HideName = false;
    editBox.RowSpan = [1.0 1.0];
    editBox.ColSpan = [2.0 2.0];
    editBox.Value = hThis.Value;
    editBox.Enabled = hThis.EnableStatus;
    editBox.ToolTip = unitLabelStr;
    editBox.Source = hThis;
    editBox.ObjectProperty = 'Value';
    editBox.Mode = true;
    editBox.HideName = true;
    % 34 35
    items = cellhorzcat(labelTxt, editBox);
    % 36 37
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = [1.0 2.0];
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    % 42 43
    basePanel.Items = items;
    % 44 45
    schema = basePanel;
end % function
