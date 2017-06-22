function isPreRtm = isModelPreRtm(this, mdl)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    modelIdx = this.modelRegistry.findModelEntry(mdl);
    howManyModels = length(modelIdx);
    % 9 10
    switch howManyModels
    case 1.0
        % 12 13
        isPreRtm = this.modelRegistry.modelInfo(modelIdx).modelData.isModelPreRtm;
    case 0.0
        % 15 17
        % 16 17
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.ModelNotRegistered_templ_msgid, pm_sanitize_name(mdl.Name));
    otherwise
        % 20 22
        % 21 22
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, pm_sanitize_name(mdl.Name));
        % 24 25
    end % switch
    % 26 27
end % function
