function addBlock(this, hBlock, isLoading)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if lt(nargin, 2.0)
        isLoading = false;
    end % if
    % 10 14
    % 11 14
    % 12 14
    if this.isExaminingModel(this.getBlockDiagram(hBlock))
        % 14 16
        return;
    end % if
    % 17 19
    [editingMode, isLibrary] = this.getModelEditingMode(hBlock);
    % 19 21
    if isLibrary
        % 21 23
        pm_assert(this.isLibraryBlock(hBlock));
        this.getLicenseOrFail(hBlock, 'NoLicenseToAddLibraryBlock_templ_msgid');
    else
        % 25 28
        % 26 28
        if isLoading
            % 28 30
            switch editingMode
            case EDITMODE_USING
                % 31 38
                % 32 38
                % 33 38
                % 34 38
                % 35 38
                % 36 38
                if not(this.isModelPreRtm(this.getBlockDiagram(hBlock)))
                    if not(this.snapshotBlock(hBlock))
                        % 39 41
                        configData = RunTimeModule_config;
                        pm_error(configData.Error.CannotSnapshotBlocks_templ_msgid, sanitizeName(hBlock.Name));
                        % 42 44
                    end % if
                end % if
            case EDITMODE_AUTHORING
                % 46 49
                % 47 49
                product = this.determineBlockProduct(hBlock);
                % 49 51
            end % switch
        else
            % 52 55
            % 53 55
            switch editingMode
            case EDITMODE_USING
                % 56 59
                % 57 59
                configData = RunTimeModule_config;
                pm_error(configData.Error.CannotAddInUsingMode_msgid);
            case EDITMODE_AUTHORING
                % 61 64
                % 62 64
                this.getLicenseOrFail(hBlock, 'NoLicenseToAddBlock_templ_msgid');
                % 64 67
                % 65 67
                this.registerModel(this.getBlockDiagram(hBlock));
                % 67 69
            end % switch
            % 69 71
        end % if
        % 71 73
    end % if
