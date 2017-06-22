function BuildFromPmSchema(hThis, ruleStruct)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    hThis.StateList = {};
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    if isfield(ruleStruct.states, 'action')
        hThis.ActionType = ruleStruct.states.action;
    else
        hThis.ActionType = 'Visible';
    end
    % 24 26
    paramPrefix = 'rel_params';
    % 26 29
    % 27 29
    nStates = 0.0;
    matches = strfind(fields(ruleStruct.states), paramPrefix);
    for midx=1.0:numel(matches)
        if ~(isempty(matches{midx}))
            nStates = plus(nStates, matches{midx}(1.0));
        end
    end % for
    % 35 38
    % 36 38
    for idx=1.0:nStates
        stateItem.value = idx;
        fldName = sprintf('rel_params%d', idx);
        if isfield(ruleStruct.states, fldName)
            stateItem.paramList = ruleStruct.states.(fldName);
            stateItem.tagList = {};
            hThis.StateList{idx} = stateItem;
        else
            break
        end
    end % for
end
