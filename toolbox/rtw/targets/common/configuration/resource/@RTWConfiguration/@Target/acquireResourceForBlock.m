function acquiredResource = acquireResourceForBlock(block, configType, resourceType, requestedResource, msg)
    % 1 26
    % 2 26
    % 3 26
    % 4 26
    % 5 26
    % 6 26
    % 7 26
    % 8 26
    % 9 26
    % 10 26
    % 11 26
    % 12 26
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    simStatus = lower(get_param(bdroot(block), 'SimulationStatus'));
    % 26 28
    switch simStatus
    case {'initializing','updating'}
        % 29 31
        target = RTWConfigurationCB('get_target', block);
        resources = target.findResourceForClass(configType);
        resource = get(resources, resourceType);
        current_allocation = resource.get_current_allocation(block);
        if isempty(current_allocation)
            % 35 37
            acquiredResource = resource.manual_allocate(block, requestedResource);
            if isempty(acquiredResource)
                host = resource.get_host(requestedResource);
                host_alloc = resource.get_current_allocation(host);
                conflict = intersect(host_alloc, requestedResource);
                % 41 44
                % 42 44
                fblock = regexprep(block, '\s', ' ');
                fhost = regexprep(host, '\s', ' ');
                % 45 48
                % 46 48
                if gt(length(conflict), 1.0)
                    this = 'These';
                    is = 'are';
                else
                    this = 'This';
                    is = 'is';
                end % if
                msg = sprintf(horzcat('\n--------------------------------------------\n', 'Resource allocation failure.\n', '--------------------------------------------\n', 'Failed to allocate %s \n   %s\nto \n   ''%s''\n', this, ' %s ', is, ' already allocated to block \n   ''%s''\n', 'Please change your %s selection'), msg, horzcat('{ ', sprintf('%s ', conflict{:}), ' }'), fblock, msg, fhost, msg);
                % 55 64
                % 56 64
                % 57 64
                % 58 64
                % 59 64
                % 60 64
                % 61 64
                % 62 64
                error(msg);
            end % if
        else
            % 66 69
            % 67 69
            if isempty(setdiff(requestedResource, current_allocation))
                % 69 71
                requestedResource = current_allocation;
            else
                % 72 74
                error('Programming Error : To allocate multiple resources from a resource pool call acquireResourceForBlock with the requestedResource parameter being a cell array of resources.');
            end % if
        end % if
    case {'stopped'}
        % 77 80
        % 78 80
        acquiredResource = requestedResource;
    end % switch
