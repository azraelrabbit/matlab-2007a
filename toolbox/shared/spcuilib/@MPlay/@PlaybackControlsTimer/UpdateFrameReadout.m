function UpdateFrameReadout(playbackObj)
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
    srcObj = playbackObj.srcObj;
    dataSrc = srcObj.dataSource;
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    str = sprintf('%d / %d', playbackObj.currframe, dataSrc.numFrames);
    % 23 25
    if gt(playbackObj.autorev, 1.0)
        % 25 27
        if playbackObj.reversePlay
            str = horzcat('-', str);
        else
            str = horzcat('+', str);
        end % if
        % 31 35
        % 32 35
        % 33 35
    end % if
    % 35 39
    % 36 39
    % 37 39
    playbackObj.status_bar.OptionText(3.0, str);
end % function
