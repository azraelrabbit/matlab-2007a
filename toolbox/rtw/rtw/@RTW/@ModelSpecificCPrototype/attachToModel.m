function attachToModel(hSrc, modelName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if ischar(modelName)
        try
            hModel = get_param(modelName, 'Handle');
        catch
            DAStudio.error('RTW:fcnClass:invalidModelName', modelName);
        end % try
    else
        hModel = modelName;
    end % if
    % 20 21
    try
        obj = get_param(hModel, 'object');
        if not(obj.isa('Simulink.BlockDiagram'))
            DAStudio.error('RTW:fcnClass:invalidMdlHdl');
        end % if
    catch
        DAStudio.error('RTW:fcnClass:invalidMdlHdl');
    end % try
    % 29 30
    fullname = get_param(hModel, 'Name');
    % 31 33
    % 32 33
    if isempty(hSrc.FunctionName)
        hSrc.FunctionName = sprintf('%s_custom', fullname);
    end % if
    % 36 37
    hSrc.ModelHandle = hModel;
    set_param(hModel, 'RTWFcnClass', hSrc);
end % function
