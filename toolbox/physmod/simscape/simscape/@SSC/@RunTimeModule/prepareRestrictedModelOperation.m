function prepareRestrictedModelOperation(this, block, operation_id)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    trace;
    % 12 14
    if ~(this.isLibraryBlock(block))
        % 14 27
        % 15 27
        % 16 27
        % 17 27
        % 18 27
        % 19 27
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        if this.blockIsTriggeringModelOperation(block)
            % 27 29
            mdl = getBlockModel(block);
            editingMode = this.getModelEditingMode(mdl);
            % 30 37
            % 31 37
            % 32 37
            % 33 37
            % 34 37
            % 35 37
            this.setBlockCheckedModelOperation(block, operation_id);
            % 37 43
            % 38 43
            % 39 43
            % 40 43
            % 41 43
            if ~(this.validatePlatformLicense)
                cannotPerformOperation(operation_id, 'NoPlatformProductLicense_msgid');
            end
            % 45 50
            % 46 50
            % 47 50
            % 48 50
            this.validateLibraryLinks(mdl);
            % 50 57
            % 51 57
            % 52 57
            % 53 57
            % 54 57
            % 55 57
            if strcmp(operation_id, 'compile') && strcmp(editingMode, EDITMODE_AUTHORING)
                this.setBlockCheckedModelOperation(block, operation_id);
                return
            end
            % 60 65
            % 61 65
            % 62 65
            % 63 65
            products = this.determineModelProducts(mdl);
            % 65 70
            % 66 70
            % 67 70
            % 68 70
            actualTopologyChecksum = this.computeModelTopologyChecksum(mdl);
            actualParameterChecksum = this.computeModelParameterChecksum(mdl);
            % 71 73
            switch editingMode
            case EDITMODE_USING
                % 74 77
                % 75 77
                [cachedTopologyChecksum, cachedParameterChecksum] = this.getCachedModelChecksum(mdl);
                if ne(cachedTopologyChecksum, actualTopologyChecksum)
                    cannotPerformOperation(operation_id, 'IllegallyChangedTopology_msgid');
                end
                % 80 88
                % 81 88
                % 82 88
                % 83 88
                % 84 88
                % 85 88
                % 86 88
                if ne(actualParameterChecksum, cachedParameterChecksum)
                    blocksToSnapshot = this.getBlocksToSnapshot(mdl);
                    blockNames = '';
                    blockObjects = get_param(blocksToSnapshot, 'Object');
                    if ~(iscell(blockObjects))
                        blockObjects = cellhorzcat(blockObjects);
                    end
                    for idx=1.0:numel(blocksToSnapshot)
                        aBlock = blockObjects{idx};
                        hasSnapshotComparisonFailed = ~(this.compareBlockToSnapshot(aBlock));
                        if hasSnapshotComparisonFailed
                            blockNames = sprintf(horzcat(blockNames, '''%s''\n'), sanitizeName(aBlock.Name));
                        end
                    end % for
                    % 101 104
                    % 102 104
                    cannotPerformOperation(operation_id, 'IllegallyChangedBlockParameters_templ_msgid', blockNames);
                end
            case EDITMODE_AUTHORING
                % 106 110
                % 107 110
                % 108 110
                this.getProductLicenses(products);
                % 110 112
            end
            % 112 114
            this.storeModelProducts(mdl, products);
            this.storeCachedModelChecksum(mdl, actualTopologyChecksum, actualParameterChecksum);
            this.writeCachedDataToModel(mdl);
            % 116 118
            if strcmp(operation_id, 'presave')
                % 118 120
                SSC.SimscapeCC.preSave_pruneProducts(mdl, products);
                % 120 122
            end
            % 122 125
            % 123 125
        end
    else
        % 126 129
        % 127 129
        this.getLicenseOrFail(block, 'NoLicenseToSaveLibraryBlock_templ_msgid');
        % 129 131
    end
end
function cannotPerformOperation(operation_id, explanation_id, varargin)
    configData = RunTimeModule_config;
    errorData = configData.Error;
    restrictedOperation = configData.ModelOp.Label;
    % 136 138
    explanation_msgid = errorData.(explanation_id);
    operation_msgid = restrictedOperation.(operation_id);
    pm_error(errorData.IllegalUsingModeOperation_templ_msgid, pm_message(operation_msgid), pm_message(explanation_msgid, varargin{:}));
    % 140 142
end
