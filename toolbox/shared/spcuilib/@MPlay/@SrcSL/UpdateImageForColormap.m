function UpdateImageForColormap(srcObj)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    dcsObj = srcObj.dataSource;
    frameData = dcsObj.hSLConnectMgr.getSignalData.UserData;
    % 15 18
    % 16 18
    % 17 18
    if ne(size(frameData, 3.0), 1.0)
        return;
    end % if
    % 21 23
    % 22 23
    DemandUpdateSingle(srcObj);
    % 24 27
    % 25 27
    % 26 27
    refresh(srcObj.playbackControls.hfig);
end % function
