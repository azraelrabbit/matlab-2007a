function editingModeCallback = drive_editingmodecallback(hBlock, code)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    referenceBlock = hBlock.ReferenceBlock;
    % 8 9
    lookuptable = drive_lookup(code);
    idx = find(strcmp(lookuptable.name, pm_sanitize_name(referenceBlock)));
    if isempty(idx)
        configData = RunTimeModule_config;
        pm_error(configData.Error.CannotFindLibraryBlock_msgid, pm_sanitize_name(hBlock.Name));
    end % if
    % 15 16
    editingModeCallback = lookuptable.value{idx};
    % 17 18
end % function
