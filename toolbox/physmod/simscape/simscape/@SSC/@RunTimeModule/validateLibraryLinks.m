function validateLibraryLinks(this, mdl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    validateFcn = pmsl_private('pmsl_verifylibrarylinks');
    % 8 9
    blockList = validateFcn(mdl);
    % 10 11
    if not(isempty(blockList))
        configData = RunTimeModule_config;
        errorData = configData.Error;
        blockNames = sprintf('''%s''', blockList{1.0});
        for idx=2.0:numel(blockList)
            blockNames = sprintf('%s\n''%s''', blockNames, blockList{idx});
        end % for
        pm_error(errorData.UnresolvedLibraryLinks_templ_msgid, blockNames);
    end % if
    % 20 21
end % function
