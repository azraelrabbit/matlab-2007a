function res = syncWithModel(hSrc)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    res = [];
    dataArray = hSrc.data;
    % 9 11
    hModel = hSrc.ModelHandle;
    % 11 13
    if not(ishandle(hModel))
        DAStudio.error('RTW:fcnClass:invalidMdlHdl');
    else
        try
            obj = get_param(hModel, 'object');
            if not(obj.isa('Simulink.BlockDiagram'))
                DAStudio.error('RTW:fcnClass:invalidMdlHdl');
            end
        catch
            DAStudio.error('RTW:fcnClass:invalidMdlHdl');
        end % try
    end
    % 24 26
    inpH = find_system(hSrc.ModelHandle, 'SearchDepth', 1.0, 'Type', 'block', 'BlockType', 'Inport');
    % 26 28
    outpH = find_system(hSrc.ModelHandle, 'SearchDepth', 1.0, 'Type', 'block', 'BlockType', 'Outport');
    % 28 31
    % 29 31
    inpNames = get_param(inpH, 'Name');
    outpNames = get_param(outpH, 'Name');
    % 32 34
    if ischar(inpNames)
        inpNames = cellhorzcat(inpNames);
    end
    % 36 38
    if ischar(outpNames)
        outpNames = cellhorzcat(outpNames);
    end
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    posInArgs = 1.0;
    outportValue = {};
    for i=1.0:length(dataArray)
        name = dataArray(i).SLObjectName;
        temp = ismember(inpNames, name);
        pos = find(temp);
        if not(isempty(pos))
            dataArray(i).SLObjectType = 'Inport';
            dataArray(i).PortNum = minus(pos, 1.0);
            if not(strcmp(dataArray(i).Category, 'None'))
                dataArray(i).Position = posInArgs;
                posInArgs = plus(posInArgs, 1.0);
            end
            res = vertcat(res, dataArray(i));
            continue;
        end
        % 61 63
        temp = ismember(outpNames, name);
        pos = find(temp);
        if not(isempty(pos))
            dataArray(i).SLObjectType = 'Outport';
            dataArray(i).PortNum = minus(pos, 1.0);
            if not(strcmp(dataArray(i).Category, 'None'))
                dataArray(i).Position = posInArgs;
                posInArgs = plus(posInArgs, 1.0);
                if strcmp(dataArray(i).Category, 'Value')
                    outportValue = vertcat(horzcat(dataArray(i).SLObjectName), outportValue);
                end
            end
            res = vertcat(res, dataArray(i));
        else
            hSrc.selRow = 0.0;
        end
    end % for
    % 79 82
    % 80 82
    local_temp = RTW.ModelSpecificCPrototype;
    local_temp.Data = res;
    for index=1.0:length(outportValue)
        local_temp.setArgPosition(outportValue{index}, 1.0);
    end % for
    res = local_temp.Data;
    % 87 89
    namesInArgSpec = get(dataArray, 'SLObjectName');
    if isempty(namesInArgSpec)
        namesInArgSpec = {};
    else
        if not(iscell(namesInArgSpec))
            namesInArgSpec = cellhorzcat(namesInArgSpec);
        end
    end
    [dontcare, IDX] = setdiff(inpNames, namesInArgSpec);
    IDX = sort(IDX);
    for i=1.0:length(IDX)
        % 99 101
        [argName, cat, qualifier] = hSrc.getPortDefaultConf(inpH(IDX(i)));
        arg = RTW.FcnArgSpec(inpNames{IDX(i)}, 'Inport', cat, argName, posInArgs, qualifier, minus(IDX(i), 1.0), posInArgs);
        % 102 104
        posInArgs = plus(posInArgs, 1.0);
        res = vertcat(res, arg);
    end % for
    % 106 109
    % 107 109
    [dontcare, IDX] = setdiff(outpNames, namesInArgSpec);
    IDX = sort(IDX);
    for i=1.0:length(IDX)
        [argName, cat, qualifier] = hSrc.getPortDefaultConf(outpH(IDX(i)));
        arg = RTW.FcnArgSpec(outpNames{IDX(i)}, 'Outport', cat, argName, posInArgs, qualifier, minus(IDX(i), 1.0), posInArgs);
        % 113 115
        posInArgs = plus(posInArgs, 1.0);
        res = vertcat(res, arg);
    end % for
end
