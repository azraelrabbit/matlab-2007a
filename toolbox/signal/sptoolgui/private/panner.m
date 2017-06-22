function varargout = panner(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if lt(nargin, 1.0)
        action = 'init';
    else
        action = varargin{1.0};
    end % if
    % 11 13
    switch lower(action)
        % 14 19
        % 15 19
        % 16 19
        % 17 19
    case 'motion'
        % 18 20
        fig = varargin{2.0};
        ud = get(fig, 'userdata');
        panaxes = ud.panner.panaxes;
        p = get(panaxes, 'currentpoint');
        panpatch = ud.panner.panpatch;
        xd = get(panpatch, 'xdata');
        yd = get(panpatch, 'ydata');
        varargout{1.0} = pinrect(p(1.0, 1.0:2.0), horzcat(xd([1.0 2.0]), yd([1.0 3.0])));
        % 28 33
        % 29 33
        % 30 33
        % 31 33
    case 'init'
        % 32 35
        % 33 35
        if lt(nargin, 2.0)
            fig = gcf;
        else
            fig = varargin{2.0};
        end % if
        % 39 41
        ud = get(fig, 'userdata');
        % 41 44
        % 42 44
        panaxes = axes('parent', fig, 'tag', 'panaxes', 'box', 'off', 'units', 'pixels', 'xlim', ud.limits.xlim, 'ylim', ud.limits.ylim, 'xtick', [], 'ytick', []);
        % 44 54
        % 45 54
        % 46 54
        % 47 54
        % 48 54
        % 49 54
        % 50 54
        % 51 54
        % 52 54
        edgecolor = get(panaxes, 'xcolor');
        % 54 56
        pc = get(panaxes, 'color');
        if not(isstr(pc))
            set(panaxes, 'xcolor', pc)
            set(panaxes, 'ycolor', pc)
        else
            fc = get(fig, 'color');
            set(panaxes, 'xcolor', fc)
            set(panaxes, 'ycolor', fc)
        end % if
        % 64 66
        set(get(panaxes, 'ylabel'), 'string', 'Panner', 'tag', 'pannerxlabel', 'color', edgecolor, 'fontsize', 8.0)
        % 66 69
        % 67 69
        ud.panner.panaxes = panaxes;
        % 69 71
        xlim = get(ud.mainaxes, 'xlim');
        ylim = get(ud.mainaxes, 'ylim');
        xd = xlim([1.0 2.0 2.0 1.0 1.0]);
        yd = ylim([1.0 1.0 2.0 2.0 1.0]);
        panpatch = patch(xd, yd, [1.0 1.0 1.0], 'facecolor', pc, 'erasemode', 'xor', 'parent', panaxes, 'tag', 'panpatch', 'edgecolor', edgecolor, 'buttondownfcn', 'sbswitch(''pandown'',0)');
        % 75 86
        % 76 86
        % 77 86
        % 78 86
        % 79 86
        % 80 86
        % 81 86
        % 82 86
        % 83 86
        % 84 86
        set(panpatch, 'facecolor', 'none')
        ud.panner.panpatch = panpatch;
        % 87 89
        ud.prefs.tool.panner = 1.0;
        % 89 91
        set(fig, 'userdata', ud)
        % 91 93
        panner('resize', 1.0, fig)
        % 93 95
        set(fig, 'resizefcn', appstr(get(fig, 'resizefcn'), 'sbswitch(''panner'',''resize'')'))
        % 96 104
        % 97 104
        % 98 104
        % 99 104
        % 100 104
        % 101 104
        % 102 104
    case 'close'
        % 103 105
        fig = varargin{2.0};
        ud = get(fig, 'userdata');
        ud.prefs.tool.panner = 0.0;
        delete(findobj(fig, 'tag', 'panaxes'))
        % 108 110
        ud.linecache.ph = [];
        ud.linecache.phh = [];
        % 111 113
        for i=1.0:length(ud.lines)
            ud.lines.ph = [];
        end % for
        % 115 117
        set(fig, 'resizefcn', remstr(get(fig, 'resizefcn'), 'sbswitch(''panner'',''resize'')'))
        % 117 119
        set(fig, 'userdata', ud)
        % 120 125
        % 121 125
        % 122 125
        % 123 125
    case 'resize'
        % 124 126
        if ge(nargin, 2.0)
            create_flag = varargin{2.0};
        else
            create_flag = 0.0;
        end % if
        if ge(nargin, 3.0)
            fig = varargin{3.0};
        else
            fig = gcbf;
        end % if
        % 135 137
        ud = get(fig, 'userdata');
        sz = ud.sz;
        % 138 140
        fp = get(fig, 'position');
        % 140 142
        toolbar_ht = 0.0;
        % 142 144
        ruler_port = horzcat(0.0, 0.0, fp(3.0), mtimes(sz.rh, ud.prefs.tool.ruler));
        panner_port = horzcat(0.0, ruler_port(4.0), fp(3.0), mtimes(sz.ph, ud.prefs.tool.panner));
        % 145 157
        % 146 157
        % 147 157
        % 148 157
        % 149 157
        % 150 157
        % 151 157
        % 152 157
        % 153 157
        % 154 157
        % 155 157
        ex = [0.0 0.0 0.0 0.0];
        if ispc
            tweak = 5.0;
        else
            tweak = 0.0;
        end % if
        pan_pos = plus(panner_port, horzcat(sz.ffs, plus(plus(sz.ffs, ex(4.0)), tweak), mtimes(-2.0, sz.ffs), minus(minus(uminus(sz.ffs), ex(4.0)), tweak)));
        % 163 166
        % 164 166
        ax_pos = get(ud.mainaxes, 'position');
        pan_pos(1.0) = ax_pos(1.0);
        pan_pos(3.0) = ax_pos(3.0);
        set(ud.panner.panaxes, 'position', pan_pos)
        % 170 176
        % 171 176
        % 172 176
        % 173 176
        % 174 176
    case 'update'
        % 175 177
        if ge(nargin, 2.0)
            fig = varargin{2.0};
        else
            fig = gcf;
        end % if
        ud = get(fig, 'userdata');
        panaxes = ud.panner.panaxes;
        xlim = get(ud.mainaxes, 'xlim');
        ylim = get(ud.mainaxes, 'ylim');
        panpatch = ud.panner.panpatch;
        setpdata(panpatch, xlim, ylim)
        % 188 192
        % 189 192
        % 190 192
    case 'zoom'
        % 191 193
        xlim = varargin{2.0};
        ylim = varargin{3.0};
        if gt(nargin, 3.0)
            fig = varargin{4.0};
        else
            fig = gcf;
        end % if
        ud = get(fig, 'userdata');
        panpatch = ud.panner.panpatch;
        setpdata(panpatch, xlim, ylim)
        % 202 204
    end % switch
function setpdata(panpatch, xlim, ylim)
    % 205 210
    % 206 210
    % 207 210
    % 208 210
    set(panpatch, 'xdata', horzcat(xlim(1.0), xlim(2.0), xlim(2.0), xlim(1.0), xlim(1.0)), 'ydata', horzcat(ylim(1.0), ylim(1.0), ylim(2.0), ylim(2.0), ylim(1.0)))
