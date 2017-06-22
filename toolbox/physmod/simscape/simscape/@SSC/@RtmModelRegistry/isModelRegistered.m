function isRegistered = isModelRegistered(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    whichEntry = this.findModelEntry(mdl);
    % 7 8
    switch length(whichEntry)
    case 0.0
        isRegistered = false;
    case 1.0
        isRegistered = this.modelInfo(whichEntry).modelData.registered;
    otherwise
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, mdl.Name);
    end % switch
end % function
