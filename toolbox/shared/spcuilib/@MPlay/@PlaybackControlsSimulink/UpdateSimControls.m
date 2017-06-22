function UpdateSimControls(playbackObj)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    sim = local_SimState(playbackObj);
    % 14 18
    % 15 18
    % 16 18
    if sim.isStopped
        accel = '';
    else
        accel = 'T';
    end % if
    set(playbackObj.menu_simulink_stop, 'accel', accel);
    % 23 26
    % 24 26
    if sim.isRunning
        % 26 28
        button_select = 2.0;
        mlabel = 'Pause';
        accel = '';
    else
        if sim.isStopped
            button_select = 1.0;
            mlabel = 'Start';
            accel = 'T';
        else
            button_select = 3.0;
            mlabel = 'Continue';
            accel = '';
        end % if
    end % if
    set(playbackObj.button_simulink_play, 'Selection', button_select);
    set(playbackObj.menu_simulink_play, 'label', mlabel, 'accel', accel);
    % 43 45
    local_EnableSimulinkStopControls(playbackObj, not(sim.isStopped));
    % 45 53
    % 46 53
    % 47 53
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    local_EnableSimulinkStepControls(playbackObj, true);
    % 53 55
    local_UpdateStatusText(playbackObj, sim);
end % function
function local_UpdateStatusText(playbackObj, sim)
    % 57 61
    % 58 61
    % 59 61
    dcsObj = playbackObj.srcObj.dataSource;
    % 61 63
    if dcsObj.snap_shot
        str = 'Frozen';
    else
        if sim.isDisconnected
            str = 'Disconnected';
        else
            if sim.isStopped
                str = 'Ready';
            else
                if sim.isPaused
                    str = 'Paused';
                else
                    str = 'Running';
                end % if
            end % if
        end % if
    end % if
    playbackObj.status_bar.StatusText(str);
end % function
function status = local_SimState(playbackObj)
    simState = GetSimState(playbackObj.srcObj.dataSource);
    status.isPaused = false;
    status.isRunning = false;
    status.isStopped = false;
    status.isDisconnected = any(strcmpi(simState, {'closed','disconnected'}));
    if not(status.isDisconnected)
        status.isStopped = strcmpi(simState, 'stopped');
        if not(status.isStopped)
            % 90 93
            % 91 93
            status.isPaused = strcmpi(simState, 'paused');
            if not(status.isPaused)
                status.isRunning = not(strcmpi(simState, 'stopped'));
            end % if
        end % if
    end % if
end % function
function local_SetSnapshotToggle(playbackObj, snapshot)
    % 100 103
    % 101 103
    if snapshot
        s = 'on';
    else
        s = 'off';
    end % if
    set(playbackObj.button_simulink_snapshot, 'state', s);
    set(playbackObj.menu_simulink_snapshot, 'checked', s);
end % function
function local_EnableSimulinkStepControls(playbackObj, ena)
    if ena
        s = 'on';
    else
        s = 'off';
    end % if
    set(horzcat(playbackObj.button_simulink_step_fwd, playbackObj.menu_simulink_step_fwd), 'enable', s);
end % function
function local_EnableSimulinkStopControls(playbackObj, ena)
    % 119 121
    if ena
        s = 'on';
    else
        s = 'off';
    end % if
    set(horzcat(playbackObj.button_simulink_stop, playbackObj.menu_simulink_stop), 'enable', s);
end % function
