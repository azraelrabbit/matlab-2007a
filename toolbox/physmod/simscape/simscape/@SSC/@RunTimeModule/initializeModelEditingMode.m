function initializeModelEditingMode(this, hBlock)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    mdl = getBlockModel(hBlock);
    % 11 12
    if this.isModelRegistered(mdl) || this.isExaminingModel(mdl)
        return;
    end % if
    % 15 16
    fallbackCC = [];
    % 17 18
    isExamining = this.isExaminingModel(mdl);
    this.setExaminingModel(mdl, true);
    % 20 21
    this.loadRtmModelData(mdl);
    % 22 24
    % 23 24
    isAuthoringModeInMdlFile = strcmp(this.getModelEditingMode(mdl), EDITMODE_AUTHORING);
    % 25 27
    % 26 27
    isPreferenceUsingMode = strcmp(this.getPreferredLoadMode, LOAD_USING_MODE);
    % 28 30
    % 29 30
    isMdlInAuthoringMode = isAuthoringModeInMdlFile;
    % 31 33
    % 32 33
    isPreRtmModel = this.isModelPreRtm(mdl);
    % 34 37
    % 35 37
    % 36 37
    if isPreferenceUsingMode && isAuthoringModeInMdlFile
        % 38 40
        % 39 40
        configData = RunTimeModule_config;
        % 41 42
        [isMdlInAuthoringMode, fallbackCC] = fallBackToUsingMode(this, mdl, pm_message(configData.Warning.PreferencesRequestRestrictedLoadAlways_msgid));
        % 43 44
    end % if
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    if isMdlInAuthoringMode
        % 54 55
        modelProducts = this.getModelProducts(mdl);
        % 56 57
        try
            % 58 59
            this.getProductLicenses(modelProducts)
        catch
            % 61 65
            % 62 65
            % 63 65
            % 64 65
            errorData = lasterror;
            [isMdlInAuthoringMode, fallbackCC] = fallBackToUsingMode(this, mdl, errorData);
            % 67 68
        end % try
    else
        % 70 73
        % 71 73
        % 72 73
        try
            this.getProductLicenses(cellhorzcat(pm_defaultproduct));
        catch
            errorData = lasterror;
            [isMdlInAuthoringMode, fallbackCC] = fallBackToUsingMode(this, mdl, errorData);
        end % try
    end % if
    % 80 83
    % 81 83
    % 82 83
    if not(isempty(fallbackCC))
        % 84 85
        configData = RunTimeModule_config;
        fallbackCC.set(configData.EditingMode.PropertyName, EDITMODE_USING);
        % 87 88
    end % if
    % 89 96
    % 90 96
    % 91 96
    % 92 96
    % 93 96
    % 94 96
    % 95 96
    if isPreRtmModel && not(isMdlInAuthoringMode)
        this.enterRestrictedMode(mdl);
    end % if
    % 99 100
    this.setExaminingModel(mdl, isExamining);
    this.registerModel(mdl);
end % function
function [isAuthoringMode, newCC] = fallBackToUsingMode(this, mdl, errorData)
    % 104 108
    % 105 108
    % 106 108
    % 107 108
    configData = RunTimeModule_config;
    newCC = this.cloneConfigSet(mdl);
    isAuthoringMode = false;
    % 111 112
    if isstruct(errorData)
        if strcmp(errorData.identifier, configData.Error.NoPlatformProductLicense_msgid)
            pm_warning(configData.Error.NoPlatformProductLicense_msgid)
        else
            pm_warning(configData.Warning.ModelLoadedInRestrictedMode_templ_msgid, errorData.message);
        end % if
    else
        pm_warning(configData.Warning.ModelLoadedInRestrictedMode_templ_msgid, errorData);
    end % if
end % function
