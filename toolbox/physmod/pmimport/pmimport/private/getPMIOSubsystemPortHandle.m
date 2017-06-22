function portHandle = getPMIOSubsystemPortHandle(pmioHandle)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    subsys = get_param(get_param(pmioHandle, 'Parent'), 'Handle');
    % 7 9
    % 8 9
    if strcmpi(get_param(subsys, 'Type'), 'block')
        % 10 11
        side = get_param(pmioHandle, 'Side');
        number = getPMPortNumber(pmioHandle);
        % 13 15
        % 14 15
        allPortHs = get_param(subsys, 'PortHandles');
        if strcmpi(side, 'left')
            portHs = allPortHs.LConn;
        else
            portHs = allPortHs.RConn;
        end % if
        % 21 24
        % 22 24
        % 23 24
        blks = find_system(subsys, 'LookUnderMasks', 'all', 'FollowLinks', 'on', 'SearchDepth', 1.0, 'BlockType', 'PMIOPort');
        % 25 28
        % 26 28
        % 27 28
        blks = blks(strcmpi(get_param(blks, 'Side'), side));
        % 29 30
        count = 1.0;
        % 31 32
        for i=1.0:length(blks)
            if lt(getPMPortNumber(blks(i)), number)
                count = plus(count, 1.0);
            end % if
        end % for
        % 37 39
        % 38 39
        portHandle = portHs(count);
    else
        % 41 42
        portHandle = [];
    end % if
end % function
function portNum = getPMPortNumber(pmio)
    % 46 52
    % 47 52
    % 48 52
    % 49 52
    % 50 52
    % 51 52
    portNum = str2double(get_param(pmio, 'Port'));
end % function
