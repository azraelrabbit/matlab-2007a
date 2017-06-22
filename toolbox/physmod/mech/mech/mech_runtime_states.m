function [x, rto] = mech_runtime_states(vectorMgr, rto)
    % 1 51
    % 2 51
    % 3 51
    % 4 51
    % 5 51
    % 6 51
    % 7 51
    % 8 51
    % 9 51
    % 10 51
    % 11 51
    % 12 51
    % 13 51
    % 14 51
    % 15 51
    % 16 51
    % 17 51
    % 18 51
    % 19 51
    % 20 51
    % 21 51
    % 22 51
    % 23 51
    % 24 51
    % 25 51
    % 26 51
    % 27 51
    % 28 51
    % 29 51
    % 30 51
    % 31 51
    % 32 51
    % 33 51
    % 34 51
    % 35 51
    % 36 51
    % 37 51
    % 38 51
    % 39 51
    % 40 51
    % 41 51
    % 42 51
    % 43 51
    % 44 51
    % 45 51
    % 46 51
    % 47 51
    % 48 51
    % 49 51
    % 50 51
    if lt(nargin, 2.0)
        blockWithStates = horzcat(vectorMgr.MachineName, '/_mech_engine/Block#1');
        try
            rto = get_param(blockWithStates, 'RuntimeObject');
        catch
            error('physmod:mech:mech:CouldNotObtainRTO', 'Could not obtain the Simulink Runtime Object for the machine associated with this vector manager.');
            % 57 58
        end % try
        % 59 61
        % 60 61
    end % if
    % 62 63
    if not(strcmp(class(rto), 'Simulink.RunTimeBlock'))
        error('physmod:mech:mech:InvalidRTO', 'The Simulink Runtime Object for the machine associated with this vector manager is invalid.');
        % 65 66
    end % if
    % 67 75
    % 68 75
    % 69 75
    % 70 75
    % 71 75
    % 72 75
    % 73 75
    % 74 75
    blockList = mech_get_blocks(vectorMgr.MachineName);
    environmentBlock = blockList.Environment;
    if strcmpi(get_param(environmentBlock, 'AnalysisType'), 'Kinematics')
        x = rto.DiscStates.Data;
    else
        x = rto.ContStates.Data;
    end % if
end % function
