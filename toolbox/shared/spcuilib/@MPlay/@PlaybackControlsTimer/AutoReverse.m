function AutoReverse(playbackObj, sel)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if lt(nargin, 2.0)
        % 10 11
        sel = playbackObj.autorev;
    else
        % 13 14
        playbackObj.autorev = sel;
        % 15 22
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        % 21 22
        if eq(playbackObj.autorev, 2.0)
            playbackObj.reversePlay = true;
        else
            playbackObj.reversePlay = false;
        end % if
    end % if
    % 28 31
    % 29 31
    % 30 31
    playbackObj.button_autorev.Select = sel;
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    set(playbackObj.menu_autorev, 'checked', 'off');
    set(playbackObj.menu_autorev(sel), 'checked', 'on');
    % 38 40
    % 39 40
    UpdateFrameReadout(playbackObj);
    local_UpdateFrameReadoutTooltip(playbackObj);
end % function
function local_UpdateFrameReadoutTooltip(playbackObj)
    % 44 48
    % 45 48
    % 46 48
    % 47 48
    tStr = 'Current Frame / Total Frames';
    if gt(playbackObj.autorev, 1.0)
        % 50 51
        tStr = horzcat(tStr, sprintf('\n'), '+Fwd dir, -Bkwd dir');
    end % if
    % 53 54
    playbackObj.status_bar.OptionTooltip(3.0, tStr);
end % function
