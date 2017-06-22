function configData = RtmModelRegistry_config
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    persistent fConfigData;
    % 6 8
    if isempty(fConfigData)
        % 8 10
        internalErrorPfx = 'platform:SSC:RtmModelRegistry:error:internal:';
        Error.MultiplyRegisteredModel_templ_msgid = horzcat(internalErrorPfx, 'ModelMultiplyRegistered');
        Error.MultiplyRegisteredBlock_templ_msgid = horzcat(internalErrorPfx, 'BlockMultiplyRegistered');
        % 12 14
        userErrorPfx = 'platform:SSC:RtmModelRegistry:error:user:';
        Error.ModelNotRegistered_templ_msgid = horzcat(userErrorPfx, 'ModelNotRegistered');
        Error.BlockDataExists_templ_msgid = horzcat(userErrorPfx, 'BlockDataExists');
        % 16 18
        fConfigData.Error = Error;
        % 18 20
    end
    % 20 22
    configData = fConfigData;
end
