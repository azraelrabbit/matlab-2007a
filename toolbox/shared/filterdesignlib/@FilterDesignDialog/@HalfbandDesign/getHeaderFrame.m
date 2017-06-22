function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    irtype_lbl.Name = 'Impulse response:';
    irtype_lbl.Type = 'text';
    irtype_lbl.RowSpan = [1.0 1.0];
    irtype_lbl.ColSpan = [1.0 1.0];
    irtype_lbl.Tag = 'ImpulseResponseLabel';
    % 12 14
    irtype.Type = 'combobox';
    irtype.Entries = {'FIR','IIR'};
    irtype.ObjectProperty = 'ImpulseResponse';
    irtype.Source = this;
    irtype.Mode = true;
    irtype.DialogRefresh = true;
    irtype.RowSpan = [1.0 1.0];
    irtype.ColSpan = [2.0 2.0];
    irtype.Tag = irtype.ObjectProperty;
    irtype.Enabled = this.Enabled;
    % 23 25
    orderwidgets = getOrderWidgets(this, 2.0, true);
    % 25 27
    ftype_lbl.Name = 'Filter type:';
    ftype_lbl.Type = 'text';
    ftype_lbl.RowSpan = [3.0 3.0];
    ftype_lbl.ColSpan = [1.0 1.0];
    ftype_lbl.Tag = 'FilterTypeLabel';
    % 31 33
    ftypes = ctranspose(set(this, 'FilterType'));
    % 33 35
    ftype.Type = 'combobox';
    ftype.Entries = ftypes(1.0:3.0);
    ftype.ObjectProperty = 'FilterType';
    ftype.Source = this;
    ftype.Mode = true;
    ftype.DialogRefresh = true;
    ftype.RowSpan = [3.0 3.0];
    ftype.ColSpan = [2.0 2.0];
    ftype.Tag = ftype.ObjectProperty;
    ftype.Enabled = this.Enabled;
    % 44 46
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(irtype_lbl, irtype, orderwidgets{:}, ftype_lbl, ftype);
    headerFrame.LayoutGrid = [3.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
