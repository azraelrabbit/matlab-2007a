function args = CommandLineArgs(dlw)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    playbackRate = dlw.srcObj.playbackControls.framerateObj.desired_fps;
    % 14 16
    if isSerializable(dlw.srcObj)
        % 16 25
        % 17 25
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        importStr = dlw.srcObj.mplayObj.loadexprObj.mlvar;
        % 25 28
        % 26 28
        args = cellhorzcat(cellhorzcat(cellhorzcat(importStr, playbackRate)));
    else
        % 29 38
        % 30 38
        % 31 38
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        args = cellhorzcat(dlw.videoData, playbackRate);
    end % if
end % function
