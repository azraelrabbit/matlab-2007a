function addArgConf(hSrc, portName, category, argName, qualifier)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if not(strcmpi(category, 'pointer')) && not(strcmpi(category, 'value'))
        DAStudio.error('RTW:fcnClass:wrongCategory', category);
    end
    % 23 25
    nspQual = regexprep(qualifier, '\s', '');
    % 25 27
    if isempty(nspQual)
        nspQual = 'none';
    end
    % 29 31
    if not(strcmpi(nspQual, 'none')) && not(strcmpi(nspQual, 'const')) && not(strcmpi(nspQual, 'const*')) && not(strcmpi(nspQual, 'const*const'))
        % 31 33
        DAStudio.error('RTW:fcnClass:wrongQualifier', qualifier);
    end
    % 34 36
    if strcmpi(category, 'pointer')
        theCategory = 'Pointer';
    else
        theCategory = 'Value';
    end
    % 40 42
    theQualifier = lower(nspQual);
    theQualifier = strrep(theQualifier, '*', ' * ');
    theQualifier = deblank(theQualifier);
    % 44 46
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
    argConf = RTW.FcnArgSpec;
    argConf.SLObjectName = portName;
    argConf.Category = theCategory;
    argConf.ArgName = argName;
    argConf.Qualifier = theQualifier;
    if gt(num, 0.0)
        argConf.Position = idx;
        hSrc.Data(idx) = argConf;
    else
        currPos = length(configData);
        argConf.Position = plus(currPos, 1.0);
        hSrc.Data = vertcat(configData, argConf);
    end
end
