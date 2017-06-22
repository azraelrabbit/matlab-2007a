function value = sl_get_customization_param(hObj, propName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if isprop(hObj, propName)
        try
            switch propName
            case 'UserDataTypes'
                value = get_data_types(hObj);
            case 'MPTObjectTypes'
                value = get_object_types(hObj);
            case 'MPFSymbolDefinition'
                value = get_symbols(hObj);
            otherwise
                value = get(hObj, propName);
            end % switch
        catch
            value = [];
            warning('Simulink:mpt:Customization:sl_get_customization_param', lasterr);
        end % try
    else
        errMsg = sprintf('''%s'' is a invalid property. ', propName);
        warning('Simulink:mpt:Customization:sl_get_customization_param', errMsg);
        value = [];
    end % if
end % function
function dtList = get_data_types(hObj)
    % 29 32
    % 30 32
    % 31 32
    dtList = {};
    for i=1.0:length(hObj.UserDataTypes)
        udt = hObj.UserDataTypes{i};
        if iscell(udt)
            % 36 37
            dtList{plus(end, 1.0)} = udt{1.0};
        else
            dtList{plus(end, 1.0)} = udt;
        end % if
    end % for
end % function
function otList = get_object_types(hObj)
    % 44 47
    % 45 47
    % 46 47
    otList = {};
    for i=1.0:length(hObj.MPTObjectTypes)
        otList{plus(end, 1.0)} = hObj.MPTObjectTypes{i}.Name;
    end % for
end % function
function symList = get_symbols(hObj)
    % 53 56
    % 54 56
    % 55 56
    symList = {};
    for i=1.0:length(hObj.MPFSymbolDefinition)
        symList{plus(end, 1.0)} = hObj.MPFSymbolDefinition{i}.Name;
    end % for
end % function
