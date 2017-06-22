function areTheSame = compareBlockToSnapshot(this, block)
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
    areTheSame = true;
    maskParam = this.blockGetParameterModes(block);
    % 13 14
    if not(isempty(maskParam))
        % 15 16
        authoringModeParams = cellhorzcat(maskParam(strcmp(PARAM_AUTHORING, cellhorzcat(maskParam.editingMode))).maskName);
        maskNames = block.MaskNames;
        authoringIdx = ismember(maskNames, authoringModeParams);
        % 19 21
        % 20 21
        maskValues = block.MaskValues;
        authoringParams = maskValues(authoringIdx);
        % 23 25
        % 24 25
        snapshot = this.getBlockSnapshot(block);
        authoringSnapshot = snapshot.values(authoringIdx);
        % 27 29
        % 28 29
        areTheSame = all(strcmp(authoringSnapshot, authoringParams));
        % 30 31
    end % if
end % function
