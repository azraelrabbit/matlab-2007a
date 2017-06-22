function removeBlock(this, hBlock)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    [editingMode, isLibrary] = this.getModelEditingMode(hBlock);
    % 10 11
    if isLibrary
        % 12 13
        pm_assert(this.isLibraryBlock(hBlock));
        this.getLicenseOrFail(hBlock, 'NoLicenseToRemoveLibraryBlock_templ_msgid');
    else
        % 16 18
        % 17 18
        switch editingMode
        case EDITMODE_USING
            % 20 22
            % 21 22
            configData = RunTimeModule_config;
            pm_error(configData.Error.CannotRemoveInUsingMode_msgid);
        case EDITMODE_AUTHORING
            % 25 27
            % 26 27
            this.getLicenseOrFail(hBlock, 'NoLicenseToRemoveBlock_templ_msgid');
            % 28 29
        end % switch
        % 30 32
        % 31 32
        mdl = getBlockModel(hBlock);
        [opData, mdlIdx] = this.modelRegistry.getModelOperationData(mdl);
        if eq(opData.blocksPerformingOperation, hBlock)
            opData.blocksPerformingOperation = [];
            this.modelRegistry.modelInfo(mdlIdx).modelOperation = opData;
        end % if
        % 38 39
    end % if
end % function
