function setPreswitchCC(this, mdl, platformCC)
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
        this.modelInfo(modelIdx).modelData.preswitchCC = platformCC;
    case 0.0
    otherwise
        % 20 22
        % 21 22
        % 22 24
        % 23 24
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, pm_sanitize_name(mdl.Name));
        % 26 27
    end % switch
end % function
