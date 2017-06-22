function simState = mech_getModelSimState(blk)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    switch class(blk)
    case 'char'
        blk = get_param(blk, 'Handle');
    case 'double'
        if not(ishandle(blk))
            error('physmod:mech:mech_getModelSimState:InvalidSimulinkObjectHandle', 'Invalid Simulink object handle.');
            % 14 16
        end % if
    otherwise
        error('physmod:mech:mech_getModelSimState:InvalidArgument', 'Invalid argument passed to mech_getModelSimState');
        % 18 20
    end % switch
    % 20 22
    simState = get_param(bdroot(blk), 'SimulationStatus');
