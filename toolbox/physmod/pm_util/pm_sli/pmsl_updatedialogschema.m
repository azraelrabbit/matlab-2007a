function schema = pmsl_updatedialogschema(schema, widget, path)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(path)
        schema = widget;
    else
        schema.Items{path(1.0)} = pmsl_updatedialogschema(schema.Items{path(1.0)}, widget, path(2.0:end));
    end % if
    % 12 13
end % function
