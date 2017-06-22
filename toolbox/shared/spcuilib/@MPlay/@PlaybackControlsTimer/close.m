function close(playbackObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    delete(playbackObj.timerObj);
    playbackObj.timerObj = [];
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    playbackObj.InstallControls(false);
end % function
