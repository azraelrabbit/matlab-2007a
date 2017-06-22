function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('MPlay');
    base = findclass(pkg, 'PlaybackControls');
    this = schema.class(pkg, 'PlaybackControlsTimer', base);
    % 10 13
    % 11 13
    % 12 13
    schema.prop(this, 'timerObj', 'MATLAB array');
    % 14 17
    % 15 17
    % 16 17
    findclass(pkg, 'JumpTo');
    schema.prop(this, 'jumptoObj', 'MPlay.JumpTo');
    % 19 20
    findclass(pkg, 'FrameRate');
    schema.prop(this, 'framerateObj', 'MPlay.FrameRate');
    % 22 23
    p = schema.prop(this, 'listen_framerate_desired_fps', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    % 25 29
    % 26 29
    % 27 29
    % 28 29
    p = schema.prop(this, 'menu_frame_rate', 'MATLAB array');
    % 30 33
    % 31 33
    % 32 33
    p = schema.prop(this, 'menu_goto_start', 'MATLAB array');
    p = schema.prop(this, 'menu_rewind', 'MATLAB array');
    p = schema.prop(this, 'menu_step_back', 'MATLAB array');
    p = schema.prop(this, 'menu_stop', 'MATLAB array');
    p = schema.prop(this, 'menu_play', 'MATLAB array');
    p = schema.prop(this, 'menu_step_fwd', 'MATLAB array');
    p = schema.prop(this, 'menu_ffwd', 'MATLAB array');
    p = schema.prop(this, 'menu_goto_end', 'MATLAB array');
    % 41 42
    p = schema.prop(this, 'menu_jump_to', 'MATLAB array');
    p = schema.prop(this, 'menu_repeat', 'MATLAB array');
    p = schema.prop(this, 'menu_autorev', 'MATLAB array');
    % 45 48
    % 46 48
    % 47 48
    p = schema.prop(this, 'button_goto_start', 'MATLAB array');
    p = schema.prop(this, 'button_rewind', 'MATLAB array');
    p = schema.prop(this, 'button_step_back', 'MATLAB array');
    p = schema.prop(this, 'button_stop', 'MATLAB array');
    p = schema.prop(this, 'button_play', 'MATLAB array');
    p = schema.prop(this, 'button_step_fwd', 'MATLAB array');
    p = schema.prop(this, 'button_ffwd', 'MATLAB array');
    p = schema.prop(this, 'button_goto_end', 'MATLAB array');
    % 56 57
    p = schema.prop(this, 'button_jump_to', 'MATLAB array');
    p = schema.prop(this, 'button_repeat', 'MATLAB array');
    p = schema.prop(this, 'button_autorev', 'MATLAB array');
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    % 64 65
    p = schema.prop(this, 'currframe', 'double');
    p.FactoryValue = 0.0;
    % 67 69
    % 68 69
    p = schema.prop(this, 'nextframe', 'double');
    p.FactoryValue = 1.0;
    % 71 73
    % 72 73
    p = schema.prop(this, 'repeatMode', 'bool');
    p.FactoryValue = false;
    % 75 78
    % 76 78
    % 77 78
    p = schema.prop(this, 'autorev', 'double');
    p.FactoryValue = 1.0;
    % 80 82
    % 81 82
    p = schema.prop(this, 'reversePlay', 'bool');
    p.FactoryValue = false;
    % 84 88
    % 85 88
    % 86 88
    % 87 88
    p = schema.prop(this, 'stepsize', 'double');
    p.FactoryValue = 10.0;
    % 90 97
    % 91 97
    % 92 97
    % 93 97
    % 94 97
    % 95 97
    % 96 97
    p = schema.prop(this, 'state_paused', 'bool');
    p.FactoryValue = false;
    p.AccessFlags.PublicSet = 'off';
    % 100 101
    p = schema.prop(this, 'state_stop', 'bool');
    p.FactoryValue = true;
    p.AccessFlags.PublicSet = 'off';
    % 104 105
    p = schema.prop(this, 'state_play', 'bool');
    p.FactoryValue = false;
    p.AccessFlags.PublicSet = 'off';
end % function
