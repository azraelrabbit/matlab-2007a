function s = GetTimerState(playbackObj)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    s.isPlaying = playbackObj.state_play;
    s.isStopped = playbackObj.state_stop;
    s.isPaused = playbackObj.state_paused;
end % function
