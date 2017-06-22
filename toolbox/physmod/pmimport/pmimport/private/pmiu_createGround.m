function [VGD, groundHandle, portHandle] = pmiu_createGround(VGD, xGround)
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
    nodeNum = xGround.tag;
    fullName = VGD.nodes.fullBlockName(nodeNum);
    pmiu_debug('createGround      : %s\n', char(fullName));
    pmiu_debug(' -> frame=%f', xGround.frame.port.h);
    sourceBlockName = VGD.BLOCKS.PROTOTYPE{VGD.GROUND};
    % 20 21
    groundHandle = add_block(sourceBlockName, fullName{:}, 'MakeNameUnique', 'on');
    % 22 24
    % 23 24
    pmiu_todo('** check parameters on ground block **\n');
    xFrame = xGround.frame;
    coordPositionStr = horzcat('[', num2str(xFrame.position(1.0)), ' ', num2str(xFrame.position(2.0)), ' ', num2str(xFrame.position(3.0)), ']');
    % 27 31
    % 28 31
    % 29 31
    % 30 31
    mech_support('CleanSetParam', groundHandle, 'CoordPosition', coordPositionStr, 'CoordPositionUnits', xGround.frame.positionUnits);
    % 32 35
    % 33 35
    % 34 35
    pH = get_param(groundHandle, 'PortHandles');
    portHandle = pH.RConn;
    xGround.handle.h = groundHandle;
    xGround.frame.port.h = portHandle;
    pmiu_debug('   portHandles: %f\n', portHandle);
end % function
