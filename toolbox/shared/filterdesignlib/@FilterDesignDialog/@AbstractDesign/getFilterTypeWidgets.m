function filterTypeWidgets = getFilterTypeWidgets(this, row)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    ftype_lbl.Name = 'Filter type:';
    ftype_lbl.Type = 'text';
    ftype_lbl.RowSpan = horzcat(row, row);
    ftype_lbl.ColSpan = [1.0 1.0];
    ftype_lbl.Tag = 'FilterTypeLabel';
    % 12 14
    ftypes = ctranspose(set(this, 'FilterType'));
    if strcmpi(this.OperatingMode, 'simulink') || strcmpi(this.ImpulseResponse, 'iir')
        ftypes(end) = [];
    end % if
    % 17 19
    ftype.Type = 'combobox';
    ftype.Entries = ftypes;
    ftype.ObjectProperty = 'FilterType';
    ftype.Source = this;
    ftype.Mode = true;
    ftype.DialogRefresh = true;
    ftype.RowSpan = horzcat(row, row);
    ftype.ColSpan = [2.0 2.0];
    ftype.Tag = ftype.ObjectProperty;
    ftype.Enabled = this.Enabled;
    % 28 30
    if not(allowsMultirate(this))
        ftype.Enabled = false;
    end % if
    % 32 35
    % 33 35
    switch lower(this.FilterType)
    case {'decimator','interpolator'}
        str = horzcat(this.FilterType(1.0:minus(end, 2.0)), 'ion');
        [factor_lbl, factor] = getWidgetSchema(this, 'Factor', sprintf('%s factor: ', str), 'edit', row, 3.0);
        % 38 40
        filterTypeWidgets = cellhorzcat(ftype_lbl, ftype, factor_lbl, factor);
    case {'sample-rate converter'}
        [ifactor_lbl, ifactor] = getWidgetSchema(this, 'Factor', 'Interpolation factor: ', 'edit', row, 3.0);
        % 42 44
        [dfactor_lbl, dfactor] = getWidgetSchema(this, 'SecondFactor', 'Decimation factor: ', 'edit', plus(row, 1.0), 3.0);
        % 44 46
        filterTypeWidgets = cellhorzcat(ftype_lbl, ftype, ifactor_lbl, ifactor, dfactor_lbl, dfactor);
    otherwise
        % 47 49
        filterTypeWidgets = cellhorzcat(ftype_lbl, ftype);
    end % switch
end % function
