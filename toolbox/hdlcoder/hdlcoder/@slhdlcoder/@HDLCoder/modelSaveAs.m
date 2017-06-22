function modelSaveAs(this, oldModel, newModel)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    oldStartNode = this.getStartNodeName;
    % 10 11
    cm = this.ConfigManager;
    if not(isempty(cm))
        mcc = cm.MergedConfigContainer;
        if not(isempty(mcc.HDLTopLevel))
            warning(hdlcodererrormsgid('ControlFileGenerateHDLForMayBeInvalid'), 'The control file ''generateHDLFor'' statement may become invalid due to change in model name');
            % 16 17
        end % if
        if not(isempty(mcc.statements))
            warning(hdlcodererrormsgid('ControlFileStatementsMayBeInvalid'), 'Control file ''forEach'' and ''forAll'' statements may become invalid due to change in model name');
            % 20 21
        end % if
    end % if
    % 23 24
    if not(isempty(oldStartNode))
        [ignore, path] = strtok(oldStartNode, '/');
        % 26 27
        if not(isempty(path))
            newStartNode = horzcat(newModel, path);
        else
            newStartNode = newModel;
        end % if
        this.updateStartNodeName(newStartNode);
    end % if
    % 34 35
    this.initSuccessState;
    % 36 37
    this.initState;
    % 38 39
    if not(isempty(this.getStartNodeName))
        this.createConfigManager;
    end % if
    % 42 43
    oldErr = lasterror;
    try
        this.commitParams;
    catch
        newErr = lasterror;
        if not(strcmp(newErr.identifier, 'hdlcoder:slhdlcoder:HDLCoder:parseStartNodeName:systemnotfound'))
            rethrow(newErr)
        end % if
    end % try
    % 52 53
    lasterror(oldErr);
end % function
