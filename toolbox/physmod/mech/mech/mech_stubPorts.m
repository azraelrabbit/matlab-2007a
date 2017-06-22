function mech_stubPorts(sys)
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
    sys = get_param(sys, 'Handle');
    set_param(0.0, 'CurrentSystem', sys);
    % 13 14
    ioblks = vertcat(find_system(sys, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Name', 'sensors'), find_system(sys, 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Name', 'actuators'));
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    inports = find_system(ioblks, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', 'port', 'PortType', 'inport', 'Line', -1.0);
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    % 31 32
    outports = find_system(ioblks, 'FindAll', 'on', 'FollowLinks', 'on', 'LookUnderMasks', 'all', 'Type', 'port', 'PortType', 'outport', 'Line', -1.0);
    % 33 40
    % 34 40
    % 35 40
    % 36 40
    % 37 40
    % 38 40
    % 39 40
    i_Stub(inports);
    i_Stub(outports);
end % function
function i_Stub(ports)
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    if isempty(ports)
        return;
    end % if
    % 52 53
    parBlks = get_param(ports, 'Parent');
    parBlks = get_param(parBlks, 'Handle');
    parBlks = horzcat(parBlks{:});
    parSys = get_param(parBlks, 'Parent');
    parSys = get_param(parSys, 'Handle');
    parSys = horzcat(parSys{:});
    % 59 60
    portType = get_param(ports(1.0), 'PortType');
    switch portType
    case 'inport'
        type = 'Ground';
        field = 'Outport';
    case 'outport'
        type = 'Terminator';
        field = 'Inport';
    end % switch
    % 69 70
    blkToAdd = horzcat('built-in/', type);
    newports = [];
    for i=1.0:length(ports)
        new_blk = horzcat(getfullname(parSys(i)), '/', get_param(parBlks(i), 'Name'), '_port_stubber_', portType, '_', num2str(i));
        % 74 75
        new_blk = add_block(blkToAdd, new_blk);
        phs = get_param(new_blk, 'PortHandles');
        newports(plus(end, 1.0)) = getfield(phs, field);
    end % for
    % 79 80
    switch field
    case 'Inport'
        from = ports;
        to = newports;
    case 'Outport'
        from = newports;
        to = ports;
    end % switch
    % 88 89
    for i=1.0:length(ports)
        add_line(parSys(i), from(i), to(i));
    end % for
end % function
