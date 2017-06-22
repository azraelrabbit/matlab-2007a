function GotoEnd(playbackObj)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    if not(playbackObj.state_stop)
        Stop(playbackObj);
    end % if
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    playbackObj.reversePlay = eq(playbackObj.autorev, 2.0);
    % 30 31
    srcObj = playbackObj.srcObj;
    numFrames = srcObj.dataSource.numFrames;
    if ne(playbackObj.currframe, numFrames)
        playbackObj.currframe = numFrames;
        ShowMovieFrame(srcObj);
    end % if
end % function
