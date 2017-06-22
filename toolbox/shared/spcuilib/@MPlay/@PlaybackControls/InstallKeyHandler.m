function InstallKeyHandler(playbackObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    set(playbackObj.hfig, 'KeyPressFcn', @KeyHandlerCommon);
end % function
function KeyHandlerCommon(hfig, eventStruct)
    % 10 24
    % 11 24
    % 12 24
    % 13 24
    % 14 24
    % 15 24
    % 16 24
    % 17 24
    % 18 24
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    ctrl = any(strcmpi(eventStruct.Modifier, 'control'));
    alt = any(strcmpi(eventStruct.Modifier, 'alt'));
    if ctrl || alt
        return;
    end % if
    % 29 34
    % 30 34
    % 31 34
    % 32 34
    % 33 34
    mplayObj = get(hfig, 'userdata');
    playbackObj = mplayObj.datasourceObj.playbackControls;
    % 36 49
    % 37 49
    % 38 49
    % 39 49
    % 40 49
    % 41 49
    % 42 49
    % 43 49
    % 44 49
    % 45 49
    % 46 49
    % 47 49
    % 48 49
    if not(playbackObj.disableInput) && playbackObj.KeyHandler(eventStruct)
        return;
    end % if
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    switch eventStruct.Key
    case 'insert'
        % 58 59
        MPlay.New(mplayObj);
    case 'c'
        ColorMapDlg(mplayObj);
    case 'n'
        PreferencesDlg(mplayObj);
    case 'v'
        VideoInfoDlg(mplayObj);
    case 'k'
        KeyHelpDlg(mplayObj);
    end % switch
end % function
