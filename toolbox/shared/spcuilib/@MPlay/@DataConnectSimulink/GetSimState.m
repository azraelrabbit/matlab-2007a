function s = GetSimState(dcsObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if isempty(dcsObj.hSLConnectMgr)
        s = 'disconnected';
    else
        s = dcsObj.hSLConnectMgr.hSimState.CurrentState;
    end % if
end % function
