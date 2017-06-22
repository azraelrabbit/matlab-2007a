function success = storeModelBlocksSnapshot(this, hModel)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    success = true;
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    blockList = this.getBlocksToSnapshot(hModel);
    numBlocks = numel(blockList);
    blockObjects = get_param(blockList, 'Object');
    if not(iscell(blockObjects))
        blockObjects = cellhorzcat(blockObjects)
    end
    errorBlocks = '';
    for idx=1.0:numBlocks
        aBlock = blockObjects{idx};
        if not(this.snapshotBlock(aBlock))
            % 24 26
            success = false;
            errorBlocks = horzcat(errorBlocks, sprintf('%s\n', sanitizeName(aBlock.Name)));
            % 27 29
            break
            % 29 31
        end
        % 31 33
    end % for
    % 33 35
    if not(success)
        % 35 37
        configData = RunTimeModule_config;
        pm_error(configData.Error.CannotSnapshotBlocks_templ_msgid, errorBlocks);
        % 38 40
    end
end
