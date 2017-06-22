function ShowOptionsControls(playbackObj, vis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 2.0)
        vis = true;
    end
    if vis
        icons = HGWidgets.LoadIconFiles('mplay_icons.mat');
        htoolbar = playbackObj.parent_toolbar;
        srcObj = playbackObj.srcObj;
        % 13 15
        playbackObj.button_simulink_snapshot = uitoggletool(htoolbar, 'cdata', icons.snapshot, 'state', 'off', 'separator', 'on', 'tooltip', 'Snapshot (freeze display)', 'click', @(hco,ev)srcObj.SnapshotMode('button'));
        % 15 22
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        playbackObj.button_simulink_hilite = uipushtool(htoolbar, 'cdata', icons.signal_highlight, 'tooltip', 'Highlight Simulink signal', 'click', @(hco,ev)srcObj.flash);
        % 22 28
        % 23 28
        % 24 28
        % 25 28
        % 26 28
        playbackObj.button_simulink_floating = HGWidgets.uitoggletoolmulti(htoolbar, 'Icons', cellhorzcat(icons.signal_locked, icons.signal_unlocked), 'Tooltips', {'Persistent Simulink connection','Floating Simulink connection'}, 'State', 'on', 'click', @(hco,ev)playbackObj.ConnectionMode('button'));
        % 28 38
        % 29 38
        % 30 38
        % 31 38
        % 32 38
        % 33 38
        % 34 38
        % 35 38
        % 36 38
        labels = HGWidgets.StripMenuAccel({'Simulink &Snapshot','High&light Simulink Signal','Floating Simulink &Connection'});
        % 38 41
        % 39 41
        hmenu = playbackObj.parent_menu;
        % 41 43
        playbackObj.menu_simulink_snapshot = uimenu('parent', hmenu, 'label', labels{1.0}, 'separator', 'on', 'checked', 'off', 'callback', @(hco,ev)srcObj.SnapshotMode('menu'));
        % 43 49
        % 44 49
        % 45 49
        % 46 49
        % 47 49
        playbackObj.menu_simulink_hilite = uimenu('parent', hmenu, 'label', labels{2.0}, 'accel', 'L', 'callback', @(hco,ev)srcObj.flash);
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        playbackObj.menu_simulink_floating = uimenu('parent', hmenu, 'label', labels{3.0}, 'checked', 'off', 'callback', @(hco,ev)playbackObj.ConnectionMode('menu'));
    else
        % 55 58
        % 56 58
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        playbackObj.ControlVis(0.0);
        % 62 66
        % 63 66
        % 64 66
        delete(playbackObj.button_simulink_snapshot);
        delete(playbackObj.button_simulink_hilite);
        delete(playbackObj.button_simulink_floating);
        % 68 70
        playbackObj.button_simulink_snapshot = [];
        playbackObj.button_simulink_hilite = [];
        playbackObj.button_simulink_floating = [];
        % 72 76
        % 73 76
        % 74 76
        delete(playbackObj.menu_simulink_snapshot);
        delete(playbackObj.menu_simulink_hilite);
        delete(playbackObj.menu_simulink_floating);
        % 78 80
        playbackObj.menu_simulink_snapshot = [];
        playbackObj.menu_simulink_hilite = [];
        playbackObj.menu_simulink_floating = [];
    end
end
