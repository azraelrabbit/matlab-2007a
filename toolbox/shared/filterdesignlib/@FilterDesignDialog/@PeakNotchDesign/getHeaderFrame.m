function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    rtype_lbl.Name = 'Response:';
    rtype_lbl.Type = 'text';
    rtype_lbl.RowSpan = [1.0 1.0];
    rtype_lbl.ColSpan = [1.0 1.0];
    rtype_lbl.Tag = 'ResponseLabel';
    rtype_lbl.Tunable = true;
    % 13 15
    rtype.Type = 'combobox';
    rtype.Entries = {'Peak','Notch'};
    rtype.ObjectProperty = 'ResponseType';
    rtype.Source = this;
    rtype.Mode = true;
    rtype.DialogRefresh = true;
    rtype.RowSpan = [1.0 1.0];
    rtype.ColSpan = [2.0 2.0];
    rtype.Tag = rtype.ObjectProperty;
    rtype.Enabled = this.Enabled;
    rtype.Tunable = true;
    % 25 27
    [order_lbl, order] = getOrderWidgets(this, 2.0, false);
    % 27 29
    order_lbl.RowSpan = [1.0 1.0];
    order_lbl.ColSpan = [3.0 3.0];
    order.RowSpan = [1.0 1.0];
    order.ColSpan = [4.0 4.0];
    % 32 34
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(rtype_lbl, rtype, order_lbl, order);
    headerFrame.LayoutGrid = [3.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
