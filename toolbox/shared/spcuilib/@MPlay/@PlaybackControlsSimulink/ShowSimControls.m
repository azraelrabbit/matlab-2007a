function ShowSimControls(playbackObj, vis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        vis = true;
    end
    if vis
        icons = HGWidgets.LoadIconFiles('audiotoolbaricons.mat', 'mplay_icons.mat');
        htoolbar = playbackObj.parent_toolbar;
        % 12 14
        playbackObj.button_simulink_stop = uipushtool(htoolbar, 'cdata', icons.stop_default, 'tooltip', 'Stop simulation', 'click', @(hco,ev)playbackObj.SL_Stop);
        % 14 19
        % 15 19
        % 16 19
        % 17 19
        playbackObj.button_simulink_play = HGWidgets.uipushtoolmulti(htoolbar, 'Icons', cellhorzcat(icons.play_on, icons.pause_default, icons.play_off), 'Tooltips', {'Start simulation','Pause simulation','Continue simulation'}, 'Clicked', @(hco,ev)playbackObj.SL_PlayPause);
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        playbackObj.button_simulink_step_fwd = uipushtool(htoolbar, 'cdata', icons.step_fwd, 'tooltip', 'Simulate one step', 'click', @(hco,ev)playbackObj.SL_StepFwd);
        % 24 32
        % 25 32
        % 26 32
        % 27 32
        % 28 32
        % 29 32
        % 30 32
        labels = HGWidgets.StripMenuAccel({'&Play','&Stop','Step &Forward'});
        hmenu = playbackObj.parent_menu;
        % 33 35
        playbackObj.menu_simulink_play = uimenu('parent', hmenu, 'label', labels{1.0}, 'callback', @(hco,ev)playbackObj.SL_PlayPause);
        % 35 38
        % 36 38
        playbackObj.menu_simulink_stop = uimenu('parent', hmenu, 'label', labels{2.0}, 'callback', @(hco,ev)playbackObj.SL_Stop);
        % 38 41
        % 39 41
        playbackObj.menu_simulink_step_fwd = uimenu('parent', hmenu, 'label', labels{3.0}, 'callback', @(hco,ev)playbackObj.SL_StepFwd);
    else
        % 42 44
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        playbackObj.ControlVis(0.0);
        % 48 52
        % 49 52
        % 50 52
        delete(playbackObj.button_simulink_stop);
        delete(playbackObj.button_simulink_play);
        delete(playbackObj.button_simulink_step_fwd);
        % 54 56
        playbackObj.button_simulink_stop = [];
        playbackObj.button_simulink_play = [];
        playbackObj.button_simulink_step_fwd = [];
        % 58 62
        % 59 62
        % 60 62
        delete(playbackObj.menu_simulink_stop);
        delete(playbackObj.menu_simulink_play);
        delete(playbackObj.menu_simulink_step_fwd);
        % 64 66
        playbackObj.menu_simulink_stop = [];
        playbackObj.menu_simulink_play = [];
        playbackObj.menu_simulink_step_fwd = [];
    end
end
