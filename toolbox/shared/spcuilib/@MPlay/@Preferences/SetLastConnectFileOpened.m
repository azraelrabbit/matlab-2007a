function SetLastConnectFileOpened(preferencesObj, eventStruct)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    val = eventStruct.NewValue;
    preferencesObj.LastConnectFileOpened = val;
end % function