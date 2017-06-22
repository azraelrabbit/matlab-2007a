function setArgCategory(hSrc, portName, category)
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
    if not(strcmpi(category, 'pointer')) && not(strcmpi(category, 'value'))
        DAStudio.error('RTW:fcnClass:wrongCategory', category);
    end
    % 17 19
    if strcmpi(category, 'pointer')
        theCategory = 'Pointer';
    else
        theCategory = 'Value';
    end
    % 23 25
    configData = hSrc.Data;
    namesInArgSpec = get(configData, 'SLObjectName');
    if isempty(namesInArgSpec)
        namesInArgSpec = {};
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
    argConf.Category = category;
end
