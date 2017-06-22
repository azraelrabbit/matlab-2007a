function Stop(playbackObj, forPause)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if playbackObj.state_stop
        % 9 12
        % 10 12
        mplayObj = playbackObj.srcObj.mplayObj;
        send(mplayObj, 'StopEvent');
    else
        % 14 16
        if flow_control(1.0)
            % 16 19
            % 17 19
            if lt(nargin, 2.0)
                forPause = false;
            end
            if IsTimerRunning(playbackObj)
                set(playbackObj.timerObj, 'StopFcn', @(hco,ev)local_Stop_continue(playbackObj,forPause));
                stop(playbackObj.timerObj);
            else
                % 25 28
                % 26 28
                local_Stop_continue(playbackObj, forPause);
            end
        end
    end
end
function local_Stop_continue(playbackObj, forPause)
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    srcObj = playbackObj.srcObj;
    if ~(forPause)
        SetStopState(playbackObj);
        % 41 45
        % 42 45
        % 43 45
        playbackObj.button_play.Selection = 1.0;
        set(playbackObj.menu_play, 'label', 'Play');
        % 46 48
        UpdateVCRControls(playbackObj);
        % 48 50
        ShowMovieFrame(srcObj);
    end
    flow_control(0.0);
    send(srcObj.mplayObj, 'StopEvent');
end
function canTake = flow_control(request)
    % 55 64
    % 56 64
    % 57 64
    % 58 64
    % 59 64
    % 60 64
    % 61 64
    % 62 64
    persistent StopMethodFlowControl;
    canTake = isempty(StopMethodFlowControl);
    if canTake && eq(request, 1.0)
        StopMethodFlowControl = 1.0;
    else
        if eq(request, 0.0)
            StopMethodFlowControl = [];
        end
    end
end
