function sz = fdatool_gui_sizes(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    sz = gui_sizes(this);
    % 8 10
    sz.fig_w = 770.0;
    sz.fig_h = 549.0;
    % 11 13
    if isrendered(this) && ishandle(this.FigureHandle)
        hFig = get(this, 'FigureHandle');
        origUnits = get(hFig, 'Units');
        set(hFig, 'Units', 'Pixels');
        sz.figpos = get(hFig, 'Position');
        set(hFig, 'Units', origUnits);
    else
        sz.figpos = figpos(sz);
    end % if
    sz.defaultpanel = mtimes([34.0 25.0 732.0 248.0], sz.pixf);
    sz.panel = sz.defaultpanel;
    if isrendered(this) && ishandle(this.Figurehandle)
        % 24 27
        % 25 27
        h = get(this, 'Handles');
        if isfield(h, 'recessedFr')
            % 28 33
            % 29 33
            % 30 33
            % 31 33
            hrf = h.recessedFr(1.0);
            origUnits = get(hrf, 'Units');
            set(hrf, 'Units', 'Pixels');
            sz.panel = get(hrf, 'Position');
            set(hrf, 'Units', origUnits);
        end % if
    end % if
    sz.fh1 = mtimes(252.0, sz.pixf);
    sz.fh2 = mtimes(81.0, sz.pixf);
    sz.fh3 = mtimes(109.0, sz.pixf);
    sz.fh4 = mtimes(35.0, sz.pixf);
    sz.fh5 = mtimes(76.0, sz.pixf);
    sz.fh6 = mtimes(176.0, sz.pixf);
    sz.fh7 = mtimes(205.0, sz.pixf);
    sz.fh8 = mtimes(20.0, sz.pixf);
    sz.fh9 = mtimes(248.0, sz.pixf);
    sz.fh10 = mtimes(61.0, sz.pixf);
    % 49 51
    sz.fw1 = mtimes(178.0, sz.pixf);
    % 51 53
    sz.fw2 = mtimes(548.0, sz.pixf);
    sz.fw3 = mtimes(356.0, sz.pixf);
    sz.fw4 = mtimes(715.0, sz.pixf);
    sz.fw5 = mtimes(713.0, sz.pixf);
    sz.fw6 = mtimes(732.0, sz.pixf);
    % 57 60
    % 58 60
    sz.fy1 = mtimes(282.0, sz.pixf);
    sz.fy2 = mtimes(358.0, sz.pixf);
    sz.fy3 = mtimes(55.0, sz.pixf);
    sz.fy4 = mtimes(151.0, sz.pixf);
    sz.fy5 = mtimes(32.0, sz.pixf);
    sz.fy6 = mtimes(28.0, sz.pixf);
    % 65 68
    % 66 68
    sz.fx1 = mtimes(34.0, sz.pixf);
    sz.fx2 = mtimes(217.0, sz.pixf);
    sz.fx3 = mtimes(400.0, sz.pixf);
    sz.fx4 = mtimes(583.0, sz.pixf);
    sz.fx5 = mtimes(40.0, sz.pixf);
    sz.fx6 = mtimes(34.0, sz.pixf);
end % function
function figurePos = figpos(sz)
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    oldRootUnits = get(0.0, 'Units');
    set(0.0, 'Units', 'pixels');
    % 81 84
    % 82 84
    figurePos = get(0.0, 'DefaultFigurePosition');
    figurePos(3.0:4.0) = horzcat(sz.fig_w, sz.fig_h);
    figurePos = mtimes(figurePos, sz.pixf);
    % 86 89
    % 87 89
    rootScreenSize = get(0.0, 'ScreenSize');
    % 89 93
    % 90 93
    % 91 93
    if lt(figurePos(1.0), 1.0) || gt(plus(figurePos(1.0), figurePos(3.0)), rootScreenSize(3.0))
        % 93 95
        figurePos(1.0) = 30.0;
    end % if
    % 96 99
    % 97 99
    if lt(figurePos(2.0), 1.0) || gt(plus(figurePos(2.0), figurePos(4.0)), rootScreenSize(4.0))
        % 99 101
        figurePos(2.0) = minus(figurePos(2.0), minus(plus(plus(figurePos(2.0), figurePos(4.0)), 100.0), rootScreenSize(4.0)));
    end % if
    % 102 104
    set(0.0, 'Units', oldRootUnits);
end % function
