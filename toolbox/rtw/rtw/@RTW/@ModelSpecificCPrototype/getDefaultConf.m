function getDefaultConf(hSrc)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    hModel = hSrc.ModelHandle;
    % 16 17
    if not(ishandle(hModel))
        DAStudio.error('RTW:fcnClass:invalidMdlHdl');
    else
        try
            obj = get_param(hModel, 'object');
            if not(obj.isa('Simulink.BlockDiagram'))
                DAStudio.error('RTW:fcnClass:invalidMdlHdl');
            end % if
        catch
            DAStudio.error('RTW:fcnClass:invalidMdlHdl');
        end % try
    end % if
    % 29 30
    fullname = getfullname(hModel);
    % 31 33
    % 32 33
    if isempty(hSrc.FunctionName)
        hSrc.FunctionName = sprintf('%s_custom', fullname);
    end % if
    % 36 37
    inpH = find_system(hModel, 'SearchDepth', 1.0, 'Type', 'block', 'BlockType', 'Inport');
    % 38 39
    outpH = find_system(hModel, 'SearchDepth', 1.0, 'Type', 'block', 'BlockType', 'Outport');
    % 40 41
    portH = vertcat(inpH, outpH);
    % 42 43
    inpNames = get_param(inpH, 'Name');
    if ischar(inpNames)
        inpNames = cellhorzcat(inpNames);
    end % if
    outpNames = get_param(outpH, 'Name');
    if ischar(outpNames)
        outpNames = cellhorzcat(outpNames);
    end % if
    portNames = vertcat(inpNames, outpNames);
    % 52 53
    if eq(length(portH), 0.0)
        hSrc.Data = [];
        return;
    end % if
    % 57 59
    % 58 59
    if ischar(portNames)
        portNames = cellhorzcat(portNames);
    end % if
    % 62 63
    simStatus = get_param(hModel, 'SimulationStatus');
    % 64 65
    NeedTerm = false;
    if not(strcmpi(simStatus, 'paused')) && not(strcmpi(simStatus, 'initializing')) && not(strcmpi(simStatus, 'running'))
        % 67 68
        try
            lastWarnSaved = lastwarn;
            lastwarn('');
            evalc(horzcat(fullname, '([], [], [], ''compile'');'));
            if not(isempty(lastwarn))
                disp(horzcat(DAStudio.message('RTW:fcnClass:fcnProtoCtlWarn'), lastwarn));
            end % if
            lastwarn(lastWarnSaved);
            NeedTerm = true;
        catch
            error(DAStudio.message('RTW:fcnClass:modelNotCompile', lasterr));
            return;
        end % try
    end % if
    % 82 83
    hSrc.Data = [];
    inPortInd = 0.0;
    outPortInd = 0.0;
    % 86 87
    for i=1.0:length(portH)
        [argName, cat, qualifier] = hSrc.getPortDefaultConf(portH(i));
        portType = get_param(portH(i), 'BlockType');
        if strcmpi(portType, 'Inport')
            portInd = inPortInd;
            inPortInd = plus(inPortInd, 1.0);
        else
            portInd = outPortInd;
            outPortInd = plus(outPortInd, 1.0);
        end % if
        % 97 98
        arg = RTW.FcnArgSpec(portNames{i}, portType, cat, argName, i, qualifier, portInd, i);
        % 99 100
        hSrc.Data = vertcat(horzcat(hSrc.Data), arg);
    end % for
    % 102 103
    if NeedTerm
        eval(horzcat(fullname, '([], [], [], ''term'');'));
    end % if
end % function
