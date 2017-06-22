function OptionsToolbarToggle(mplayObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    mplayObj.preferencesObj.OptionsToolbar = not(mplayObj.preferencesObj.OptionsToolbar);
    % 8 29
    % 9 29
    % 10 29
    % 11 29
    % 12 29
    % 13 29
    % 14 29
    % 15 29
    % 16 29
    % 17 29
    % 18 29
    % 19 29
    % 20 29
    % 21 29
    % 22 29
    % 23 29
    % 24 29
    % 25 29
    % 26 29
    % 27 29
    reorderFix = mplayObj.preferencesObj.OptionsToolbar && mplayObj.preferencesObj.PlaybackToolbar;
    % 29 32
    % 30 32
    if reorderFix
        % 32 34
        SetPlaybackToolbar(mplayObj.widgetsObj, false);
        % 34 39
        % 35 39
        % 36 39
        % 37 39
        drawnow;
    end
    % 40 44
    % 41 44
    % 42 44
    SetOptionsToolbar(mplayObj.widgetsObj, mplayObj.preferencesObj.OptionsToolbar);
    % 44 47
    % 45 47
    if reorderFix
        % 47 49
        SetPlaybackToolbar(mplayObj.widgetsObj, true);
    end
end
