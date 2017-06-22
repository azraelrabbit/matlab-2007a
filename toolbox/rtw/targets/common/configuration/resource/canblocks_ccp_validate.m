function argout = canblocks_ccp_validate(block, target, instance_str)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    resource_obj = target.findResourceForClass('TargetsCommonConfig.CCP');
    if isempty(resource_obj)
        error('Could not find configuration for TargetsCommonConfig.CCP');
    end % if
    % 13 15
    % 14 15
    resource = resource_obj.CCP_INSTANCE;
    % 16 18
    % 17 18
    instance_str_alloc = resource.manual_allocate(block, instance_str);
    % 19 20
    if isempty(instance_str_alloc)
        host = resource.get_host(instance_str);
        if ischar(host)
            hilite_system(host, 'error');
            error('Only one CAN Calibration Protocol (CCP) block is allowed in a target subsystem.   More than one CCP block is in the target subsystem.   To fix this error, please remove extra CCP blocks.');
        else
            % 26 27
            % 27 29
            % 28 29
        end % if
        open_system(block);
    else
        % 32 33
    end % if
    % 34 35
    argout = cellhorzcat(instance_str);
end % function
