function Repeat(playbackObj, doRepeat)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if lt(nargin, 2.0)
        % 9 10
        doRepeat = playbackObj.repeatMode;
    else
        % 12 13
        playbackObj.repeatMode = doRepeat;
    end % if
    % 15 16
    if doRepeat
        state = 'on';
    else
        state = 'off';
    end % if
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    playbackObj.button_repeat.State = state;
    % 28 31
    % 29 31
    % 30 31
    set(playbackObj.menu_repeat, 'checked', state);
end % function
