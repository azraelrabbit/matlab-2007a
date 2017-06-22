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
    butnSize = [20.0 14.0];
    % 18 19
    for idx=1.0:hThis.NumButtons
        butn.Name = '+';
        butn.Tag = 'UpButton';
        butn.Type = 'pushbutton';
        butn.RowSpan = [1.0 1.0];
        butn.ColSpan = horzcat(idx, idx);
        butn.MinimumSize = butnSize;
        butn.MaximumSize = butnSize;
        butn.ObjectMethod = 'OnUpButton';
        butn.MethodArgs = {'%dialog'};
        butn.ArgDataTypes = {'handle'};
    end % for
    % 31 32
    if not(isempty(hThis.Label))
        % 33 35
        % 34 35
        disp('Currently not rendering text label of the spinner.')
    end % if
    % 37 38
    textbox.Name = hThis.Label;
    textbox.Type = 'edit';
    textbox.Value = hThis.Value;
    textbox.RowSpan = [1.0 1.0];
    textbox.ColSpan = [1.0 1.0];
    textbox.HideName = true;
    textbox.Tag = 'ConnPanelPortEdit';
    % 45 46
    txtPanel.Name = '';
    txtPanel.Type = 'panel';
    txtPanel.LayoutGrid = [1.0 1.0];
    txtPanel.RowSpan = [1.0 1.0];
    txtPanel.ColSpan = [1.0 8.0];
    txtPanel.Items = cellhorzcat(textbox);
    txtPanel.Source = hThis;
    % 53 54
    upButn.Name = '+';
    upButn.Tag = 'UpButton';
    upButn.Type = 'pushbutton';
    upButn.RowSpan = [1.0 1.0];
    upButn.ColSpan = [1.0 1.0];
    upButn.MinimumSize = [20.0 14.0];
    upButn.MaximumSize = [20.0 14.0];
    upButn.ObjectMethod = 'OnUpButton';
    upButn.MethodArgs = {'%dialog'};
    upButn.ArgDataTypes = {'handle'};
    % 64 65
    downButn.Name = '-';
    downButn.Type = 'pushbutton';
    % 67 68
    downButn.Tag = 'DownButton';
    downButn.RowSpan = [2.0 2.0];
    downButn.ColSpan = [1.0 1.0];
    downButn.MinimumSize = [20.0 14.0];
    downButn.MaximumSize = [20.0 14.0];
    downButn.ObjectMethod = 'OnDownButton';
    downButn.MethodArgs = {'%dialog'};
    downButn.ArgDataTypes = {'handle'};
    % 76 77
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
    % 87 89
    % 88 89
    panel.Name = '';
    panel.Type = 'panel';
    panel.LayoutGrid = [1.0 10.0];
    panel.RowSpan = [1.0 1.0];
    panel.ColSpan = [1.0 1.0];
    panel.RowStretch = 0.0;
    panel.ColStretch = zeros(1.0, 10.0);
    panel.Alignment = 4.0;
    % 97 98
    panel.Items = cellhorzcat(txtPanel, butnPanel);
    panel.Source = hThis;
    % 100 101
    schema = panel;
end % function
