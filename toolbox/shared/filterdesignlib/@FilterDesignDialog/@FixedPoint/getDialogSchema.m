function dlg = getDialogSchema(this, dummy)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    items = getDialogSchemaStruct(this);
    % 8 10
    dlg.DialogTitle = 'Data types';
    dlg.Items = cellhorzcat(items);
end % function
