function SnapshotMode(srcObj, action)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    switch action
    case 'button'
        % 19 21
        if local_isSnapshotButtonPressed(srcObj)
            desiredState = 'on';
        else
            desiredState = 'off';
        end % if
    case 'menu'
        % 26 30
        % 27 30
        % 28 30
        dcsObj = srcObj.dataSource;
        if dcsObj.snap_shot
            desiredState = 'off';
        else
            desiredState = 'on';
        end % if
    case {'on','off'}
        % 36 38
        desiredState = action;
    otherwise
        % 39 41
        error('Unrecognized snapshot state: %s', action);
    end % switch
    % 42 44
    local_SetSnapshotMode(srcObj, desiredState);
function local_SetSnapshotMode(srcObj, state)
    % 45 57
    % 46 57
    % 47 57
    % 48 57
    % 49 57
    % 50 57
    % 51 57
    % 52 57
    % 53 57
    % 54 57
    % 55 57
    playbackControls = srcObj.playbackControls;
    hSnapButton = playbackControls.button_simulink_snapshot;
    set(hSnapButton, 'enable', 'on', 'state', state);
    % 59 63
    % 60 63
    % 61 63
    hSnapMenu = playbackControls.menu_simulink_snapshot;
    set(hSnapMenu, 'checked', state);
    % 64 67
    % 65 67
    dcsObj = srcObj.dataSource;
    dcsObj.snap_shot = strcmpi(state, 'on');
    % 68 71
    % 69 71
    update(playbackControls);
function buttonInSnapMode = local_isSnapshotButtonPressed(srcObj)
    % 72 77
    % 73 77
    % 74 77
    % 75 77
    playbackControls = srcObj.playbackControls;
    hSnapButton = playbackControls.button_simulink_snapshot;
    buttonInSnapMode = strcmpi(get(hSnapButton, 'state'), 'on');
