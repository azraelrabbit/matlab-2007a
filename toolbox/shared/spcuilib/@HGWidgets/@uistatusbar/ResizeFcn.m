function ResizeFcn(hStatusBar, ev)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if strcmp(hStatusBar.Visible, 'on')
        % 9 11
        set(hStatusBar.parent, 'units', 'pixel');
        fig_pos = get(hStatusBar.parent, 'pos');
        frame_pos = get(hStatusBar.hRegionFrame, 'pos');
        frame_rt = minus(plus(frame_pos(1.0), frame_pos(3.0)), 4.0);
        delta_x = minus(fig_pos(3.0), frame_rt);
        % 15 30
        % 16 30
        % 17 30
        % 18 30
        % 19 30
        % 20 30
        % 21 30
        % 22 30
        % 23 30
        % 24 30
        % 25 30
        % 26 30
        % 27 30
        % 28 30
        ext = get(hStatusBar.hStatusText, 'Extent');
        statusTxtRt = plus(ext(1.0), ext(3.0));
        % 31 34
        % 32 34
        isOverlap = false;
        nOpts = hStatusBar.NumOptions;
        for i=1.0:nOpts
            keep = eq(i, nOpts);
            hOpt = get(hStatusBar.hAllOptions(i), 'children');
            isOverlap = local_adjust(hOpt, delta_x, statusTxtRt, keep);
        end % for
        % 40 44
        % 41 44
        % 42 44
        pos = frame_pos;
        pos(3.0) = plus(pos(3.0), delta_x);
        set(hStatusBar.hRegionFrame, 'pos', pos);
        % 46 49
        % 47 49
        if isOverlap
            s = 'off';
        else
            s = 'on';
        end % if
        set(hStatusBar.hStatusText, 'vis', s);
    end % if
end % function
function isOverlap = local_adjust(hIndent, delta_x, statusTxtRt, keep)
    % 57 60
    % 58 60
    isOverlap = false;
    for i=1.0:numel(hIndent)
        pos = get(hIndent(i), 'pos');
        pos(1.0) = plus(pos(1.0), delta_x);
        set(hIndent(i), 'pos', pos);
        % 64 66
        if lt(pos(1.0), statusTxtRt)
            isOverlap = true;
        end % if
    end % for
    if not(keep)
        % 70 72
        if isOverlap
            s = 'off';
        else
            s = 'on';
        end % if
        set(hIndent, 'vis', s);
    end % if
end % function
