function UpdateImageForColormap(srcObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    playbackObj = srcObj.playbackControls;
    % 11 12
    if not(playbackObj.state_play)
        % 13 23
        % 14 23
        % 15 23
        % 16 23
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        % 22 23
        ShowMovieFrame(srcObj);
        % 24 27
        % 25 27
        % 26 27
        refresh(playbackObj.hfig);
    end % if
end % function
