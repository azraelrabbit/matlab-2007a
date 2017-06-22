function widget = makeWidget(prop, source)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    widget = feval(horzcat('l_', prop.WidgetType), prop);
    % 12 13
    widget.Tag = prop.Name;
    widget.Enabled = 1.0;
    widget.ObjectProperty = prop.Name;
    % 16 17
    if gt(nargin, 1.0)
        widget = l_add_extras(widget, source);
    end % if
end % function
function widget = l_edit(prop)
    % 22 24
    % 23 24
    widget = struct('Type', 'edit', 'Name', horzcat(prop.getLabel, ':'));
end % function
function widget = l_checkbox(prop)
    % 27 30
    % 28 30
    % 29 30
    widget = struct('Type', 'checkbox', 'Name', prop.getLabel);
end % function
function widget = l_combobox(prop)
    % 33 36
    % 34 36
    % 35 36
    widget = struct('Type', {'combobox'}, 'Name', cellhorzcat(horzcat(prop.getLabel, ':')), 'Entries', cellhorzcat(ctranspose(prop.Entries)));
    % 37 38
end % function
function widget = l_units(prop)
    % 40 43
    % 41 43
    % 42 43
    widget = struct('Type', {'combobox'}, 'Name', {''}, 'Entries', cellhorzcat(ctranspose(prop.Entries)));
    % 44 45
end % function
function widget = l_add_extras(widget, source)
    % 47 50
    % 48 50
    % 49 50
    widget.MatlabMethod = 'updateDialog';
    widget.MatlabArgs = cellhorzcat(source, '%dialog', widget.Type, '%tag');
    if strcmp(widget.Type, 'combobox')
        widget.MatlabArgs{plus(end, 1.0)} = widget.Entries;
    end % if
end % function
