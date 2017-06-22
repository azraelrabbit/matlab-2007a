function playbackObj = PlaybackControlsTimer(mplayObj, srcObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    playbackObj = MPlay.PlaybackControlsTimer;
    % 7 9
    playbackObj.InitBase(srcObj);
    % 9 12
    % 10 12
    playbackObj.timerObj = timer('ExecutionMode', 'fixedRate', 'TimerFcn', @(hco,ev)playbackObj.TimerTick, 'BusyMode', 'drop', 'TasksToExecute', Inf);
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    playbackObj.jumptoObj = MPlay.JumpTo(mplayObj);
    % 19 22
    % 20 22
    playbackObj.framerateObj = MPlay.FrameRate(mplayObj);
    % 22 26
    % 23 26
    % 24 26
    SetStopState(playbackObj);
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    pk = findpackage('MPlay');
    cl = pk.findclass('FrameRate');
    prop = cl.findprop('desired_fps');
    playbackObj.listen_framerate_desired_fps = handle.listener(playbackObj.framerateObj, prop, 'PropertyPostSet', @(hco,ev)playbackObj.ChangeFrameRate);
    % 34 38
    % 35 38
    % 36 38
    prop = cl.findprop('sched_rateMin');
    playbackObj.listen_framerate_desired_fps(2.0) = handle.listener(playbackObj.framerateObj, prop, 'PropertyPostSet', @(hco,ev)playbackObj.ChangeFrameRate);
    % 39 43
    % 40 43
    % 41 43
    prop = cl.findprop('sched_rateMax');
    playbackObj.listen_framerate_desired_fps(3.0) = handle.listener(playbackObj.framerateObj, prop, 'PropertyPostSet', @(hco,ev)playbackObj.ChangeFrameRate);
    % 44 48
    % 45 48
    % 46 48
    prop = cl.findprop('sched_enable');
    playbackObj.listen_framerate_desired_fps(4.0) = handle.listener(playbackObj.framerateObj, prop, 'PropertyPostSet', @(hco,ev)playbackObj.ChangeFrameRate);
    % 49 51
end
