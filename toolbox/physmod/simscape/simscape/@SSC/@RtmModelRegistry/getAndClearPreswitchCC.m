function platformCC = getAndClearPreswitchCC(this, mdl)
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
    modelIdx = this.findModelEntry(mdl);
    howManyModels = length(modelIdx);
    % 13 14
    switch howManyModels
    case 1.0
        % 16 17
        platformCC = this.modelInfo(modelIdx).modelData.preswitchCC;
        this.modelInfo(modelIdx).modelData.preswitchCC = [];
    case 0.0
        % 20 22
        % 21 22
        platformCC = [];
    otherwise
        % 24 26
        % 25 26
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, pm_sanitize_name(mdl.Name));
        % 28 29
    end % switch
end % function
