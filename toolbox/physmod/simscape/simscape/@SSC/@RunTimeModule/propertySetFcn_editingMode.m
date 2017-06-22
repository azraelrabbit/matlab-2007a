function allowedMode = propertySetFcn_editingMode(sourceObject, requestedMode)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    this = SSC.RunTimeModule.getInstance;
    % 14 16
    hModel = sourceObject.getBlockDiagram;
    % 16 18
    if isempty(this) || isempty(hModel) || not(this.isModelRegistered(hModel))
        % 18 21
        % 19 21
        allowedMode = requestedMode;
        return;
        % 22 24
    end % if
    % 24 27
    % 25 27
    currentMode = this.getCcEditingMode(sourceObject);
    % 27 29
    if this.isDiagramLocked(hModel) && not(strcmp(currentMode, requestedMode))
        % 29 31
        configData = RunTimeModule_config;
        pm_error(configData.Error.CannotChangeLockedMode_templ_msgid, pm_message(configData.EditingMode.Label_msgid), sanitizeName(hModel.Name));
        % 32 36
        % 33 36
        % 34 36
    end % if
    % 36 38
    if not(sourceObject.isActive)
        % 38 40
        allowedMode = requestedMode;
        return;
    end % if
    % 42 65
    % 43 65
    % 44 65
    % 45 65
    % 46 65
    % 47 65
    % 48 65
    % 49 65
    % 50 65
    % 51 65
    % 52 65
    % 53 65
    % 54 65
    % 55 65
    % 56 65
    % 57 65
    % 58 65
    % 59 65
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    acs = hModel.getActiveConfigSet;
    checkOnly = ne(acs, sourceObject.up);
    % 66 68
    success = this.switchEditingMode(hModel, currentMode, requestedMode, checkOnly);
    % 68 72
    % 69 72
    % 70 72
    if success
        allowedMode = requestedMode;
    else
        % 74 76
    end % if
