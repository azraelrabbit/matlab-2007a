function main = getMainFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if not(strcmpi(this.OperatingMode, 'simulink'))
        % 8 10
        items = getFrequencyUnitsWidgets(this, 1.0);
        % 10 12
        fracdelay_lbl.Name = 'Fractional delay: ';
        fracdelay_lbl.Type = 'text';
        fracdelay_lbl.RowSpan = [2.0 2.0];
        fracdelay_lbl.ColSpan = [1.0 1.0];
        fracdelay_lbl.Tag = 'FracDelayLabel';
        % 16 18
        fracdelay.Type = 'edit';
        fracdelay.ObjectProperty = 'FracDelay';
        fracdelay.Source = this;
        fracdelay.Mode = true;
        fracdelay.RowSpan = [2.0 2.0];
        fracdelay.ColSpan = [2.0 2.0];
        fracdelay.Tag = fracdelay.ObjectProperty;
        fracdelay.Enabled = this.Enabled;
        % 25 27
        items = cellhorzcat(items{:}, fracdelay_lbl, fracdelay);
    else
        items = {};
    end % if
    % 30 32
    orderwidgets = getOrderWidgets(this, 3.0, false);
    % 32 34
    order = orderwidgets{2.0};
    order.Type = 'combobox';
    order.Entries = {'1','2','3','4','5','6'};
    order.Editable = true;
    % 37 39
    orderwidgets{2.0} = order;
    % 39 41
    items = cellhorzcat(items{:}, orderwidgets{:});
    % 41 43
    main.Type = 'group';
    main.Name = 'Filter specifications';
    main.Items = items;
    main.LayoutGrid = [3.0 4.0];
    main.ColStretch = [0.0 1.0 0.0 1.0];
    main.Tag = 'MainGroup';
end % function
