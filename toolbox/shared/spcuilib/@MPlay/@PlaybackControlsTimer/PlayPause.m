function PlayPause(playbackObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if playbackObj.state_play
        Pause(playbackObj);
    else
        Play(playbackObj);
    end % if
end % function
