function ShowVCRControls(playbackObj, vis)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    htoolbar = playbackObj.parent_toolbar;
    hmenu = playbackObj.parent_menu;
    % 9 11
    if lt(nargin, 2.0)
        vis = true;
    end
    if vis
        icons = HGWidgets.LoadIconFiles('audiotoolbaricons.mat', 'mplay_icons.mat');
        % 15 17
        playbackObj.button_goto_start = uipushtool(htoolbar, 'cdata', icons.goto_start_default, 'tooltip', 'Go to first', 'separator', 'on', 'click', @(hco,ev)playbackObj.GotoStart);
        % 17 23
        % 18 23
        % 19 23
        % 20 23
        % 21 23
        playbackObj.button_rewind = uipushtool(htoolbar, 'cdata', icons.rewind_default, 'tooltip', 'Jump back', 'click', @(hco,ev)playbackObj.Rewind);
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        playbackObj.button_step_back = uipushtool(htoolbar, 'cdata', icons.step_back, 'tooltip', 'Step back', 'click', @(hco,ev)playbackObj.StepBack);
        % 28 33
        % 29 33
        % 30 33
        % 31 33
        playbackObj.button_stop = uipushtool(htoolbar, 'cdata', icons.stop_default, 'tooltip', 'Stop', 'click', @(hco,ev)playbackObj.Stop);
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        playbackObj.button_play = HGWidgets.uipushtoolmulti(htoolbar, 'Icons', cellhorzcat(icons.play_on, icons.pause_default, icons.play_off), 'Tooltips', {'Play','Pause','Resume'}, 'Clicked', @(hco,ev)playbackObj.PlayPause);
        % 38 43
        % 39 43
        % 40 43
        % 41 43
        playbackObj.button_step_fwd = uipushtool(htoolbar, 'cdata', icons.step_fwd, 'tooltip', 'Step forward', 'click', @(hco,ev)playbackObj.StepFwd);
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        playbackObj.button_ffwd = uipushtool(htoolbar, 'cdata', icons.ffwd_default, 'tooltip', 'Jump forward', 'click', @(hco,ev)playbackObj.FFwd);
        % 48 53
        % 49 53
        % 50 53
        % 51 53
        playbackObj.button_goto_end = uipushtool(htoolbar, 'cdata', icons.goto_end_default, 'tooltip', 'Go to last', 'click', @(hco,ev)playbackObj.GotoEnd);
        % 53 59
        % 54 59
        % 55 59
        % 56 59
        % 57 59
        playbackObj.button_jump_to = uipushtool(htoolbar, 'cdata', icons.jump_to, 'separator', 'on', 'tooltip', 'Jump to', 'click', @(hco,ev)playbackObj.JumpToDlg);
        % 59 68
        % 60 68
        % 61 68
        % 62 68
        % 63 68
        % 64 68
        % 65 68
        % 66 68
        labels = HGWidgets.StripMenuAccel({'&Play','&Stop','Re&wind','Fast Fo&rward','Step &Back','Step &Forward','Go to Firs&t','Go to &Last','&Jump to ...'});
        % 68 78
        % 69 78
        % 70 78
        % 71 78
        % 72 78
        % 73 78
        % 74 78
        % 75 78
        % 76 78
        playbackObj.menu_play = uimenu('parent', hmenu, 'label', labels{1.0}, 'callback', @(hco,ev)playbackObj.PlayPause);
        % 78 81
        % 79 81
        playbackObj.menu_stop = uimenu('parent', hmenu, 'label', labels{2.0}, 'callback', @(hco,ev)playbackObj.Stop);
        % 81 84
        % 82 84
        playbackObj.menu_rewind = uimenu('parent', hmenu, 'label', labels{3.0}, 'callback', @(hco,ev)playbackObj.Rewind);
        % 84 87
        % 85 87
        playbackObj.menu_ffwd = uimenu('parent', hmenu, 'label', labels{4.0}, 'callback', @(hco,ev)playbackObj.FFwd);
        % 87 90
        % 88 90
        playbackObj.menu_step_back = uimenu('parent', hmenu, 'label', labels{5.0}, 'callback', @(hco,ev)playbackObj.StepBack);
        % 90 93
        % 91 93
        playbackObj.menu_step_fwd = uimenu('parent', hmenu, 'label', labels{6.0}, 'callback', @(hco,ev)playbackObj.StepFwd);
        % 93 96
        % 94 96
        playbackObj.menu_goto_start = uimenu('parent', hmenu, 'label', labels{7.0}, 'callback', @(hco,ev)playbackObj.GotoStart);
        % 96 99
        % 97 99
        playbackObj.menu_goto_end = uimenu('parent', hmenu, 'label', labels{8.0}, 'callback', @(hco,ev)playbackObj.GotoEnd);
        % 99 103
        % 100 103
        % 101 103
        playbackObj.menu_jump_to = uimenu('parent', hmenu, 'label', labels{9.0}, 'callback', @(hco,ev)playbackObj.JumpToDlg);
    else
        % 104 106
        % 105 113
        % 106 113
        % 107 113
        % 108 113
        % 109 113
        % 110 113
        % 111 113
        playbackObj.ControlVis(0.0);
        % 113 115
        delete(playbackObj.button_goto_end);
        delete(playbackObj.button_ffwd);
        delete(playbackObj.button_step_fwd);
        delete(playbackObj.button_play);
        delete(playbackObj.button_stop);
        delete(playbackObj.button_step_back);
        delete(playbackObj.button_rewind);
        delete(playbackObj.button_goto_start);
        delete(playbackObj.button_jump_to);
        % 123 125
        playbackObj.button_goto_start = [];
        playbackObj.button_rewind = [];
        playbackObj.button_step_back = [];
        playbackObj.button_stop = [];
        playbackObj.button_play = [];
        playbackObj.button_step_fwd = [];
        playbackObj.button_ffwd = [];
        playbackObj.button_goto_end = [];
        playbackObj.button_jump_to = [];
        % 133 137
        % 134 137
        % 135 137
        delete(playbackObj.menu_goto_end);
        delete(playbackObj.menu_ffwd);
        delete(playbackObj.menu_step_fwd);
        delete(playbackObj.menu_play);
        delete(playbackObj.menu_stop);
        delete(playbackObj.menu_step_back);
        delete(playbackObj.menu_rewind);
        delete(playbackObj.menu_goto_start);
        delete(playbackObj.menu_jump_to);
        % 145 147
        playbackObj.menu_goto_start = [];
        playbackObj.menu_rewind = [];
        playbackObj.menu_step_back = [];
        playbackObj.menu_stop = [];
        playbackObj.menu_play = [];
        playbackObj.menu_step_fwd = [];
        playbackObj.menu_ffwd = [];
        playbackObj.menu_goto_end = [];
        playbackObj.menu_jump_to = [];
    end
end
