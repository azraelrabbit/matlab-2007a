function UpdateOptionsControls(playbackObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    local_UpdateSnapshotToggle(playbackObj);
    % 9 13
    % 10 13
    % 11 13
    dcsObj = playbackObj.srcObj.dataSource;
    playbackObj.ConnectionMode(dcsObj.connectMode);
end % function
function local_UpdateSnapshotToggle(playbackObj)
    % 16 19
    % 17 19
    dcsObj = playbackObj.srcObj.dataSource;
    % 19 21
    if dcsObj.snap_shot
        s = 'on';
    else
        s = 'off';
    end % if
    set(playbackObj.button_simulink_snapshot, 'state', s);
    set(playbackObj.menu_simulink_snapshot, 'checked', s);
end % function
