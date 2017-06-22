function canDoIt = prepareToOpenDialog(this, hBlock)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    configData = RunTimeModule_config;
    % 9 11
    % 10 11
    if not(this.isDiagramLocked(hBlock))
        % 12 13
        if this.isLibraryBlock(hBlock)
            % 14 15
            this.getLicenseOrFail(hBlock, 'NoLicenseToModifyLibraryBlock_templ_msgid');
        else
            % 17 19
            % 18 19
            if strcmp(this.getModelEditingMode(hBlock), EDITMODE_USING)
                % 20 21
                paramModeData = this.blockGetParameterModes(hBlock);
                % 22 24
                % 23 24
                if isempty(paramModeData)
                    whichSelected = [];
                else
                    whichParamModeData = strcmp(PARAM_AUTHORING, cellhorzcat(paramModeData.editingMode));
                    authoringParamModeData = paramModeData(whichParamModeData);
                    % 29 30
                    whichSelected = cellhorzcat(authoringParamModeData.maskName);
                end % if
                % 32 33
                maskNames = hBlock.MaskNames;
                maskEnables = hBlock.MaskEnables;
                % 35 36
                [newMaskEnables, authoringParam] = turnOffSelectedEnables(maskNames, maskEnables, whichSelected);
                changedParams = getIllegallyChangedParams(this, hBlock, authoringParam);
                if not(isempty(changedParams))
                    config = RunTimeModule_config;
                    pm_error(config.Error.IllegallyChangedDlgParams_templ_msgid, changedParams);
                end % if
                % 42 43
                hBlock.MaskEnables = newMaskEnables;
            else
                % 45 48
                % 46 48
                % 47 48
                this.getLicenseOrFail(hBlock, 'NoLicenseToModifyBlock_templ_msgid');
                % 49 50
            end % if
            % 51 52
        end % if
        % 53 54
    end % if
end % function
function changedParams = getIllegallyChangedParams(this, hBlock, entriesToMatch)
    % 57 59
    % 58 59
    snapshot = this.getBlockSnapshot(hBlock);
    snapValues = snapshot.values;
    snapValues = cellhorzcat(snapValues{entriesToMatch});
    numVal = length(snapValues);
    % 63 64
    blockValues = hBlock.MaskValues;
    blockValues = cellhorzcat(blockValues{entriesToMatch});
    % 66 67
    cmp = strcmp(snapValues, blockValues);
    agree = all(cmp);
    % 69 71
    % 70 71
    if agree
        changedParams = '';
    else
        % 74 75
        maskPrompts = hBlock.MaskPrompts;
        maskPrompts = cellhorzcat(maskPrompts{entriesToMatch});
        maskPrompts = maskPrompts(not(cmp));
        changedParams = sprintf('''%s''\n', maskPrompts{:});
        % 79 80
    end % if
end % function
