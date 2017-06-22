function GotoStart(playbackObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(playbackObj.state_stop)
        % 9 11
        % 10 11
        Stop(playbackObj);
    end % if
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    playbackObj.reversePlay = eq(playbackObj.autorev, 2.0);
    % 21 23
    % 22 23
    srcObj = playbackObj.srcObj;
    if ne(playbackObj.currframe, 1.0)
        playbackObj.currframe = 1.0;
        ShowMovieFrame(srcObj);
    end % if
end % function
