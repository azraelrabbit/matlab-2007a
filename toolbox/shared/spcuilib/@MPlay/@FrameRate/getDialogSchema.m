function dlgstruct = getDialogSchema(this, arg)
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
    orig1.Name = 'Source rate:';
    orig1.Type = 'text';
    orig1.RowSpan = [1.0 1.0];
    orig1.ColSpan = [1.0 1.0];
    orig1.ToolTip = 'Original frame rate of source';
    % 17 19
    s = sprintf('%g frames/sec', this.source_fps);
    orig2.Name = s;
    orig2.Type = 'text';
    orig2.RowSpan = [1.0 1.0];
    orig2.ColSpan = [2.0 2.0];
    orig2.ToolTip = 'Original frame rate of source';
    % 24 28
    % 25 28
    % 26 28
    desired1.Name = 'Desired playback rate:';
    desired1.Type = 'text';
    desired1.RowSpan = [2.0 2.0];
    desired1.ColSpan = [1.0 1.0];
    desired1.ToolTip = 'Desired frame rate during playback';
    % 32 34
    desired2.Name = '';
    desired2.Type = 'edit';
    desired2.ObjectProperty = 'desired_fps';
    desired2.RowSpan = [2.0 2.0];
    desired2.ColSpan = [2.0 2.0];
    desired2.ToolTip = 'Desired frame rate during playback';
    desired2.Mode = false;
    desired2.Tag = 'desired_fps';
    % 41 45
    % 42 45
    % 43 45
    desired_units.Name = 'frames/sec';
    desired_units.Type = 'text';
    desired_units.RowSpan = [2.0 2.0];
    desired_units.ColSpan = [3.0 3.0];
    % 48 54
    % 49 54
    % 50 54
    % 51 54
    % 52 54
    actual1.Name = 'Actual playback rate:';
    actual1.Type = 'text';
    actual1.RowSpan = [3.0 3.0];
    actual1.ColSpan = [1.0 1.0];
    actual1.ToolTip = sprintf('Average frame rate achieved during playback');
    % 58 60
    s = sprintf('%.1f frames/sec', rdivide(mtimes(this.measuredRate, plus(this.sched_showCount, this.sched_skipCount)), this.sched_showCount));
    % 60 63
    % 61 63
    actual2.Name = s;
    actual2.Type = 'text';
    actual2.RowSpan = [3.0 3.0];
    actual2.ColSpan = [2.0 2.0];
    actual2.Tag = 'actual';
    actual2.ToolTip = actual1.ToolTip;
    % 68 70
    basicItems.Type = 'group';
    basicItems.Name = 'Frame Rate';
    basicItems.LayoutGrid = [3.0 3.0];
    basicItems.RowStretch = [0.0 0.0 1.0];
    basicItems.ColStretch = [1.0 0.0 1.0];
    basicItems.RowSpan = [1.0 1.0];
    basicItems.ColSpan = [1.0 1.0];
    basicItems.Tag = 'basic_info';
    basicItems.Items = cellhorzcat(orig1, orig2, desired1, desired2, desired_units, actual1, actual2);
    % 78 88
    % 79 88
    % 80 88
    % 81 88
    % 82 88
    % 83 88
    % 84 88
    % 85 88
    % 86 88
    allowDecim.Name = 'Allow frame drop to achieve desired playback rate';
    allowDecim.Type = 'checkbox';
    allowDecim.ObjectProperty = 'sched_enable';
    allowDecim.Tag = 'allowDecim';
    allowDecim.RowSpan = [1.0 1.0];
    allowDecim.ColSpan = [1.0 3.0];
    allowDecim.ToolTip = sprintf('When enabled, frames can be dropped according to a\nschedule in order to achieve desired playback rate.');
    % 94 97
    % 95 97
    allowDecim.Mode = true;
    % 97 99
    allowDecim.ObjectMethod = 'handleButtons';
    allowDecim.MethodArgs = {'DropFramesCheckBox'};
    allowDecim.ArgDataTypes = {'string'};
    % 101 103
    if isempty(this.dialog)
        % 103 105
        decimEnable = this.sched_enable;
    else
        % 106 108
        decimEnable = getWidgetValue(this.dialog, 'allowDecim');
    end % if
    % 109 113
    % 110 113
    % 111 113
    minrate1.Name = 'Minimum refresh rate:';
    minrate1.Type = 'text';
    minrate1.RowSpan = [2.0 2.0];
    minrate1.ColSpan = [1.0 1.0];
    minrate1.ToolTip = sprintf('Increase to reduce display flicker and provide smooth playback.\nDecrease to  widen range of frame drop opportunities.');
    % 117 119
    minrate1.Visible = decimEnable;
    % 119 121
    minrate2.Name = '';
    minrate2.Type = 'edit';
    minrate2.ObjectProperty = 'sched_rateMin';
    minrate2.RowSpan = [2.0 2.0];
    minrate2.ColSpan = [2.0 2.0];
    minrate2.Mode = false;
    minrate2.Tag = 'sched_rateMin';
    minrate2.Visible = decimEnable;
    minrate2.DialogRefresh = true;
    minrate2.ToolTip = minrate1.ToolTip;
    % 130 132
    minrate_units = desired_units;
    minrate_units.Visible = decimEnable;
    % 133 137
    % 134 137
    % 135 137
    maxrate1.Name = 'Maximum refresh rate:';
    maxrate1.Type = 'text';
    maxrate1.RowSpan = [3.0 3.0];
    maxrate1.ColSpan = [1.0 1.0];
    maxrate1.ToolTip = sprintf('Decrease to reduce processor load.\nIncrease to widen range of frame drop opportunities.');
    % 141 143
    maxrate1.Visible = decimEnable;
    % 143 145
    maxrate2.Name = '';
    maxrate2.Type = 'edit';
    maxrate2.ObjectProperty = 'sched_rateMax';
    maxrate2.RowSpan = [3.0 3.0];
    maxrate2.ColSpan = [2.0 2.0];
    maxrate2.Mode = false;
    maxrate2.Tag = 'sched_rateMax';
    maxrate2.Visible = decimEnable;
    maxrate2.DialogRefresh = true;
    maxrate2.ToolTip = maxrate1.ToolTip;
    % 154 156
    maxrate_units = desired_units;
    maxrate_units.RowSpan = [3.0 3.0];
    maxrate_units.Visible = decimEnable;
    % 158 162
    % 159 162
    % 160 162
    dropsched1.Name = 'Playback schedule:';
    dropsched1.Type = 'text';
    dropsched1.RowSpan = [4.0 4.0];
    dropsched1.ColSpan = [1.0 1.0];
    dropsched1.Visible = decimEnable;
    dropsched1.ToolTip = sprintf('Number of sequential frames to show then drop\nin order to meet desired playback rate.');
    % 167 170
    % 168 170
    if eq(this.sched_showCount, 1.0)
        f1 = '';
    else
        f1 = 's';
    end % if
    if eq(this.sched_skipCount, 1.0)
        f2 = '';
    else
        f2 = 's';
    end % if
    dropsched2.Name = sprintf('Show %d frame%s, Drop %d frame%s', this.sched_showCount, f1, this.sched_skipCount, f2);
    dropsched2.Type = 'text';
    dropsched2.RowSpan = [4.0 4.0];
    dropsched2.ColSpan = [2.0 2.0];
    dropsched2.Visible = decimEnable;
    dropsched2.ToolTip = dropsched1.ToolTip;
    refrate1.Name = 'Refresh rate:';
    refrate1.Type = 'text';
    refrate1.RowSpan = [5.0 5.0];
    refrate1.ColSpan = [1.0 1.0];
    refrate1.Visible = decimEnable;
    refrate1.ToolTip = sprintf('Rate that display must be updated, based on playback\nschedule, in order to meet desired playback rate.');
    refrate2.Name = sprintf('%g frames/sec', this.sched_fps);
    refrate2.Type = 'text';
    refrate2.RowSpan = [5.0 5.0];
    refrate2.ColSpan = [2.0 2.0];
    refrate2.Visible = decimEnable;
    refrate2.ToolTip = refrate1.ToolTip;
    % 197 200
    % 198 200
    advItems.Type = 'group';
    advItems.Name = 'Frame Drop';
    advItems.LayoutGrid = [5.0 3.0];
    advItems.RowStretch = [0.0 0.0 0.0 0.0 1.0];
    advItems.ColStretch = [1.0 0.0 1.0];
    advItems.RowSpan = [2.0 2.0];
    advItems.ColSpan = [1.0 1.0];
    advItems.Items = cellhorzcat(allowDecim, minrate1, minrate2, minrate_units, maxrate1, maxrate2, maxrate_units, dropsched1, dropsched2, refrate1, refrate2);
    % 207 216
    % 208 216
    % 209 216
    % 210 216
    % 211 216
    % 212 216
    % 213 216
    % 214 216
    invisItems.Name = '';
    invisItems.Type = 'edit';
    invisItems.Visible = false;
    invisItems.ObjectProperty = 'measuredRate';
    invisItems.RowSpan = [3.0 3.0];
    invisItems.ColSpan = [1.0 1.0];
    invisItems.Mode = false;
    % 222 226
    % 223 226
    % 224 226
    allItems.Type = 'panel';
    allItems.Name = 'Frame Rate';
    allItems.LayoutGrid = [3.0 1.0];
    allItems.RowStretch = [0.0 0.0 1.0];
    allItems.ColStretch = 0.0;
    allItems.RowSpan = [1.0 1.0];
    allItems.ColSpan = [1.0 1.0];
    allItems.Tag = 'allinfo';
    allItems.Items = cellhorzcat(basicItems, advItems, invisItems);
    % 234 240
    % 235 240
    % 236 240
    % 237 240
    % 238 240
    dlgstruct = this.StdDlgProps;
    dlgstruct.Items = cellhorzcat(allItems);
    dlgstruct.PreApplyMethod = 'validate';
    dlgstruct.StandaloneButtonSet = {'OK','Apply','Cancel'};
end % function
