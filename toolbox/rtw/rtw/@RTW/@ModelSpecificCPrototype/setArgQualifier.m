function setArgQualifier(hSrc, portName, qualifier)
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
    nspQual = regexprep(qualifier, '\s', '');
    % 13 15
    if not(strcmpi(nspQual, 'none')) && not(strcmpi(nspQual, 'const')) && not(strcmpi(nspQual, 'const*')) && not(strcmpi(nspQual, 'const*const'))
        % 15 17
        DAStudio.error('RTW:fcnClass:wrongQualifier', qualifier);
    end
    theQualifier = lower(nspQual);
    theQualifier = strrep(theQualifier, '*', ' * ');
    theQualifier = deblank(theQualifier);
    % 21 23
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
    argConf.Qualifier = theQualifier;
end
