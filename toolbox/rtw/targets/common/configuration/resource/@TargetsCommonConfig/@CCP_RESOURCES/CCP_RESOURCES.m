function h = CCP_RESOURCES(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = TargetsCommonConfig.CCP_RESOURCES;
    % 9 12
    % 10 12
    % 11 12
    type = findtype('CCP_INSTANCE_FLAG');
    h.CCP_INSTANCE = RTWConfiguration.Resource(type.Strings);
end % function
