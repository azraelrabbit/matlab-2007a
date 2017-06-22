function argName = getArgName(hSrc, portName)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    configData = hSrc.Data;
    namesInArgSpec = get(configData, 'SLObjectName');
    if isempty(namesInArgSpec)
        DAStudio.error('RTW:fcnClass:noConfigFound', portName);
        return
    else
        if not(iscell(namesInArgSpec))
            namesInArgSpec = cellhorzcat(namesInArgSpec);
        end
    end
    [num, idx] = ismember(portName, namesInArgSpec);
    if eq(num, 0.0)
        DAStudio.error('RTW:fcnClass:noConfigFound', portName);
        return
    end
    argConf = configData(idx);
    argName = argConf.ArgName;
end
