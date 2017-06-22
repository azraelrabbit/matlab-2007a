function [stateVectorMgr, smStateVector] = mech_get_states(stateVector, machineOrMgr)
    % 1 37
    % 2 37
    % 3 37
    % 4 37
    % 5 37
    % 6 37
    % 7 37
    % 8 37
    % 9 37
    % 10 37
    % 11 37
    % 12 37
    % 13 37
    % 14 37
    % 15 37
    % 16 37
    % 17 37
    % 18 37
    % 19 37
    % 20 37
    % 21 37
    % 22 37
    % 23 37
    % 24 37
    % 25 37
    % 26 37
    % 27 37
    % 28 37
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    if strcmp(class(machineOrMgr), 'MECH.StateVectorMgr')
        fillVectorMgr = false;
        stateVectorMgr = machineOrMgr;
    else
        fillVectorMgr = true;
        machineHandle = machineOrMgr;
        machineHandle = get_param(machineHandle, 'Handle');
        modelName = getfullname(bdroot(machineHandle));
        stateVectorMgr = mech_stateVectorMgr(machineHandle);
    end % if
    % 47 48
    if ne(min(size(stateVector)), 1.0)
        error('physmod:mech:mech_get_states:StateVectorDimension', 'The state vector provided should be a vector.');
        % 50 51
    end % if
    % 52 54
    % 53 54
    [sizes, x0, stateNames, Ts] = feval(modelName, [], [], [], 'sizes');
    smStateVector = populateStateMgr(stateVectorMgr, stateVector, stateNames);
    % 56 57
    if fillVectorMgr
        stateVectorMgr.X = smStateVector;
    end % if
    % 60 62
    % 61 62
end % function
function stateVector = populateStateMgr(vectorMgr, x, xNames)
    % 64 69
    % 65 69
    % 66 69
    % 67 69
    % 68 69
    machineStates = mech_find_states(xNames, vectorMgr);
    % 70 72
    % 71 72
    if ne(length(vectorMgr.x), length(machineStates))
        error('physmod:mech:mech_get_states:InvalidStateVector', 'The state vector provided does not correspond to the selected machine.');
        % 74 75
    end % if
    % 76 78
    % 77 78
    stateVector = x(machineStates);
    % 79 80
end % function
