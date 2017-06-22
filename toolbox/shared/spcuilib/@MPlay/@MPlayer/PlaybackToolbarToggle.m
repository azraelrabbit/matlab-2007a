function PlaybackToolbarToggle(mplayObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    mplayObj.preferencesObj.PlaybackToolbar = not(mplayObj.preferencesObj.PlaybackToolbar);
    % 9 11
    % 10 11
    SetPlaybackToolbar(mplayObj.widgetsObj, mplayObj.preferencesObj.PlaybackToolbar);
end % function
