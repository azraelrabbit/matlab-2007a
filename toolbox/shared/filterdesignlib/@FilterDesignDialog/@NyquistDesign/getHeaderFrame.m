function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    band_lbl.Name = 'Band: ';
    band_lbl.Type = 'text';
    band_lbl.RowSpan = [1.0 1.0];
    band_lbl.ColSpan = [1.0 1.0];
    band_lbl.Tag = 'BandLabel';
    % 12 14
    band.Type = 'edit';
    band.ObjectProperty = 'Band';
    band.Source = this;
    band.Mode = true;
    band.DialogRefresh = true;
    band.RowSpan = [1.0 1.0];
    band.ColSpan = [2.0 2.0];
    band.Tag = band.ObjectProperty;
    band.Enabled = this.Enabled;
    % 22 24
    irtype_lbl.Name = 'Impulse response:';
    irtype_lbl.Type = 'text';
    irtype_lbl.RowSpan = [2.0 2.0];
    irtype_lbl.ColSpan = [1.0 1.0];
    irtype_lbl.Tag = 'ImpulseResponseLabel';
    % 28 30
    irtype.Type = 'combobox';
    irtype.RowSpan = [2.0 2.0];
    irtype.ColSpan = [2.0 2.0];
    irtype.Tag = 'ImpulseResponse';
    irtype.Enabled = this.Enabled;
    % 34 36
    try
        bandvalue = evaluatevars(this.Band);
    catch
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        bandvalue = 3.0;
    end % try
    % 44 46
    irtype.Entries = {'FIR','IIR'};
    irtype.ObjectProperty = 'ImpulseResponse';
    irtype.Source = this;
    irtype.Mode = true;
    irtype.DialogRefresh = true;
    % 50 52
    if eq(bandvalue, 2.0)
        irtype.Enabled = this.Enabled;
    else
        irtype.Enabled = false;
    end % if
    % 56 58
    ordermode_lbl.Name = 'Filter order mode:';
    ordermode_lbl.Type = 'text';
    ordermode_lbl.RowSpan = [3.0 3.0];
    ordermode_lbl.ColSpan = [1.0 1.0];
    ordermode_lbl.Tag = 'OrderModeLabel';
    % 62 64
    ordermode.Type = 'combobox';
    ordermode.ObjectProperty = 'OrderMode';
    ordermode.Source = this;
    ordermode.Mode = true;
    ordermode.DialogRefresh = true;
    ordermode.Entries = {'Minimum','Specify'};
    ordermode.RowSpan = [3.0 3.0];
    ordermode.ColSpan = [2.0 2.0];
    ordermode.Tag = ordermode.ObjectProperty;
    ordermode.Enabled = this.Enabled;
    % 73 75
    order_lbl.Name = 'Order:';
    order_lbl.Type = 'text';
    order_lbl.RowSpan = [3.0 3.0];
    order_lbl.ColSpan = [3.0 3.0];
    order_lbl.Tag = 'OrderLabel';
    % 79 81
    order.Type = 'edit';
    order.ObjectProperty = 'Order';
    order.Source = this;
    order.RowSpan = [3.0 3.0];
    order.ColSpan = [4.0 4.0];
    order.Tag = order.ObjectProperty;
    order.Enabled = this.Enabled;
    order.Mode = true;
    % 88 90
    if isminorder(this)
        order_lbl.Visible = false;
        order.Visible = false;
    end % if
    % 93 96
    % 94 96
    ftype_widgets = getFilterTypeWidgets(this, 4.0);
    % 96 98
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(band_lbl, band, irtype_lbl, irtype, ordermode_lbl, ordermode, order_lbl, order, ftype_widgets{:});
    % 100 102
    headerFrame.LayoutGrid = [5.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
