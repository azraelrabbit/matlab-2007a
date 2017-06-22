function dlg = getCommonOptionDialog(hObj, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    dlgController = getDialogController(hObj);
    dlg = getTargetSoftwareDialogGroup(dlgController, schemaName);
end % function
