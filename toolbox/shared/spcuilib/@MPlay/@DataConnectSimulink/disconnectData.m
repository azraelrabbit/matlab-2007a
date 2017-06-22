function disconnectData(dcsObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if dcsObj.debug
        disp('DCS: disconnectData method');
        drawnow
    end % if
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    disconnect_state(dcsObj);
    % 22 26
    % 23 26
    % 24 26
    close(dcsObj.hSLConnectMgr);
    dcsObj.hSLConnectMgr = [];
end % function
