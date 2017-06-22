function paramType = getParamTypeEnum(request)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    switch lower(request)
    case 'using'
        paramType = PARAM_USING;
    case 'authoring'
        paramType = PARAM_AUTHORING;
    otherwise
        % 12 13
        configData = RunTimeModule_config;
        pm_error(configData.Error.UnknownParamTypeRequest_msgid);
        % 15 16
    end % switch
end % function
