function Pause(playbackObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if playbackObj.state_paused
        % 8 18
        % 9 18
        % 10 18
        % 11 18
        % 12 18
        % 13 18
        % 14 18
        % 15 18
        % 16 18
        local_Pause_continue([], [], playbackObj);
    else
        if flow_control(1.0)
            % 20 23
            % 21 23
            if playbackObj.state_stop
                % 23 25
                local_Pause_continue([], [], playbackObj);
            else
                % 26 30
                % 27 30
                % 28 30
                mplayObj = playbackObj.srcObj.mplayObj;
                mplayObj.listenObj.StopMethod.Callback = cellhorzcat(@local_Pause_continue, playbackObj);
                mplayObj.listenObj.StopMethod.Enabled = 'on';
                % 32 36
                % 33 36
                % 34 36
                Stop(playbackObj, true)
            end
        end
    end
end
function local_Pause_continue(hco, eventStruct, playbackObj)
    % 41 45
    % 42 45
    % 43 45
    srcObj = playbackObj.srcObj;
    mplayObj = srcObj.mplayObj;
    mplayObj.listenObj.StopMethod.Enabled = 'off';
    % 47 51
    % 48 51
    % 49 51
    SetPauseState(playbackObj);
    % 51 55
    % 52 55
    % 53 55
    playbackObj.button_play.Selection = 3.0;
    set(playbackObj.menu_play, 'label', 'Resume');
    % 56 58
    UpdateVCRControls(playbackObj);
    ShowMovieFrame(srcObj);
    % 59 61
    flow_control(0.0);
    send(mplayObj, 'PauseEvent');
end
function canTake = flow_control(request)
    % 64 73
    % 65 73
    % 66 73
    % 67 73
    % 68 73
    % 69 73
    % 70 73
    % 71 73
    persistent PauseMethodFlowControl;
    canTake = isempty(PauseMethodFlowControl);
    if canTake && eq(request, 1.0)
        PauseMethodFlowControl = 1.0;
    else
        if eq(request, 0.0)
            PauseMethodFlowControl = [];
        end
    end
end
