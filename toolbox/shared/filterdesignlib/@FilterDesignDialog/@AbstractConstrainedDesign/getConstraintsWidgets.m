function items = getConstraintsWidgets(this, type, row)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    constraints_lbl.Name = sprintf('%s constraints:', type);
    constraints_lbl.Type = 'text';
    constraints_lbl.RowSpan = horzcat(row, row);
    constraints_lbl.ColSpan = [1.0 1.0];
    constraints_lbl.Tag = sprintf('%sConstraintsLabel', type);
    % 12 14
    if strcmpi(type, 'Frequency')
        allconstraints = getValidFreqConstraints(this);
    else
        allconstraints = getValidMagConstraints(this);
    end % if
    % 18 20
    constraints.Type = 'combobox';
    constraints.Entries = allconstraints;
    constraints.ObjectProperty = sprintf('%sConstraints', type);
    constraints.Source = this;
    constraints.Mode = true;
    constraints.DialogRefresh = true;
    constraints.RowSpan = horzcat(row, row);
    constraints.ColSpan = [2.0 4.0];
    constraints.Tag = constraints.ObjectProperty;
    constraints.Enabled = this.Enabled;
    % 29 31
    if isminorder(this)
        constraints_lbl.Visible = false;
        constraints.Visible = false;
    end % if
    % 34 36
    items = cellhorzcat(constraints_lbl, constraints);
end % function
