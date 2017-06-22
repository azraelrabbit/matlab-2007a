function items = getBottomWidgets(this, startrow, items)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 3.0)
        items = {};
        if lt(nargin, 2.0)
            startrow = 1.0;
        end % if
    end % if
    % 14 15
    if strcmpi(this.OperatingMode, 'matlab')
        varname.Type = 'edit';
        varname.Name = 'Save variable as: ';
        varname.RowSpan = horzcat(startrow, startrow);
        varname.ColSpan = [1.0 1.0];
        varname.ObjectProperty = 'VariableName';
        varname.Tag = 'VariableName';
        varname.Source = this;
        varname.Mode = true;
        varname.Enabled = this.Enabled;
        % 25 26
        items = cellhorzcat(items{:}, varname);
    end % if
    % 28 29
    fvtool.Type = 'pushbutton';
    fvtool.Name = '   View Filter Response   ';
    fvtool.RowSpan = horzcat(startrow, startrow);
    fvtool.ColSpan = [3.0 3.0];
    fvtool.ObjectMethod = 'export';
    fvtool.Tag = 'fvtool';
    fvtool.MethodArgs = cellhorzcat('%dialog', 'launchfvtool', true, 'visualizing the design');
    fvtool.ArgDataTypes = {'handle','string','bool','string'};
    fvtool.Source = this;
    fvtool.ToolTip = 'Launch FVTool to analyze the designed filter';
    fvtool.Enabled = this.Enabled;
    % 40 41
    items = cellhorzcat(items{:}, fvtool);
end % function
