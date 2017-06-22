function stateVector = mech_set_states(stateVectorMgr, stateVector, mechanicalStates)
    % 1 43
    % 2 43
    % 3 43
    % 4 43
    % 5 43
    % 6 43
    % 7 43
    % 8 43
    % 9 43
    % 10 43
    % 11 43
    % 12 43
    % 13 43
    % 14 43
    % 15 43
    % 16 43
    % 17 43
    % 18 43
    % 19 43
    % 20 43
    % 21 43
    % 22 43
    % 23 43
    % 24 43
    % 25 43
    % 26 43
    % 27 43
    % 28 43
    % 29 43
    % 30 43
    % 31 43
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    if lt(nargin, 3.0)
        mechanicalStates = [];
    end
    % 45 47
    if lt(nargin, 2.0)
        stateVector = [];
    end
    % 49 51
    if not(isempty(stateVector)) && ne(min(size(stateVector)), 1.0)
        error('physmod:mech:mech_set_states:StateVectorDimension', 'The state vector provided should be a vector.');
        % 52 54
    end
    % 54 56
    modelName = bdroot(stateVectorMgr.MachineName);
    % 56 58
    [sizes, x0, stateNames, Ts] = feval(modelName, [], [], [], 'sizes');
    % 58 60
    if isempty(stateVector)
        stateVector = x0;
    else
        if ne(length(stateVector), length(x0))
            error('physmod:mech:mech_set_states:InvalidStateVector', 'The state vector provided does not correspond to the selected model.');
        end
    end
    stateVector = populateStateVector(stateVectorMgr, stateVector, stateNames, mechanicalStates);
    % 67 71
    % 68 71
    % 69 71
end
function x = populateStateVector(vectorMgr, x, xNames, mechanicalStates)
    % 72 79
    % 73 79
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    if isempty(mechanicalStates)
        mechanicalStates = vectorMgr.x;
    else
        if numel(ne(mechanicalStates, numel(vectorMgr.x)))
            error('physmod:mech:mech:mech_set_states:IncorrectNumberOfMechanicalStates', 'An incorrect number of mechanical states was supplied.');
            % 83 85
        end
    end
    % 86 88
    machineStates = mech_find_states(xNames, vectorMgr);
    % 88 90
    x(machineStates) = mechanicalStates;
    % 90 92
end
