function InstallPlaybackControls(mplayObj)
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
    % 11 12
    src = mplayObj.datasourceObj;
    % 13 14
    src.playbackControls.install;
    src.playbackControls.update;
    % 16 17
    react(mplayObj.zoomObj);
end % function
