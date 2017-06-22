function [VGD, blockHandle, portHandle] = pmiu_createPort(VGD, xPort)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    fullName = VGD.nodes.fullBlockName(xPort.tag);
    pmiu_debug('createPort: %s\n', char(fullName));
    pmiu_debug(' -> inside=%f, outside=%f\n', xPort.inside.port.h, xPort.outside.port.h);
    if eq(xPort.handle.h, 0.0)
        error('physmod:import:internal:NonexistentPort', 'Internal consistency: expected port ''%s'' to already have been created.', fullName{:});
        % 24 27
        % 25 27
        % 26 27
    end % if
    blockHandle = xPort.handle.h;
    portHandle = xPort.inside.port.h;
    pmiu_debug('   portHandles: %f\n', portHandle);
end % function
