function mainFrame = getMainFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    ftype_lbl.Name = 'Filter type:';
    ftype_lbl.Type = 'text';
    ftype_lbl.RowSpan = [1.0 1.0];
    ftype_lbl.ColSpan = [1.0 1.0];
    ftype_lbl.Tag = 'FilterTypeLabel';
    % 12 14
    ftype.Type = 'combobox';
    ftype.Entries = {'Decimator','Interpolator'};
    ftype.ObjectProperty = 'FilterType';
    ftype.Source = this;
    ftype.Mode = true;
    ftype.DialogRefresh = true;
    ftype.RowSpan = [1.0 1.0];
    ftype.ColSpan = [2.0 2.0];
    ftype.Tag = ftype.ObjectProperty;
    ftype.Enabled = this.Enabled;
    % 23 25
    factor_lbl.Name = 'Factor:';
    factor_lbl.Type = 'text';
    factor_lbl.RowSpan = [1.0 1.0];
    factor_lbl.ColSpan = [3.0 3.0];
    factor_lbl.Tag = 'FactorLabel';
    % 29 31
    factor.Type = 'edit';
    factor.ObjectProperty = 'Factor';
    factor.Source = this;
    factor.Mode = true;
    factor.RowSpan = [1.0 1.0];
    factor.ColSpan = [4.0 4.0];
    factor.Tag = factor.ObjectProperty;
    factor.Enabled = this.Enabled;
    % 38 40
    ddelay_lbl.Type = 'text';
    ddelay_lbl.Name = 'Differential delay: ';
    ddelay_lbl.RowSpan = [2.0 2.0];
    ddelay_lbl.ColSpan = [1.0 1.0];
    ddelay_lbl.Tag = 'DifferentialDelayLabel';
    % 44 46
    ddelay.Type = 'edit';
    ddelay.ObjectProperty = 'DifferentialDelay';
    ddelay.Tag = 'DifferentialDelay';
    ddelay.Source = this;
    ddelay.Mode = true;
    ddelay.RowSpan = [2.0 2.0];
    ddelay.ColSpan = [2.0 2.0];
    ddelay.Enabled = this.Enabled;
    % 53 55
    items = cellhorzcat(ftype_lbl, ftype, factor_lbl, factor, ddelay_lbl, ddelay);
    % 55 57
    items = getFrequencyUnitsWidgets(this, 3.0, items);
    % 57 59
    [fpass_lbl, fpass] = getWidgetSchema(this, 'Fpass', 'Passband edge: ', 'edit', 4.0, 1.0);
    % 59 61
    items = cellhorzcat(items{:}, fpass_lbl, fpass);
    % 61 63
    items = getMagnitudeUnitsWidgets(this, 5.0, items);
    % 63 65
    [fstop_lbl, fstop] = getWidgetSchema(this, 'Astop', 'Stopband attenuation: ', 'edit', 6.0, 1.0);
    % 65 67
    items = cellhorzcat(items{:}, fstop_lbl, fstop);
    % 67 69
    mainFrame.Type = 'group';
    mainFrame.Name = 'Filter specifications';
    mainFrame.Items = items;
    mainFrame.LayoutGrid = [3.0 4.0];
    mainFrame.ColStretch = [0.0 1.0 0.0 1.0];
    mainFrame.Tag = 'MainGroup';
end % function
