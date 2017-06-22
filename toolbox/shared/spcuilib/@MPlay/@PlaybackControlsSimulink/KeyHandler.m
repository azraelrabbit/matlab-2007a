function keyHit = KeyHandler(playbackObj, eventStruct)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    keyHit = true;
    % 17 20
    % 18 20
    switch eventStruct.Key
    case 's'
        SL_Stop(playbackObj);
        return;
    case {'p','space'}
        SL_PlayPause(playbackObj);
        return;
    case {'rightarrow','pagedown'}
        SL_StepFwd(playbackObj);
        return;
    end % switch
    keyHit = false;
end % function
