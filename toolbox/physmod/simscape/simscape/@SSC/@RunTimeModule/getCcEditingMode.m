function editingMode = getCcEditingMode(this, ccObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    configData = RunTimeModule_config;
    % 9 10
    if not(isempty(ccObj))
        editingMode = get(ccObj, configData.EditingMode.PropertyName);
    else
        pm_error(configData.Error.CannotGetEditingModeNoSource_msgid);
    end % if
end % function
