function playbackObj = PlaybackControlsSimulink(mplayObj, srcObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    playbackObj = MPlay.PlaybackControlsSimulink;
    % 8 9
    playbackObj.InitBase(srcObj);
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    playbackObj.button_connect = mplayObj.widgetsObj.options_toolbar.sl_connect_toggle_button;
    playbackObj.menu_connect = mplayObj.widgetsObj.hmenus.connect_slsig;
end % function
