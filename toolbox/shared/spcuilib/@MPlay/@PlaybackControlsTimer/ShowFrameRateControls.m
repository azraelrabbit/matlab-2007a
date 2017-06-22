function ShowFrameRateControls(playbackObj, vis)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    mPlayback = playbackObj.parent_menu;
    % 7 9
    if lt(nargin, 2.0)
        vis = true;
    end
    if vis
        labels = HGWidgets.StripMenuAccel({'&Frame Rate...'});
        playbackObj.menu_frame_rate = uimenu('parent', mPlayback, 'label', labels{1.0}, 'callback', @(hco,ev)playbackObj.FrameRateDlg, 'separator', 'on');
    else
        % 15 18
        % 16 18
        % 17 24
        % 18 24
        % 19 24
        % 20 24
        % 21 24
        % 22 24
        delete(playbackObj.framerateObj);
        % 24 28
        % 25 28
        % 26 28
        delete(playbackObj.menu_frame_rate);
        playbackObj.menu_frame_rate = [];
    end
end
