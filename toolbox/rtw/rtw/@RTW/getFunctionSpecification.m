function obj = getFunctionSpecification(modelName)
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
    if ischar(modelName)
        try
            hModel = get_param(modelName, 'Handle');
        catch
            DAStudio.error('RTW:fcnClass:invalidModelName', modelName);
        end % try
    else
        hModel = modelName;
    end % if
    % 24 25
    try
        obj = get_param(hModel, 'object');
        if not(obj.isa('Simulink.BlockDiagram'))
            DAStudio.error('RTW:fcnClass:invalidMdlHdl');
        end % if
    catch
        DAStudio.error('RTW:fcnClass:invalidMdlHdl');
    end % try
    % 33 34
    obj = get_param(hModel, 'RTWFcnClass');
    % 35 36
    if isempty(obj) || not(ishandle(obj)) || not(isa(obj, 'RTW.FcnCtl'))
        obj = [];
    else
        obj.ModelHandle = hModel;
    end % if
end % function
