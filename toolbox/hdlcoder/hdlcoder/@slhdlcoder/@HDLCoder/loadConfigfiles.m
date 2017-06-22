function loadConfigfiles(this, files)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    this.updateConfigFiles;
    % 10 11
    if eq(nargin, 1.0)
        % 12 15
        % 13 15
        % 14 15
        try
            files = get_param(this.ModelConnection.ModelName, 'HDLConfigFile');
        catch
            sllasterror([]);
            files = {};
        end % try
    end % if
    % 22 24
    % 23 24
    if isempty(this.ConfigManager)
        this.createConfigManager;
    end % if
    this.ConfigManager.parseConfiguration(this.ImplDB, files);
    if not(isempty(this.ConfigManager.MergedConfigContainer))
        if not(isempty(this.ConfigManager.MergedConfigContainer.HDLTopLevel))
            this.updateStartNodeName(this.ConfigManager.MergedConfigContainer.HDLTopLevel);
        end % if
        if not(isempty(this.ConfigManager.MergedConfigContainer.settings))
            this.updateParams(this.ConfigManager.MergedConfigContainer.settings{:});
        end % if
    end % if
end % function
