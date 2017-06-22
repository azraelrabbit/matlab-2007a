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
    % 15 18
    % 16 18
    % 17 18
    hasSpinner = true;
    if strcmpi(hThis.NumPortsParam, 'HIDE_SPINNER')
        hasSpinner = false;
    end % if
    % 22 23
    baseLabel.Name = hThis.BaseLabel;
    baseLabel.Type = 'text';
    baseLabel.RowSpan = [1.0 1.0];
    baseLabel.ColSpan = [1.0 1.0];
    % 27 28
    baseValStr.Name = hThis.BaseDisplay;
    baseValStr.Type = 'text';
    baseValStr.Tag = horzcat(hThis.ObjId, '.Base.Text');
    % 31 32
    baseValStr.RowSpan = [1.0 1.0];
    baseValStr.ColSpan = [2.0 2.0];
    % 34 35
    basePanel.Name = '';
    basePanel.Type = 'panel';
    basePanel.LayoutGrid = [1.0 2.0];
    basePanel.RowSpan = [1.0 1.0];
    basePanel.ColSpan = [1.0 1.0];
    basePanel.Items = cellhorzcat(baseLabel, baseValStr);
    % 41 43
    % 42 43
    folwLabel.Name = hThis.FollowerLabel;
    folwLabel.Type = 'text';
    folwLabel.RowSpan = [1.0 1.0];
    folwLabel.ColSpan = [1.0 1.0];
    % 47 48
    folwValStr.Name = hThis.FollowerDisplay;
    folwValStr.Type = 'text';
    folwValStr.Tag = horzcat(hThis.ObjId, '.Follower.Text');
    folwValStr.RowSpan = [1.0 1.0];
    folwValStr.ColSpan = [2.0 2.0];
    % 53 54
    folwPanel.Name = '';
    folwPanel.Type = 'panel';
    folwPanel.LayoutGrid = [1.0 2.0];
    folwPanel.RowSpan = [2.0 2.0];
    folwPanel.ColSpan = [1.0 1.0];
    folwPanel.Items = cellhorzcat(folwLabel, folwValStr);
    % 60 62
    % 61 62
    if hasSpinner
        hThis.mSpinner.MinValue = 0.0;
        hThis.mSpinner.MaxValue = 99.0;
        hThis.mSpinner.Value = hThis.NumPorts;
        hThis.mSpinner.EnableStatus = hThis.EnableStatus;
        % 67 69
        % 68 69
        hThis.mSpinner.ValueBlkParam = hThis.NumPortsParam;
        % 70 71
        portLabel.Name = hThis.PortSpinnerLabel;
        portLabel.Type = 'text';
        portLabel.RowSpan = [1.0 1.0];
        portLabel.ColSpan = [1.0 1.0];
        % 75 76
        spinner = 0.0;
        [didFail, spinner] = hThis.mSpinner.Render(spinner);
        spinner.RowSpan = [1.0 1.0];
        spinner.ColSpan = [2.0 2.0];
        % 80 81
        portPanel.Name = '';
        portPanel.Type = 'panel';
        portPanel.LayoutGrid = [1.0 2.0];
        portPanel.ColStretch = [0.0 0.0];
        portPanel.RowStretch = 0.0;
        portPanel.RowSpan = [3.0 3.0];
        portPanel.ColSpan = [1.0 1.0];
        portPanel.Items = cellhorzcat(portLabel, spinner);
    end % if
    % 90 92
    % 91 92
    grpBox.Name = xlate('Connection parameters');
    grpBox.Type = 'group';
    grpBox.RowSpan = [1.0 1.0];
    grpBox.ColSpan = [1.0 1.0];
    % 96 97
    if hasSpinner
        grpBox.LayoutGrid = [3.0 1.0];
        grpBox.RowStretch = zeros(1.0, 4.0);
        grpBox.Items = cellhorzcat(basePanel, folwPanel, portPanel);
    else
        grpBox.LayoutGrid = [2.0 1.0];
        grpBox.RowStretch = zeros(1.0, 3.0);
        grpBox.Items = cellhorzcat(basePanel, folwPanel);
    end % if
    % 106 107
    panel.Name = 'BlockConnectionPanel';
    panel.Type = 'panel';
    grpBox.LayoutGrid = [1.0 1.0];
    panel.RowSpan = [1.0 1.0];
    panel.ColSpan = [1.0 1.0];
    grpBox.ColStretch = 0.0;
    grpBox.RowStretch = 0.0;
    panel.Items = cellhorzcat(grpBox);
    % 115 116
    schema = panel;
end % function
