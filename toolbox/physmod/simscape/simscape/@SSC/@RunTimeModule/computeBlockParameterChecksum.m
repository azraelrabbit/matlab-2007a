function checksum = computeBlockParameterChecksum(this, block)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    maskParam = this.blockGetParameterModes(block);
    % 12 13
    maskNames = block.MaskNames;
    maskValues = block.MaskValues;
    if not(isempty(maskParam))
        % 16 17
        nonEditableParamsInRestrictedMode = cellhorzcat(maskParam(strcmp(PARAM_AUTHORING, cellhorzcat(maskParam.editingMode))).maskName);
        % 18 19
        nonEditableParamsInRestrictedModeIdx = ismember(maskNames, nonEditableParamsInRestrictedMode);
        % 20 21
        nonEditableParamsInRestrictedModeValues = maskValues(nonEditableParamsInRestrictedModeIdx);
        % 22 23
        nonEditableParamsInRestrictedModeNames = maskNames(nonEditableParamsInRestrictedModeIdx);
        % 24 27
        % 25 27
        % 26 27
        [dummy, sortIdx] = sort(nonEditableParamsInRestrictedModeNames);
        checksum = pm_hash('crc', nonEditableParamsInRestrictedModeValues(sortIdx));
    else
        % 30 35
        % 31 35
        % 32 35
        % 33 35
        % 34 35
        checksum = pm_hash('crc', []);
    end % if
end % function
