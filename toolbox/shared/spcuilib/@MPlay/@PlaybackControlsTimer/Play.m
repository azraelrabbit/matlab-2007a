function Play(playbackObj)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    persistent PlayMethodFlowControl;
    if isempty(PlayMethodFlowControl)
        PlayMethodFlowControl = 1.0;
        srcObj = playbackObj.srcObj;
        % 15 17
        if not(playbackObj.state_play)
            if playbackObj.state_paused
                % 18 21
                % 19 21
                playbackObj.nextframe = playbackObj.currframe;
            else
                % 22 24
                if eq(playbackObj.autorev, 2.0)
                    % 24 27
                    % 25 27
                    playbackObj.reversePlay = true;
                    playbackObj.nextframe = srcObj.dataSource.numFrames;
                else
                    % 29 31
                    playbackObj.reversePlay = false;
                    playbackObj.nextframe = 1.0;
                end
            end
            % 34 37
            % 35 37
            SetPlayState(playbackObj);
            % 37 44
            % 38 44
            % 39 44
            % 40 44
            % 41 44
            % 42 44
            playbackObj.button_play.Selection = 2.0;
            set(playbackObj.menu_play, 'label', 'Pause');
            % 45 49
            % 46 49
            % 47 49
            UpdateVCRControls(playbackObj);
            % 49 53
            % 50 53
            % 51 53
            start(playbackObj.timerObj);
        end
        % 54 56
        send(srcObj.mplayObj, 'PlayEvent');
        PlayMethodFlowControl = [];
    end
end
