function hasDefaulted = hasModelDefaultedToUsingMode(this, mdl)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    whichEntry = this.findModelEntry(mdl);
    % 7 8
    switch length(whichEntry)
    case 0.0
        hasDefaulted = false;
    case 1.0
        hasDefaulted = this.modelInfo(whichEntry).modelData.hasDefaultedToUsingMode;
    otherwise
        configData = RtmModelRegistry_config;
        pm_error(configData.Error.MultiplyRegisteredModel_templ_msgid, mdl.Name);
    end % switch
end % function
