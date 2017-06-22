function ddgSchema = PreDlgDisplay(hThis, ddgSchema)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    stateVal = find(strcmp(hThis.Choices, hThis.Value));
    hThis.hStateMgr.CurrentState = stateVal;
    % 19 21
    % 20 21
    ddgSchema = hThis.hStateMgr.SetStateOnDDGSchemaStruct(ddgSchema);
    % 22 25
    % 23 25
    % 24 25
end % function
