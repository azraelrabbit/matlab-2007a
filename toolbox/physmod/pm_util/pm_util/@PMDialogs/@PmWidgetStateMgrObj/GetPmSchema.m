function retStruct = GetPmSchema(hThis)
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
    retStruct = [];
    retStruct.states.action = hThis.ActionType;
    for idx=1.0:numel(hThis.StateList)
        fldName = sprintf('rel_params%d', idx);
        retStruct.states.(fldName) = hThis.StateList{idx}.paramList;
    end % for
end
