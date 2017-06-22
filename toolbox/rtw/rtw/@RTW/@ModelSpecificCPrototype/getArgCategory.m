function category = getArgCategory(hSrc, portName)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
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
    category = argConf.Category;
end
