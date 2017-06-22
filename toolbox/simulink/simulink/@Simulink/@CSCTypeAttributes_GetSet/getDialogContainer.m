function panel = getDialogContainer(hObj, dlgName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    panel = [];
    panel.Type = 'panel';
    panel.Items = {};
    % 9 11
    % 10 11
    tmpItem = [];
    tmpItem.Name = 'GetFunction:';
    tmpItem.Type = 'combobox';
    tmpItem.Entries = {'Instance specific'};
    tmpItem.Value = 'Instance specific';
    tmpItem.Enabled = false;
    tmpItem.RowSpan = [1.0 1.0];
    tmpItem.ColSpan = [1.0 1.0];
    panel.Items = horzcat(panel.Items, cellhorzcat(tmpItem));
    % 20 21
    tmpItem = [];
    tmpItem.Name = 'SetFunction:';
    tmpItem.Type = 'combobox';
    tmpItem.Entries = {'Instance specific'};
    tmpItem.Value = 'Instance specific';
    tmpItem.Enabled = false;
    tmpItem.RowSpan = [2.0 2.0];
    tmpItem.ColSpan = [1.0 1.0];
    panel.Items = horzcat(panel.Items, cellhorzcat(tmpItem));
    % 30 31
    panel.LayoutGrid = [2.0 1.0];
end % function
