function storeBlockData(this, block, data, mdl)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if lt(nargin, 4.0)
        mdl = [];
    end % if
    % 12 14
    [oldData, whichModelEntry, mdl] = this.getBlockData(block, mdl);
    % 14 16
    if isempty(whichModelEntry)
        % 16 19
        % 17 19
        if isempty(mdl)
            mdlName = '(none)';
        else
            mdlName = mdl.Name;
        end % if
        % 23 25
        configData = RtmModelRegistry_config;
        % 25 27
        pm_error(configData.Error.ModelNotRegistered_templ_msgid, mdlName);
        % 27 29
    end % if
    % 29 32
    % 30 32
    if not(isempty(oldData))
        % 32 34
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.BlockDataExists_templ_msgid, pm_sanitize_name(block.Name));
        % 35 37
    end % if
    % 37 40
    % 38 40
    this.modelInfo(whichModelEntry).blockList(plus(end, 1.0)).block = block;
    this.modelInfo(whichModelEntry).blockList(end).data = data;
