function numPortsEnabled = des_enableenumport(block, subaction, IOType, PortType, portLabelRoot, numPorts, varargin)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    switch subaction
    case 'noapply'
        return;
    case 'apply'
    otherwise
        % 23 24
        error('Invalid choice for applyStatus in des_enableenumport');
        return;
    end % switch
    % 27 29
    % 28 29
    if isempty(numPorts) || ischar(numPorts)
        msg = 'Parameter ''numPorts'' must be a scalar.';
        error('SimEvents:InternalError:InvalidType', msg);
    end % if
    % 33 35
    % 34 35
    [child, childName] = des_getchildblockname(block);
    ud = get_param(child, 'UserData');
    switch IOType
    case 'in'
        switch PortType
        case 'SE'
            portInfo = ud.ipInfoSE;
        case 'SL'
            portInfo = ud.ipInfoSL;
        end % switch
    case 'out'
        switch PortType
        case 'SE'
            portInfo = ud.opInfoSE;
        case 'SL'
            portInfo = ud.opInfoSL;
        end % switch
    end % switch
    % 53 54
    allIdx = strmatch(portLabelRoot, portInfo.portLabel);
    maxNumPort = allIdx(end);
    % 56 58
    % 57 58
    if lt(numPorts, 1.0) || gt(numPorts, maxNumPort)
        msg = horzcat('Parameter ''numPorts'' must be a scalar integer ', 'between 1 and ', num2str(maxNumPort), '.');
        % 60 61
        error('SimEvents:InternalError:InvalidValue', msg);
    else
        posIdx = strmatch(horzcat(portLabelRoot, num2str(numPorts)), portInfo.portLabel, 'exact');
    end % if
    % 65 67
    % 66 67
    for idx=1.0:posIdx
        portLabel = horzcat(portLabelRoot, num2str(idx));
        des_enableport(block, subaction, IOType, PortType, portLabel, 'yes', varargin{:});
    end % for
    % 71 73
    % 72 73
    for idx=plus(posIdx, 1.0):maxNumPort
        portLabel = horzcat(portLabelRoot, num2str(idx));
        des_enableport(block, subaction, IOType, PortType, portLabel, 'no', varargin{:});
    end % for
    % 77 78
    return;
end % function
