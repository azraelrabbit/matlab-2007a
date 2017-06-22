function isUnmodified = isBlockLinkUnmodified(this, block, BlockId)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if lt(nargin, 3.0)
        % 9 11
        configData = RunTimeModule_config;
        BlockId = configData.BlockId;
        % 12 14
    end
    % 14 16
    isUnmodified = false;
    for modParam=BlockId.Unmodified.Match
        % 17 19
        isUnmodified = isUnmodified || (block.isprop(modParam.Param) && strcmp(block.get(modParam.Param), modParam.Value));
        % 19 21
        if isUnmodified
            break
        else
            % 23 25
        end
        % 25 27
    end % for
    % 27 29
end
