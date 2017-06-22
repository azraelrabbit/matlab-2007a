function widget = makeWidget(prop, hController, source)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    widget = feval(horzcat('l_', prop.WidgetType), prop);
    widget.Tag = prop.Name;
    widget.Enabled = 1.0;
    widget.ObjectProperty = prop.Name;
    % 16 18
    % 17 18
    if isfield(prop, 'MatlabMethod') && not(isempty(prop.MatlabMethod))
        pm_assert(false, 'Widget has MatlabMethod set');
        widget.Mode = 1.0;
        widget.MatlabMethod = prop.MatlabMethod;
        widget.MatlabArgs = cellhorzcat(hController, '%dialog', widget.Tag, '');
    end % if
    % 24 25
    if gt(nargin, 2.0)
        widget = l_add_extras(widget, source);
    end % if
end % function
function widget = l_edit(prop)
    % 30 32
    % 31 32
    widget = struct('Type', 'edit', 'Name', horzcat(prop.getLabel, ':'));
end % function
function widget = l_checkbox(prop)
    % 35 38
    % 36 38
    % 37 38
    widget = struct('Type', 'checkbox', 'Name', prop.getLabel);
end % function
function widget = l_combobox(prop)
    % 41 44
    % 42 44
    % 43 44
    widget = struct('Type', {'combobox'}, 'Name', cellhorzcat(horzcat(prop.getLabel, ':')), 'Entries', cellhorzcat(ctranspose(prop.Entries)));
    % 45 46
end % function
function widget = l_units(prop)
    % 48 51
    % 49 51
    % 50 51
    widget = struct('Type', {'combobox'}, 'Name', {''}, 'Entries', cellhorzcat(ctranspose(prop.Entries)));
    % 52 53
end % function
function widget = l_add_extras(widget, source)
    % 55 58
    % 56 58
    % 57 58
    widget.MatlabMethod = 'updateDialog';
    widget.MatlabArgs = cellhorzcat(source, '%dialog', widget.Type, '%tag');
    if strcmp(widget.Type, 'combobox')
        widget.MatlabArgs{plus(end, 1.0)} = widget.Entries;
    end % if
end % function
