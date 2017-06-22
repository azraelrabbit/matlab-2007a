function registerEventsForModel(this, modelName)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isempty(modelName)
        return
    end
    % 9 13
    % 10 13
    % 11 13
    hCLI = this.HDLCoder.CoderParameterObject.CLI;
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    propsCLI = find(hCLI.classhandle.properties, 'accessflags.publicset', 'on', 'accessflags.publicget', 'on');
    propDriver = findprop(this.HDLCoder, 'StartNodeName');
    L(1.0) = handle.listener(hCLI, propsCLI, 'PropertyPostSet', @propertyChanged);
    L(1.0).CallbackTarget = this;
    L(2.0) = handle.listener(this.HDLCoder, propDriver, 'PropertyPostSet', @propertyChanged);
    L(2.0).CallbackTarget = this;
    % 23 25
    if ~(isempty(modelName))
        % 25 27
        hSBD = get_param(modelName, 'Object');
        % 27 29
        L(3.0) = handle.listener(hSBD, 'PostSaveEvent', @(hSrc,ed)slpostsave_listener(this,ed));
        % 29 31
    end
    % 31 33
    this.HDLListener = L;
end
function slpostsave_listener(hdlcc, ed)
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    if isprop(hdlcc, 'HDLCoder') && ~(isempty(hdlcc.HDLCoder))
        % 43 46
        % 44 46
        oldMdlName = hdlcc.mdlName;
        % 46 49
        % 47 49
        nMdlName = ed.Source.Name;
        % 49 51
        if ~(strcmpi(oldMdlName, nMdlName))
            % 51 53
            hdlcc.mdlName = nMdlName;
            hdlcc.HDLCoder.modelSaveAs(oldMdlName, nMdlName);
            % 54 57
            % 55 57
            registerEventsForModel(hdlcc, nMdlName);
        else
            hdlcc.HDLCoder.modelSave(oldMdlName);
        end
        updateDialog(hdlcc);
    end
end
function updateDialog(hdlcc)
    cs = hdlcc.getSourceObject.getConfigSet;
    hDlg = cs.getDialogHandle;
    if ~(isempty(hDlg))
        hDlg.refresh;
    end
end
