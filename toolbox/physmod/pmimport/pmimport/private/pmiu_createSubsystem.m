function [VGD, sysHandle, portHandles] = pmiu_createSubsystem(VGD, xSubsystem)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    nodeNum = xSubsystem.tag;
    fullName = VGD.nodes.fullBlockName(nodeNum);
    pmiu_debug('createSubsystem : %s', char(fullName));
    sourceBlockName = VGD.BLOCKS.PROTOTYPE{VGD.SUBSYSTEM};
    % 17 18
    sysHandle = add_block(sourceBlockName, fullName{:}, 'MakeNameUnique', 'on');
    % 19 21
    % 20 21
    handleOrder = VGD.nodes.handleOrder{nodeNum};
    numPorts = length(handleOrder);
    if ne(length(xSubsystem.connectionPorts), sum(ne(VGD.nodes.handleOrder{nodeNum}, 0.0)))
        error('physmod:import:internal:BadSubsystemHandleSequence', 'Internal consistency: handles not properly sequenced for subsystem block ''%s''.', fullName{:});
        % 25 27
        % 26 27
    end % if
    % 28 29
    if ne(nodeNum, 1.0)
        portHandles = zeros(horzcat(1.0, numPorts));
        for portNum=1.0:numPorts
            xPort = xSubsystem.connectionPorts(handleOrder(portNum));
            portSide = VGD.PORT_SIDE_STRING(VGD.nodes.handleSide{nodeNum}(portNum));
            [VGD, portHandles(portNum)] = addSubsystemPort(VGD, sysHandle, xPort, portSide{:});
        end % for
        % 36 37
        pmiu_debug('portHandles: ');
        for port=portHandles
            pmiu_debug('%f,', port);
        end % for
        pmiu_debug('\b \n');
        % 42 43
    end % if
    % 44 45
    xSubsystem.handle.h = sysHandle;
end % function
function [VGD, portHandle] = addSubsystemPort(VGD, sysHandle, xPMIOPort, side)
    % 48 50
    % 49 50
    nodeNum = xPMIOPort.tag;
    fullName = VGD.nodes.fullBlockName(nodeNum);
    pmiu_debug('\n*** addSubsystemPort: %s\n', char(fullName));
    % 53 54
    sourceBlockName = VGD.BLOCKS.PROTOTYPE{VGD.PORT};
    % 55 56
    pmioPortHandle = add_block(sourceBlockName, fullName{:}, 'MakeNameUnique', 'on');
    set_param(pmioPortHandle, 'Side', side);
    xPMIOPort.handle.h = pmioPortHandle;
    portHandle = get_param(pmioPortHandle, 'PortHandles');
    portHandle = portHandle.RConn;
    xPMIOPort.inside.port.h = portHandle;
    % 62 63
    portHandle = getPMIOSubsystemPortHandle(pmioPortHandle);
    % 64 82
    % 65 82
    % 66 82
    % 67 82
    % 68 82
    % 69 82
    % 70 82
    % 71 82
    % 72 82
    % 73 82
    % 74 82
    % 75 82
    % 76 82
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    xPMIOPort.outside.port.h = portHandle;
    % 83 85
    % 84 85
    pmiu_debug('   portHandles==%f\n', portHandle);
end % function
