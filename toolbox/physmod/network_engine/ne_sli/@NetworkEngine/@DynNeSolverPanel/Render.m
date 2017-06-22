function [retVal, schema] = Render(hThis, schema)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    retVal = true;
    % 15 16
    [retval, schema] = hThis.renderChildren();
    schema = schema{1.0};
    % 18 40
    % 19 40
    % 20 40
    % 21 40
    % 22 40
    % 23 40
    % 24 40
    % 25 40
    % 26 40
    % 27 40
    % 28 40
    % 29 40
    % 30 40
    % 31 40
    % 32 40
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
end % function
function [widget, path, status] = l_get_widget(schema, type, name)
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    widget = [];
    path = [];
    status = false;
    % 54 56
    % 55 56
    if isfield(schema, 'Type') && isfield(schema, 'Name')
        if isequal(schema.Type, type) && isequal(schema.Name, name)
            widget = schema;
            path = [];
            status = true;
        end % if
    end % if
    % 63 65
    % 64 65
    if not(status) && isfield(schema, 'Items')
        n = length(schema.Items);
        for i=1.0:n
            [widget, path, status] = l_get_widget(schema.Items{i}, type, name);
            if status
                % 70 71
                path = horzcat(path, i);
                break
            end % if
        end % for
    end % if
    % 76 77
end % function
function widget = l_connect_to_checkbox(checkBox, widget)
    % 79 85
    % 80 85
    % 81 85
    % 82 85
    % 83 85
    % 84 85
    widget.Enabled = checkBox.Value;
    checkBoxSource = checkBox.Source;
    % 87 88
    checkBoxSource.buddyItemsTags{plus(end, 1.0)} = widget.Tag;
    checkBoxSource.ResolveBuddyTags = true;
    % 90 91
end % function
function newSchema = l_update_schema(schema, widget, path)
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    % 97 98
    if isempty(path)
        newSchema = widget;
    else
        newSchema = schema;
        newSchema.Items{path(1.0)} = l_update_schema(schema.Items{path(1.0)}, widget, path(2.0:end));
    end % if
    % 104 105
end % function
