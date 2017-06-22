function dlgStruct = getDialogSchema(this, name)
    % 1 25
    % 2 25
    % 3 25
    % 4 25
    % 5 25
    % 6 25
    % 7 25
    % 8 25
    % 9 25
    % 10 25
    % 11 25
    % 12 25
    % 13 25
    % 14 25
    % 15 25
    % 16 25
    % 17 25
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    MaxWidgetInTab = 14.0;
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    Domain = dspGetLeafWidgetBase('combobox', 'Input domain:', 'Domain', this, 'Domain');
    Domain.Entries = {'Time','Frequency','User-defined'};
    Domain.RowSpan = [1.0 1.0];
    Domain.ColSpan = [1.0 1.0];
    Domain.Visible = 1.0;
    Domain.DialogRefresh = 1.0;
    Domain.Mode = 1.0;
    Domain.Tunable = 1.0;
    % 37 39
    HorizSpan = dspGetLeafWidgetBase('edit', 'Time display span (number of frames):', 'HorizSpan', this, 'HorizSpan');
    HorizSpan.Entries = ctranspose(set(this, 'HorizSpan'));
    HorizSpan.RowSpan = [2.0 2.0];
    HorizSpan.ColSpan = [1.0 1.0];
    % 42 46
    % 43 46
    % 44 46
    AxisGrid = dspGetLeafWidgetBase('checkbox', 'Show grid', 'AxisGrid', this, 'AxisGrid');
    AxisGrid.RowSpan = [1.0 1.0];
    AxisGrid.ColSpan = [1.0 1.0];
    AxisGrid.Visible = 1.0;
    AxisGrid.Tunable = 1.0;
    Memory = dspGetLeafWidgetBase('checkbox', 'Persistence', 'Memory', this, 'Memory');
    Memory.RowSpan = [2.0 2.0];
    Memory.ColSpan = [1.0 1.0];
    Memory.Visible = 1.0;
    Memory.Tunable = 1.0;
    FrameNumber = dspGetLeafWidgetBase('checkbox', 'Frame number', 'FrameNumber', this, 'FrameNumber');
    FrameNumber.RowSpan = [3.0 3.0];
    FrameNumber.ColSpan = [1.0 1.0];
    FrameNumber.Visible = 1.0;
    FrameNumber.Tunable = 1.0;
    AxisLegend = dspGetLeafWidgetBase('checkbox', 'Channel legend', 'AxisLegend', this, 'AxisLegend');
    AxisLegend.RowSpan = [4.0 4.0];
    AxisLegend.ColSpan = [1.0 1.0];
    AxisLegend.Visible = 1.0;
    AxisLegend.Tunable = 1.0;
    AxisZoom = dspGetLeafWidgetBase('checkbox', 'Compact display', 'AxisZoom', this, 'AxisZoom');
    AxisZoom.RowSpan = [5.0 5.0];
    AxisZoom.ColSpan = [1.0 1.0];
    AxisZoom.Visible = 1.0;
    AxisZoom.Tunable = 1.0;
    OpenScopeAtSimStart = dspGetLeafWidgetBase('checkbox', 'Open scope at start of simulation', 'OpenScopeAtSimStart', this, 'OpenScopeAtSimStart');
    OpenScopeAtSimStart.RowSpan = [6.0 6.0];
    OpenScopeAtSimStart.ColSpan = [1.0 1.0];
    OpenScopeAtSimStart.Visible = 1.0;
    OpenScopeAtSimStart.Tunable = 1.0;
    % 75 81
    % 76 81
    % 77 81
    % 78 81
    % 79 81
    OpenScopeImmediately.Type = 'pushbutton';
    OpenScopeImmediately.Name = 'Open scope immediately';
    OpenScopeImmediately.Tag = 'OpenScopeImmediatelyTag';
    OpenScopeImmediately.RowSpan = [7.0 7.0];
    OpenScopeImmediately.ColSpan = [1.0 1.0];
    OpenScopeImmediately.MatlabMethod = 'sdspfscope2';
    OpenScopeImmediately.MatlabArgs = cellhorzcat('[]', '[]', '[]', 'OpenScope', getfullname(this.Block.Handle));
    % 87 89
    FigPos = dspGetLeafWidgetBase('edit', 'Scope position:', 'FigPos', this, 'FigPos');
    FigPos.Entries = ctranspose(set(this, 'FigPos'));
    FigPos.RowSpan = [8.0 8.0];
    FigPos.ColSpan = [1.0 1.0];
    FigPos.Visible = 1.0;
    FigPos.Tunable = 1.0;
    % 94 97
    % 95 97
    XUnits = dspGetLeafWidgetBase('combobox', 'Frequency units:', 'XUnits', this, 'XUnits');
    XUnits.Entries = {'Hertz','rad/sec'};
    XUnits.RowSpan = [1.0 1.0];
    XUnits.ColSpan = [1.0 1.0];
    XUnits.Visible = 1.0;
    XUnits.Tunable = 1.0;
    XRange = dspGetLeafWidgetBase('combobox', 'Frequency range:', 'XRange', this, 'XRange');
    XRange.Entries = {'[0...Fs/2]','[-Fs/2...Fs/2]','[0...Fs]'};
    XRange.RowSpan = [2.0 2.0];
    XRange.ColSpan = [1.0 1.0];
    XRange.Visible = 1.0;
    XRange.Tunable = 1.0;
    XRange.DialogRefresh = 1.0;
    InheritXIncr = dspGetLeafWidgetBase('checkbox', 'Inherit sample time from input', 'InheritXIncr', this, 'InheritXIncr');
    InheritXIncr.RowSpan = [3.0 3.0];
    InheritXIncr.ColSpan = [1.0 1.0];
    InheritXIncr.Visible = 1.0;
    InheritXIncr.DialogRefresh = 1.0;
    InheritXIncr.Tunable = 1.0;
    XStart = dspGetLeafWidgetBase('edit', 'X display offset:', 'XStart', this, 'XStart');
    XStart.Entries = ctranspose(set(this, 'XStart'));
    XStart.RowSpan = [4.0 4.0];
    XMin.ColSpan = [1.0 1.0];
    XStart.Visible = 1.0;
    XStart.Tunable = 1.0;
    XIncr = dspGetLeafWidgetBase('edit', 'Sample time of original time series:', 'XIncr', this, 'XIncr');
    XIncr.Entries = ctranspose(set(this, 'XIncr'));
    XIncr.RowSpan = [5.0 5.0];
    XIncr.ColSpan = [1.0 1.0];
    XIncr.Visible = 1.0;
    XIncr.Tunable = 1.0;
    XLabel = dspGetLeafWidgetBase('edit', 'X-axis title:', 'XLabel', this, 'XLabel');
    XLabel.Entries = ctranspose(set(this, 'XLabel'));
    XLabel.RowSpan = [6.0 6.0];
    XLabel.ColSpan = [1.0 1.0];
    XLabel.Visible = 1.0;
    XLabel.Tunable = 1.0;
    XLimit = dspGetLeafWidgetBase('combobox', 'Time display limits:', 'XLimit', this, 'XLimit');
    XLimit.Entries = {'Auto','User-defined'};
    XLimit.RowSpan = [7.0 7.0];
    XLimit.ColSpan = [1.0 1.0];
    XLimit.Visible = 1.0;
    XLimit.Tunable = 1.0;
    XLimit.DialogRefresh = 1.0;
    XMin = dspGetLeafWidgetBase('edit', 'Minimum X-limit:', 'XMin', this, 'XMin');
    XMin.Entries = ctranspose(set(this, 'XMin'));
    XMin.RowSpan = [8.0 8.0];
    XMin.ColSpan = [1.0 1.0];
    XMin.Visible = 1.0;
    XMin.Tunable = 1.0;
    XMax = dspGetLeafWidgetBase('edit', 'Maximum X-limit:', 'XMax', this, 'XMax');
    XMax.Entries = ctranspose(set(this, 'XMax'));
    XMax.RowSpan = [9.0 9.0];
    XMax.ColSpan = [1.0 1.0];
    XMax.Visible = 1.0;
    XMax.Tunable = 1.0;
    YUnits = dspGetLeafWidgetBase('combobox', 'Amplitude scaling:', 'YUnits', this, 'YUnits');
    YUnits.Entries = {'Magnitude','dB'};
    YUnits.RowSpan = [10.0 10.0];
    YUnits.ColSpan = [1.0 1.0];
    YUnits.Visible = 1.0;
    YUnits.Tunable = 1.0;
    YMin = dspGetLeafWidgetBase('edit', 'Minimum Y-limit:', 'YMin', this, 'YMin');
    YMin.Entries = ctranspose(set(this, 'YMin'));
    YMin.RowSpan = [11.0 11.0];
    YMin.ColSpan = [1.0 1.0];
    YMin.Visible = 1.0;
    YMin.Tunable = 1.0;
    YMax = dspGetLeafWidgetBase('edit', 'Maximum Y-limit:', 'YMax', this, 'YMax');
    YMax.Entries = ctranspose(set(this, 'YMax'));
    YMax.RowSpan = [12.0 12.0];
    YMax.ColSpan = [1.0 1.0];
    YMax.Visible = 1.0;
    YMax.Tunable = 1.0;
    YLabel = dspGetLeafWidgetBase('edit', 'Y-axis title:', 'YLabel', this, 'YLabel');
    YLabel.Entries = ctranspose(set(this, 'YLabel'));
    YLabel.RowSpan = [13.0 13.0];
    YLabel.ColSpan = [1.0 1.0];
    YLabel.Visible = 1.0;
    YLabel.Tunable = 1.0;
    % 176 179
    % 177 179
    LineDisables = dspGetLeafWidgetBase('edit', 'Line visibilities:', 'LineDisables', this, 'LineDisables');
    LineDisables.Entries = ctranspose(set(this, 'LineDisables'));
    LineDisables.RowSpan = [1.0 1.0];
    LineDisables.ColSpan = [1.0 1.0];
    LineDisables.Visible = 1.0;
    LineDisables.Tunable = 1.0;
    LineStyles = dspGetLeafWidgetBase('edit', 'Line styles:', 'LineStyles', this, 'LineStyles');
    LineStyles.Entries = ctranspose(set(this, 'LineStyles'));
    LineStyles.RowSpan = [2.0 2.0];
    LineStyles.ColSpan = [1.0 1.0];
    LineStyles.Visible = 1.0;
    LineStyles.Tunable = 1.0;
    LineMarkers = dspGetLeafWidgetBase('edit', 'Line markers:', 'LineMarkers', this, 'LineMarkers');
    LineMarkers.Entries = ctranspose(set(this, 'LineMarkers'));
    LineMarkers.RowSpan = [3.0 3.0];
    LineMarkers.ColSpan = [1.0 1.0];
    LineMarkers.Visible = 1.0;
    LineMarkers.Tunable = 1.0;
    LineColors = dspGetLeafWidgetBase('edit', 'Line colors:', 'LineColors', this, 'LineColors');
    LineColors.Entries = ctranspose(set(this, 'LineColors'));
    LineColors.RowSpan = [4.0 4.0];
    LineColors.ColSpan = [1.0 1.0];
    LineColors.Visible = 1.0;
    LineColors.Tunable = 1.0;
    % 202 204
    if strcmp(this.Domain, 'Time')
        XLimit.Visible = 1.0;
        XLimit.Tunable = 1.0;
        if not(strcmp(this.XLimit, 'User-defined'))
            XMin.Visible = 0.0;
            XMin.Tunable = 0.0;
            XMax.Visible = 0.0;
            XMax.Tunable = 0.0;
        else
            XMin.Visible = 1.0;
            XMin.Tunable = 1.0;
            XMax.Visible = 1.0;
            XMax.Tunable = 1.0;
        end % if
        HorizSpan.Visible = 1.0;
        HorizSpan.Name = 'Time display span (number of frames):';
        XStart.Visible = 0.0;
        XStart.Tunable = 0.0;
        XUnits.Visible = 0.0;
        XUnits.Tunable = 0.0;
        XRange.Visible = 0.0;
        XRange.Tunable = 0.0;
        InheritXIncr.Visible = 0.0;
        InheritXIncr.Tunable = 0.0;
        XIncr.Visible = 0.0;
        XIncr.Tunable = 0.0;
        XLabel.Visible = 0.0;
        XLabel.Tunable = 0.0;
        YUnits.Visible = 0.0;
        YUnits.Tunable = 0.0;
    else
        if strcmp(this.Domain, 'Frequency')
            XStart.Visible = 0.0;
            XStart.Tunable = 0.0;
            XRange.Visible = 1.0;
            XRange.Tunable = 1.0;
            XLimit.Visible = 1.0;
            XLimit.Tunable = 1.0;
            XLimit.Name = 'Frequency display limits:';
            if not(strcmp(this.XLimit, 'User-defined'))
                XMin.Visible = 0.0;
                XMin.Tunable = 0.0;
                XMax.Visible = 0.0;
                XMax.Tunable = 0.0;
            else
                XMin.Visible = 1.0;
                XMin.Tunable = 1.0;
                XMax.Visible = 1.0;
                XMax.Tunable = 1.0;
            end % if
            HorizSpan.Visible = 0.0;
            InheritXIncr.Name = 'Inherit sample time from input';
            XIncr.Name = 'Sample time of original time series:';
            XLabel.Visible = 0.0;
            XLabel.Tunable = 0.0;
            if this.InheritXIncr
                XIncr.Visible = 0.0;
            else
                XIncr.Visible = 1.0;
            end % if
        else
            XStart.Visible = 0.0;
            XStart.Tunable = 0.0;
            XIncr.Visible = 0.0;
            XIncr.Tunable = 0.0;
            if not(this.InheritXIncr)
                XStart.Visible = 1.0;
                XStart.Tunable = 1.0;
                XIncr.Visible = 1.0;
                XIncr.Tunable = 1.0;
            end % if
            XLimit.Name = 'X display limits';
            XLimit.Visible = 1.0;
            XLimit.Tunable = 1.0;
            if not(strcmp(this.XLimit, 'User-defined'))
                XMin.Visible = 0.0;
                XMin.Tunable = 0.0;
                XMax.Visible = 0.0;
                XMax.Tunable = 0.0;
            else
                XMin.Visible = 1.0;
                XMin.Tunable = 1.0;
                XMax.Visible = 1.0;
                XMax.Tunable = 1.0;
            end % if
            HorizSpan.Visible = 1.0;
            HorizSpan.Name = 'Horizontal display span (number of frames):';
            InheritXIncr.Name = 'Inherit sample increment from input';
            XIncr.Name = 'Increment per sample in input:';
            XUnits.Visible = 0.0;
            XUnits.Tunable = 0.0;
            XRange.Visible = 0.0;
            XRange.Tunable = 0.0;
            YUnits.Visible = 0.0;
            YUnits.Tunable = 0.0;
        end % if
    end % if
    parenth = bdroot(this.Block.Handle);
    simStatus = get_param(parenth, 'SimulationStatus');
    if any(strcmpi(simStatus, {'running','paused','external'}))
        HorizSpan.Enabled = 0.0;
        OpenScopeImmediately.Enabled = 1.0;
        OpenScopeImmediately.Visible = 1.0;
    else
        HorizSpan.Enabled = 1.0;
        OpenScopeImmediately.Enabled = 0.0;
        OpenScopeImmediately.Visible = 0.0;
    end % if
    ScopePropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'ScopePropParameterPane');
    ScopePropParameterPane.Items = cellhorzcat(Domain, HorizSpan);
    ScopePropParameterPane.Tag = 'ScopePropParameterPane';
    ScopePropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    ScopePropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    ScopePropTab.Name = 'Scope Properties';
    ScopePropTab.Items = cellhorzcat(ScopePropParameterPane);
    AxisPropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'AxisPropParameterPane');
    AxisPropParameterPane.Items = cellhorzcat(XStart, XUnits, XRange, XLimit, XMin, XMax, InheritXIncr, XIncr, XLabel, YUnits, YMin, YMax, YLabel);
    AxisPropParameterPane.Tag = 'AxisPropParameterPane';
    AxisPropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    AxisPropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    AxisPropTab.Name = 'Axis Properties';
    AxisPropTab.Items = cellhorzcat(AxisPropParameterPane);
    DisplayPropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'DisplayPropParameterPane');
    DisplayPropParameterPane.Items = cellhorzcat(AxisGrid, Memory, FrameNumber, AxisLegend, AxisZoom, OpenScopeAtSimStart, OpenScopeImmediately, FigPos);
    DisplayPropParameterPane.Tag = 'DisplayPropParameterPane';
    DisplayPropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    DisplayPropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    DispPropTab.Name = 'Display Properties';
    DispPropTab.Items = cellhorzcat(DisplayPropParameterPane);
    LinePropParameterPane = dspGetContainerWidgetBase('group', 'Parameters', 'LinePropParameterPane');
    LinePropParameterPane.Items = cellhorzcat(LineDisables, LineStyles, LineMarkers, LineColors);
    LinePropParameterPane.Tag = 'LinePropParameterPane';
    LinePropParameterPane.LayoutGrid = horzcat(MaxWidgetInTab, 1.0);
    LinePropParameterPane.RowStretch = horzcat(zeros(1.0, minus(MaxWidgetInTab, 1.0)), 1.0);
    LinePropTab.Name = 'Line Properties';
    LinePropTab.Items = cellhorzcat(LinePropParameterPane);
    tabbedPane = dspGetContainerWidgetBase('tab', '', 'tabPane');
    tabbedPane.Tabs = cellhorzcat(ScopePropTab, DispPropTab, AxisPropTab, LinePropTab);
    tabbedPane.RowSpan = [2.0 2.0];
    tabbedPane.ColSpan = [1.0 1.0];
    dlgStruct = this.getBaseSchemaStruct(tabbedPane);
    idx = findstr(this.Block.Name, sprintf('\n'));
    blkName = this.Block.Name;
    blkName(idx) = ' ';
    dlgStruct.DialogTitle = horzcat('Sink Block Parameters: ', blkName);
end % function
