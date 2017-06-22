function tbTab = getTabDialogSchema(this, schemaName, hTopObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    tagpf = horzcat(getWidgetTagPrefix(this), 'TestBenchPanel_');
    % 8 10
    src = hTopObj.HDLCoder.CoderParameterObject.CLI;
    % 10 12
    tbName_tt = 'Specify the postfix for test bench file name';
    tbName_lbl.Name = 'Test bench name postfix: ';
    tbName_lbl.Type = 'text';
    tbName_lbl.RowSpan = [1.0 1.0];
    tbName_lbl.ColSpan = [1.0 1.0];
    tbName_lbl.ToolTip = tbName_tt;
    % 17 19
    tbName.Type = 'edit';
    tbName.ObjectProperty = 'TestBenchPostfix';
    tbName.Source = src;
    tbName.Tag = horzcat(tagpf, 'TestBenchPostfix');
    tbName.RowSpan = [1.0 1.0];
    tbName.ColSpan = [2.0 2.0];
    tbName.ToolTip = tbName_tt;
    tbName.Mode = true;
    % 26 29
    % 27 29
    txtsubsys.Type = 'text';
    % 29 31
    txtsubsys.Name = '       ';
    txtsubsys.RowSpan = [1.0 1.0];
    txtsubsys.ColSpan = [3.0 4.0];
    % 33 35
    fClock.ToolTip = 'Specify whether test bench forces clock input signals';
    fClock.Name = 'Force clock';
    fClock.Type = 'checkbox';
    fClock.ObjectProperty = 'ForceClock';
    fClock.Source = src;
    fClock.Tag = horzcat(tagpf, 'ForceClock');
    fClock.Mode = true;
    fClock.DialogRefresh = true;
    fClock.RowSpan = [2.0 2.0];
    fClock.ColSpan = [1.0 2.0];
    % 44 46
    cHigh_lbl_tt = 'Specify period, in nanoseconds, during which test bench drives clock input signals high (1)';
    cHigh_lbl.Name = '      Clock high time (ns): ';
    cHigh_lbl.Type = 'text';
    cHigh_lbl.RowSpan = [3.0 3.0];
    cHigh_lbl.ColSpan = [1.0 1.0];
    cHigh_lbl.ToolTip = cHigh_lbl_tt;
    % 51 53
    cHigh.Type = 'edit';
    cHigh.ObjectProperty = 'ClockHighTime';
    cHigh.Source = src;
    cHigh.Tag = horzcat(tagpf, 'ClockHighTime');
    cHigh.RowSpan = [3.0 3.0];
    cHigh.ColSpan = [2.0 2.0];
    cHigh.ToolTip = cHigh_lbl_tt;
    cHigh.Mode = true;
    % 60 62
    cLow_lbl_tt = 'Specify period, in nanoseconds, during which a test bench drives clock input signals low (0)';
    cLow_lbl.Name = '      Clock low time (ns): ';
    cLow_lbl.Type = 'text';
    cLow_lbl.RowSpan = [4.0 4.0];
    cLow_lbl.ColSpan = [1.0 1.0];
    cLow_lbl.ToolTip = cLow_lbl_tt;
    % 67 69
    cLow.Type = 'edit';
    cLow.ObjectProperty = 'ClockLowTime';
    cLow.Source = src;
    cLow.Tag = horzcat(tagpf, 'ClockLowTime');
    cLow.RowSpan = [4.0 4.0];
    cLow.ColSpan = [2.0 2.0];
    cLow.ToolTip = cLow_lbl_tt;
    cLow.Mode = true;
    % 76 78
    if strcmpi(src.ForceClock, 'off')
        cHigh.Enabled = false;
        cLow.Enabled = false;
    end % if
    % 81 84
    % 82 84
    fCEnable.Name = 'Force clock enable';
    fCEnable.Type = 'checkbox';
    fCEnable.ObjectProperty = 'ForceClockEnable';
    fCEnable.Source = src;
    fCEnable.Tag = horzcat(tagpf, 'ForceClockEnable');
    fCEnable.RowSpan = [5.0 5.0];
    fCEnable.ColSpan = [1.0 2.0];
    fCEnable.Mode = true;
    fCEnable.DialogRefresh = true;
    fCEnable.ToolTip = 'Specify whether test bench forces clock enable input signals';
    % 93 95
    fReset.Name = 'Force reset';
    fReset.Type = 'checkbox';
    fReset.ObjectProperty = 'ForceReset';
    fReset.Source = src;
    fReset.Tag = horzcat(tagpf, 'ForceReset');
    fReset.RowSpan = [6.0 6.0];
    fReset.ColSpan = [1.0 2.0];
    fReset.Mode = true;
    fReset.DialogRefresh = true;
    fReset.ToolTip = 'Specify whether test bench forces reset input signals';
    % 104 106
    hTime_lbl_tt = 'Specify hold time for filter data input signals and forced reset input signals';
    hTime_lbl.Name = 'Hold time (ns): ';
    hTime_lbl.Type = 'text';
    hTime_lbl.RowSpan = [7.0 7.0];
    hTime_lbl.ColSpan = [1.0 1.0];
    hTime_lbl.ToolTip = hTime_lbl_tt;
    % 111 113
    hTime.Type = 'edit';
    hTime.ObjectProperty = 'HoldTime';
    hTime.Source = src;
    hTime.Tag = horzcat(tagpf, 'HoldTime');
    hTime.RowSpan = [7.0 7.0];
    hTime.ColSpan = [2.0 2.0];
    hTime.ToolTip = hTime_lbl_tt;
    hTime.Mode = true;
    % 120 122
    hSrc = hTopObj.getSourceObject;
    % 122 124
    if not(isempty(strfind(hTopObj.HDLCoder.StartNodeName, '/')))
        % 124 126
        buttonEnable = and(not(isempty(hTopObj.getModel)), not(hSrc.isObjectLocked));
    else
        buttonEnable = false;
    end % if
    % 129 132
    % 130 132
    gbtn.Name = 'Generate Test Bench';
    gbtn.ToolTip = 'Generate Test Bench for selected subsystem';
    gbtn.Type = 'pushbutton';
    gbtn.Tag = horzcat(tagpf, '_Generate');
    gbtn.Source = this;
    gbtn.ObjectMethod = 'testbenchCallback';
    gbtn.MethodArgs = cellhorzcat('%dialog', gbtn.Tag, '', hTopObj);
    gbtn.ArgDataTypes = {'handle','string','string','handle'};
    gbtn.RowSpan = [10.0 10.0];
    gbtn.ColSpan = [3.0 4.0];
    gbtn.Enabled = buttonEnable;
    gbtn.Mode = true;
    gbtn.DialogRefresh = true;
    % 144 148
    % 145 148
    % 146 148
    sptxt1.Type = 'text';
    sptxt1.Name = '                                                            ';
    sptxt1.RowSpan = [8.0 8.0];
    sptxt1.ColSpan = [3.0 3.0];
    % 151 153
    sptxt2.Type = 'text';
    sptxt2.Name = '                                                            ';
    sptxt2.RowSpan = [9.0 9.0];
    sptxt2.ColSpan = [3.0 3.0];
    % 156 158
    tbgroup.Type = 'group';
    tbgroup.Name = 'Test bench';
    tbgroup.Items = cellhorzcat(tbName_lbl, tbName, txtsubsys, fCEnable, fClock, cHigh_lbl, cHigh, cLow_lbl, cLow, fReset, hTime_lbl, hTime, sptxt1, sptxt2, gbtn);
    % 160 163
    % 161 163
    tbgroup.LayoutGrid = [3.0 13.0];
    % 163 166
    % 164 166
    tbTab.Items = cellhorzcat(tbgroup);
    % 166 172
    % 167 172
    % 168 172
    % 169 172
    % 170 172
    tbTab.Name = 'Test Bench';
end % function
