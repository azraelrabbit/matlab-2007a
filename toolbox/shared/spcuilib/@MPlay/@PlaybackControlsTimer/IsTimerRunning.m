function isRunning = IsTimerRunning(playbackObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    isRunning = strcmpi(playbackObj.timerObj.running, 'on');
end % function
