function items = getFrequencyUnitsWidgets(this, startrow, items)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 3.0)
        items = {};
        if lt(nargin, 2.0)
            startrow = 1.0;
        end % if
    end % if
    % 13 15
    tunable = not(isminorder(this));
    % 15 17
    fsunits_lbl.Name = 'Frequency units:';
    fsunits_lbl.Type = 'text';
    fsunits_lbl.RowSpan = horzcat(startrow, startrow);
    fsunits_lbl.ColSpan = [1.0 1.0];
    fsunits_lbl.Tag = 'FrequencyUnitsLabel';
    fsunits_lbl.Tunable = tunable;
    % 22 24
    fsunits.Type = 'combobox';
    fsunits.ObjectProperty = 'FrequencyUnits';
    fsunits.Source = this;
    fsunits.Mode = true;
    fsunits.DialogRefresh = true;
    fsunits.Entries = ctranspose(set(this, 'FrequencyUnits'));
    fsunits.RowSpan = horzcat(startrow, startrow);
    fsunits.ColSpan = [2.0 2.0];
    fsunits.Tag = fsunits.ObjectProperty;
    fsunits.Enabled = this.Enabled;
    fsunits.Tunable = tunable;
    % 34 36
    if strcmpi(this.FilterType, 'Interpolator')
        fs_lbl.Name = 'Output Fs:';
    else
        fs_lbl.Name = 'Input Fs:';
    end % if
    fs_lbl.Type = 'text';
    fs_lbl.RowSpan = horzcat(startrow, startrow);
    fs_lbl.ColSpan = [3.0 3.0];
    fs_lbl.Tag = 'InputSampleRateLabel';
    fs_lbl.ToolTip = 'Input sample rate';
    fs_lbl.Tunable = tunable;
    % 46 48
    fs.Type = 'edit';
    fs.Source = this;
    fs.Editable = true;
    fs.RowSpan = horzcat(startrow, startrow);
    fs.ColSpan = [4.0 4.0];
    fs.Tag = 'InputSampleRate';
    fs.Mode = true;
    fs.Enabled = this.Enabled;
    fs.Tunable = tunable;
    % 56 58
    if strncmpi(this.FrequencyUnits, 'normalized', 10.0)
        fs.Enabled = false;
        fs_lbl.Enabled = false;
    else
        fs.ObjectProperty = fs.Tag;
    end % if
    % 63 65
    items = cellhorzcat(items{:}, fsunits_lbl, fsunits, fs_lbl, fs);
end % function
