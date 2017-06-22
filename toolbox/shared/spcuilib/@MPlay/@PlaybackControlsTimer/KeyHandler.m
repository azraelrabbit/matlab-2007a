function keyHit = KeyHandler(playbackObj, eventStruct)
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
    keyHit = true;
    if not(playbackObj.state_play)
        % 15 18
        % 16 18
        switch eventStruct.Key
        case {'rightarrow','pagedown'}
            StepFwd(playbackObj);
            return;
        case {'leftarrow','pageup'}
            StepBack(playbackObj);
            return;
        case 'downarrow'
            FFwd(playbackObj);
            return;
        case 'uparrow'
            Rewind(playbackObj);
            return;
        case {'f','home'}
            GotoStart(playbackObj);
            return;
        case {'l','end'}
            GotoEnd(playbackObj);
            return;
        end % switch
    end % if
    switch eventStruct.Key
    case {'equal','add'}
        ChangeFrameRate(playbackObj, '+');
        return;
    case {'hyphen','subtract'}
        ChangeFrameRate(playbackObj, '-');
        return;
    case {'0','numpad0'}
        ChangeFrameRate(playbackObj, '0');
        return;
    case 't'
        FrameRateDlg(playbackObj);
        return;
    case 'j'
        JumpToDlg(playbackObj);
        return;
    case 's'
        Stop(playbackObj);
        return;
    case {'p','space'}
        PlayPause(playbackObj);
        return;
    case 'r'
        RepeatToggle(playbackObj);
        return;
    case 'a'
        AutoReverseToggle(playbackObj);
        return;
    end % switch
    keyHit = false;
end % function
