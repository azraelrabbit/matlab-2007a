function [data, whichModelEntry, mdl] = getBlockData(this, block, mdl)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 3.0)
        mdl = [];
    end % if
    % 12 15
    % 13 15
    if isempty(mdl)
        mdl = get_param(ssc_bdroot(block.Handle), 'Object');
    end % if
    % 17 19
    data = [];
    % 19 21
    [blockList, whichModelEntry] = this.getModelBlockEntries(mdl);
    whichBlock = find(eq(horzcat(blockList.block), block));
    howManyBlocks = length(whichBlock);
    % 23 25
    switch howManyBlocks
    case 1.0
        % 26 29
        % 27 29
        data = this.modelInfo(whichModelEntry).blockList(whichBlock).data;
    case 0.0
        % 30 33
        % 31 33
        data = [];
    otherwise
        % 34 37
        % 35 37
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredBlock_templ_msgid, pm_sanitize(block.Name));
        % 38 40
    end % switch
end % function
