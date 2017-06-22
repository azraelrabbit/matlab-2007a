function dlg = getDialogSchema(hObj, schemaName)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmp(schemaName, 'tab')
        dlg.Name = get(hObj, 'Name');
        dlg.nTabs = 0.0;
        dlg.Tabs = [];
    end % if
end % function
