function args = CommandLineArgs(dcf)
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
    playbackRate = dcf.srcObj.playbackControls.framerateObj.desired_fps;
    % 13 15
    % 14 15
    args = cellhorzcat(dcf.sourceName, playbackRate);
end % function
