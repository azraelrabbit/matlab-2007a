function headerFrame = getHeaderFrame(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    orderwidgets = getOrderWidgets(this, 1.0, true);
    ftypewidgets = getFilterTypeWidgets(this, 2.0);
    % 9 11
    nsecs_lbl.Type = 'text';
    nsecs_lbl.Name = 'Number of CIC sections:';
    nsecs_lbl.RowSpan = [4.0 4.0];
    nsecs_lbl.ColSpan = [1.0 1.0];
    nsecs_lbl.Tag = 'NumberOfSectionsLabel';
    nsecs_lbl.Tunable = true;
    % 16 18
    nsecs.Type = 'combobox';
    nsecs.Editable = true;
    nsecs.Entries = {'1','2','3','4','5','6','7','8'};
    nsecs.Source = this;
    nsecs.ObjectProperty = 'NumberOfSections';
    nsecs.RowSpan = [4.0 4.0];
    nsecs.ColSpan = [2.0 2.0];
    nsecs.Tag = 'NumberOfSections';
    nsecs.Enabled = this.Enabled;
    nsecs.Mode = true;
    nsecs.Tunable = true;
    % 28 30
    diffdelay_lbl.Type = 'text';
    diffdelay_lbl.Name = 'Differential delay:';
    diffdelay_lbl.RowSpan = [4.0 4.0];
    diffdelay_lbl.ColSpan = [3.0 3.0];
    diffdelay_lbl.Tag = 'DifferentialDelayLabel';
    diffdelay_lbl.Tunable = true;
    % 35 37
    diffdelay.Type = 'combobox';
    diffdelay.Editable = true;
    diffdelay.Entries = {'1','2'};
    diffdelay.Source = this;
    diffdelay.ObjectProperty = 'DifferentialDelay';
    diffdelay.RowSpan = [4.0 4.0];
    diffdelay.ColSpan = [4.0 4.0];
    diffdelay.Tag = 'DifferentialDelay';
    diffdelay.Enabled = this.Enabled;
    diffdelay.Mode = true;
    diffdelay.Tunable = true;
    % 47 49
    headerFrame.Type = 'group';
    headerFrame.Name = 'Filter specifications';
    headerFrame.Items = cellhorzcat(orderwidgets{:}, ftypewidgets{:}, nsecs_lbl, nsecs, diffdelay_lbl, diffdelay);
    % 51 53
    headerFrame.LayoutGrid = [4.0 4.0];
    headerFrame.ColStretch = [0.0 1.0 0.0 1.0];
    headerFrame.Tag = 'FilterSpecsGroup';
end % function
