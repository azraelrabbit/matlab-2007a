function dlgStruct = getDialogSchema(this, name)
    % 1 24
    % 2 24
    % 3 24
    % 4 24
    % 5 24
    % 6 24
    % 7 24
    % 8 24
    % 9 24
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    MaxWidgetInTab = 6.0;
    % 24 27
    % 25 27
    CMapStr = dspGetLeafWidgetBase('edit', 'Colormap matrix:', 'CMapStr', this, 'CMapStr');
    CMapStr.Entries = ctranspose(set(this, 'CMapStr'));
    CMapStr.RowSpan = [1.0 1.0];
    CMapStr.ColSpan = [1.0 1.0];
    CMapStr.Visible = 1.0;
    CMapStr.Tunable = 1.0;
    % 32 34
    YMin = dspGetLeafWidgetBase('edit', 'Minimum input value:', 'YMin', this, 'YMin');
    YMin.Entries = ctranspose(set(this, 'YMin'));
    YMin.RowSpan = [2.0 2.0];
    YMin.ColSpan = [1.0 1.0];
    YMin.Visible = 1.0;
    YMin.Tunable = 1.0;
    % 39 41
    YMax = dspGetLeafWidgetBase('edit', 'Maximum input value:', 'YMax', this, 'YMax');
    YMax.Entries = ctranspose(set(this, 'YMax'));
    YMax.RowSpan = [3.0 3.0];
    YMax.ColSpan = [1.0 1.0];
    YMax.Visible = 1.0;
    YMax.Tunable = 1.0;
    % 46 48
    AxisColorbar = dspGetLeafWidgetBase('checkbox', 'Display colorbar', 'AxisColorbar', this, 'AxisColorbar');
    AxisColorbar.RowSpan = [4.0 4.0];
    AxisColorbar.ColSpan = [1.0 1.0];
    AxisColorbar.Visible = 1.0;
    AxisColorbar.Tunable = 1.0;
    % 52 54
    ImPropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'ImPropParameterPane');
    ImPropParameterPane.Items = cellhorzcat(CMapStr, YMin, YMax, AxisColorbar);
    ImPropParameterPane.Tag = 'ImPropParameterPane';
    ImPropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    ImPropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    % 58 61
    % 59 61
    ImagPropTab.Name = 'Image Properties';
    ImagPropTab.Items = cellhorzcat(ImPropParameterPane);
    % 62 66
    % 63 66
    % 64 66
    AxisOrigin = dspGetLeafWidgetBase('combobox', 'Axis origin:', 'AxisOrigin', this, 'AxisOrigin');
    AxisOrigin.Entries = {'Upper left corner','Lower left corner'};
    AxisOrigin.RowSpan = [1.0 1.0];
    AxisOrigin.ColSpan = [1.0 1.0];
    AxisOrigin.Visible = 1.0;
    AxisOrigin.Tunable = 1.0;
    % 71 73
    XLabel = dspGetLeafWidgetBase('edit', 'X-axis title:', 'XLabel', this, 'XLabel');
    XLabel.Entries = ctranspose(set(this, 'XLabel'));
    XLabel.RowSpan = [2.0 2.0];
    XLabel.ColSpan = [1.0 1.0];
    XLabel.Visible = 1.0;
    XLabel.Tunable = 1.0;
    % 78 80
    YLabel = dspGetLeafWidgetBase('edit', 'Y-axis title:', 'YLabel', this, 'YLabel');
    YLabel.Entries = ctranspose(set(this, 'YLabel'));
    YLabel.RowSpan = [3.0 3.0];
    YLabel.ColSpan = [1.0 1.0];
    YLabel.Visible = 1.0;
    YLabel.Tunable = 1.0;
    % 85 87
    ZLabel = dspGetLeafWidgetBase('edit', 'Colorbar title:', 'ZLabel', this, 'ZLabel');
    ZLabel.Entries = ctranspose(set(this, 'ZLabel'));
    ZLabel.RowSpan = [4.0 4.0];
    ZLabel.ColSpan = [1.0 1.0];
    ZLabel.Visible = 1.0;
    ZLabel.Tunable = 1.0;
    % 92 94
    FigPos = dspGetLeafWidgetBase('edit', 'Figure position, [x y width height]:', 'FigPos', this, 'FigPos');
    FigPos.Entries = ctranspose(set(this, 'FigPos'));
    FigPos.RowSpan = [5.0 5.0];
    FigPos.ColSpan = [1.0 1.0];
    FigPos.Visible = 1.0;
    FigPos.Tunable = 1.0;
    % 99 101
    AxisZoom = dspGetLeafWidgetBase('checkbox', 'Axis zoom', 'AxisZoom', this, 'AxisZoom');
    AxisZoom.RowSpan = [6.0 6.0];
    AxisZoom.ColSpan = [1.0 1.0];
    AxisZoom.Visible = 1.0;
    AxisZoom.Tunable = 1.0;
    % 105 107
    AxPropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'AxPropParameterPane');
    AxPropParameterPane.Items = cellhorzcat(AxisOrigin, XLabel, YLabel, ZLabel, FigPos, AxisZoom);
    AxPropParameterPane.Tag = 'AxPropParameterPane';
    AxPropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    AxPropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    % 111 114
    % 112 114
    AxisPropTab.Name = 'Axis Properties';
    AxisPropTab.Items = cellhorzcat(AxPropParameterPane);
    % 115 118
    % 116 118
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.Tabs = cellhorzcat(ImagPropTab, AxisPropTab);
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    % 121 123
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
    idx = findstr(this.Block.Name, sprintf('\n'));
    blkName = this.Block.Name;
    blkName(idx) = ' ';
    dlgStruct.DialogTitle = horzcat('Sink Block Parameters: ', blkName);
end % function
