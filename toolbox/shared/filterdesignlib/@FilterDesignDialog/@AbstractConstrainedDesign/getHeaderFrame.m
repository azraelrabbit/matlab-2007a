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
    ftypewidgets = getFilterTypeWidgets(this, 3.0);
    % 26 28
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(irtype_lbl, irtype, orderwidgets{:}, ftypewidgets{:});
    headerFrame.LayoutGrid = [3.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
