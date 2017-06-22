function dlg = getDialogSchema(hObj, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    text.Name = 'There is no dialog schema defined for this component';
    text.Type = 'text';
    % 8 9
    dlg.Items = cellhorzcat(text);
    % 10 12
    % 11 12
    switch schemaName
    case 'tab'
        dlg = [];
    otherwise
        dlg.DialogTitle = get(hObj, 'Name');
    end % switch
end % function
