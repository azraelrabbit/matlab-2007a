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
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    hThis.ValueTxt = num2str(hThis.Value);
    baseTagName = horzcat(hThis.ObjId, '.', hThis.ValueBlkParam);
    % 30 31
    textbox.Name = hThis.Label;
    textbox.Type = 'edit';
    textbox.Tag = horzcat(baseTagName, '.Edit');
    textbox.Value = hThis.Value;
    textbox.Enabled = hThis.EnableStatus;
    textbox.RowSpan = [1.0 1.0];
    textbox.ColSpan = [1.0 1.0];
    textbox.Mode = true;
    textbox.Source = hThis;
    textbox.ObjectProperty = 'ValueTxt';
    textbox.HideName = true;
    textbox.ObjectMethod = 'OnEditChange';
    textbox.MethodArgs = {'%dialog','%value','%tag'};
    textbox.ArgDataTypes = {'handle','string','string'};
    % 45 46
    txtPanel.Name = '';
    txtPanel.Type = 'panel';
    txtPanel.LayoutGrid = [1.0 1.0];
    txtPanel.RowSpan = [1.0 1.0];
    txtPanel.ColSpan = [1.0 8.0];
    txtPanel.Items = cellhorzcat(textbox);
    txtPanel.Source = hThis;
    txtPanel.RowStretch = 0.0;
    txtPanel.ColStretch = 0.0;
    % 55 56
    buttonSize = [15.0 15.0];
    % 57 58
    upButn.FilePath = fullfile(matlabroot, 'toolbox', 'physmod', 'pm_util', 'pm_util', 'dlg_resources', 'spinner_arrow_up.png');
    % 59 60
    upButn.Name = '';
    upButn.Tag = horzcat(baseTagName, '.UpButton');
    upButn.Type = 'pushbutton';
    upButn.Enabled = hThis.EnableStatus;
    upButn.RowSpan = [1.0 1.0];
    upButn.ColSpan = [1.0 1.0];
    upButn.MinimumSize = buttonSize;
    upButn.MaximumSize = buttonSize;
    upButn.ObjectMethod = 'OnUpButton';
    upButn.MethodArgs = {'%dialog','%value','%tag'};
    upButn.ArgDataTypes = {'handle','string','string'};
    upButn.Alignment = 7.0;
    % 72 73
    downButn.Name = '';
    downButn.Type = 'pushbutton';
    downButn.Enabled = hThis.EnableStatus;
    downButn.Tag = horzcat(baseTagName, '.DownButton');
    downButn.FilePath = fullfile(matlabroot, 'toolbox', 'physmod', 'pm_util', 'pm_util', 'dlg_resources', 'spinner_arrow_down.png');
    % 78 79
    downButn.RowSpan = [2.0 2.0];
    downButn.ColSpan = [1.0 1.0];
    downButn.MinimumSize = buttonSize;
    downButn.MaximumSize = buttonSize;
    downButn.ObjectMethod = 'OnDownButton';
    downButn.MethodArgs = {'%dialog','%value','%tag'};
    downButn.ArgDataTypes = {'handle','string','string'};
    downButn.Alignment = 1.0;
    % 87 88
    butnPanel.Name = '';
    butnPanel.Type = 'panel';
    butnPanel.LayoutGrid = [2.0 1.0];
    butnPanel.RowSpan = [1.0 1.0];
    butnPanel.ColSpan = [9.0 9.0];
    butnPanel.RowStretch = [0.0 0.0];
    butnPanel.ColStretch = 0.0;
    butnPanel.Alignment = 4.0;
    butnPanel.Items = cellhorzcat(upButn, downButn);
    butnPanel.Source = hThis;
    % 98 99
    panel.Name = '';
    panel.Type = 'panel';
    panel.LayoutGrid = [1.0 10.0];
    panel.RowSpan = [1.0 1.0];
    panel.ColSpan = [1.0 1.0];
    panel.RowStretch = 0.0;
    panel.ColStretch = zeros(1.0, 10.0);
    panel.Alignment = 4.0;
    % 107 108
    panel.Items = cellhorzcat(txtPanel, butnPanel);
    panel.Source = hThis;
    % 110 111
    if not(isempty(hThis.Label))
        nCols = 2.0;
        panel.ColSpan = [2.0 2.0];
        itemList = cellhorzcat(labelTxt, panel);
    else
        nCols = 1.0;
        panel.ColSpan = [1.0 1.0];
        itemList = cellhorzcat(panel);
    end % if
    % 120 121
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = horzcat(1.0, nCols);
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = itemList;
    basePanel.ColStretch = zeros(1.0, nCols);
    basePanel.RowStretch = 0.0;
    % 129 130
    schema = basePanel;
end % function
