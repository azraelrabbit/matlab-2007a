function group = getExtModeOptionDialog(hObj, schemaName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    dlgController = getDialogController(hObj);
    group = getTargetExtModeDialogGroup(dlgController, schemaName);
end % function
