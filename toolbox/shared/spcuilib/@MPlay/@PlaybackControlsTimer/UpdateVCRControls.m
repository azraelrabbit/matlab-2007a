function UpdateVCRControls(playbackObj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if playbackObj.state_paused || playbackObj.state_play
        s = 'on';
    else
        s = 'off';
    end % if
    h = horzcat(playbackObj.button_stop, playbackObj.menu_stop);
    set(h, 'enable', s);
    % 15 19
    % 16 19
    % 17 19
    if playbackObj.state_paused || playbackObj.state_stop
        s = 'on';
    else
        s = 'off';
    end % if
    h = horzcat(playbackObj.button_step_back, playbackObj.button_step_fwd, playbackObj.button_goto_start, playbackObj.button_rewind, playbackObj.button_step_back, playbackObj.button_step_fwd, playbackObj.button_ffwd, playbackObj.button_goto_end, playbackObj.button_jump_to, playbackObj.menu_step_back, playbackObj.menu_step_fwd, playbackObj.menu_goto_start, playbackObj.menu_rewind, playbackObj.menu_step_back, playbackObj.menu_step_fwd, playbackObj.menu_ffwd, playbackObj.menu_goto_end, playbackObj.menu_jump_to);
    % 24 42
    % 25 42
    % 26 42
    % 27 42
    % 28 42
    % 29 42
    % 30 42
    % 31 42
    % 32 42
    % 33 42
    % 34 42
    % 35 42
    % 36 42
    % 37 42
    % 38 42
    % 39 42
    % 40 42
    set(h, 'enable', s);
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    if playbackObj.state_stop
        str = 'Stopped';
    else
        if playbackObj.state_paused
            str = 'Paused';
        else
            str = 'Playing';
        end % if
    end % if
    playbackObj.status_bar.StatusText(str);
end % function
