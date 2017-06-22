function thisrender(this, hFig, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    error(nargchk(2.0, 3.0, nargin));
    % 9 11
    if ishandle(hFig)
        render_sidebar(this, hFig);
    else
        feval(hFig, this, varargin{:});
    end % if
end % function
function render_sidebar(this, hFig)
    % 17 21
    % 18 21
    % 19 21
    sz = sidebar_gui_sizes(this);
    color = get(0.0, 'defaultuicontrolbackgroundcolor');
    set(this, 'FigureHandle', hFig);
    % 23 26
    % 24 26
    h.frame = axes('Parent', hFig, 'Units', 'Pixels', 'Position', sz.frame, 'Visible', 'Off', 'Color', color, 'XTick', [], 'YTick', [], 'XTickLabel', [], 'YTickLabel', [], 'XLim', [0.0 1.0], 'YLim', [0.0 1.0]);
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    h.line(1.0) = line([1.0 1.0], [0.0 1.0], 'color', 'k', 'parent', h.frame, 'Visible', 'Off');
    set(this, 'FigureHandle', hFig);
    h.line(2.0) = line([0.0 0.0 1.0], [0.0 1.0 1.0], 'color', 'w', 'parent', h.frame, 'Visible', 'Off');
    set(h.frame, 'Units', 'Normalized');
    setappdata(h.frame, 'zoomable', 'off');
    h.button = [];
    % 43 45
    set(this, 'Handles', h);
    % 45 50
    % 46 50
    % 47 50
    % 48 50
    Listeners = handle.listener(this, this.findprop('CurrentPanel'), 'PropertyPreSet', @panel_listener);
    % 50 52
    set(Listeners, 'CallbackTarget', this);
    % 52 54
    set(this, 'WhenRenderedListeners', Listeners);
end % function
function renderselectionbutton(this, opts)
    % 56 62
    % 57 62
    % 58 62
    % 59 62
    % 60 62
    h = get(this, 'Handles');
    hFig = get(this, 'FigureHandle');
    % 63 65
    if isfield(opts, 'tooltip')
        tooltip = opts.tooltip;
    else
        tooltip = '';
    end % if
    if isfield(opts, 'icon')
        icon = opts.icon;
    else
        icon = [];
    end % if
    % 74 76
    pos = nextPos(this);
    % 76 79
    % 77 79
    index = plus(length(h.button), 1.0);
    % 79 81
    h.button(index) = uicontrol(hFig, 'style', 'togglebutton', 'position', pos, 'Visible', 'Off', 'Interruptible', 'Off', 'BusyAction', 'Queue', 'callback', cellhorzcat(@selector_cb, this, index), 'tooltip', tooltip, 'cdata', icon, 'tag', 'sidebar_button');
    % 81 92
    % 82 92
    % 83 92
    % 84 92
    % 85 92
    % 86 92
    % 87 92
    % 88 92
    % 89 92
    % 90 92
    set(h.button(index), 'Units', 'Normalized');
    % 92 94
    if isfield(opts, 'csh_tag')
        fdaddcontextmenu(hFig, h.button(index), opts.csh_tag);
    end % if
    % 96 98
    set(this, 'Handles', h);
end % function
function pos = nextPos(this)
    % 100 103
    % 101 103
    sz = sidebar_gui_sizes(this);
    % 103 105
    h = get(this, 'Handles');
    pos = sz.button;
    pos(2.0) = plus(pos(2.0), mtimes(pos(4.0), length(h.button)));
    pos = minus(pos, [1.0 1.0 -1.0 1.0]);
end % function
function sz = sidebar_gui_sizes(this)
    % 110 113
    % 111 113
    sz = this.gui_sizes;
    % 113 115
    fx = mtimes(0.0, sz.pixf);
    fy = mtimes(28.0, sz.pixf);
    fw = mtimes(30.0, sz.pixf);
    fh = mtimes(507.0, sz.pixf);
    % 118 120
    sz.frame = horzcat(fx, fy, fw, fh);
    sz.button = horzcat(fx, fy, fw, fw);
end % function
function selector_cb(hcbo, eventStruct, this, index)
    % 123 126
    % 124 126
    hFig = get(this, 'FigureHandle');
    p = getptr(hFig);
    setptr(hFig, 'watch');
    % 128 131
    % 129 131
    if isempty(getpanelhandle(this, index))
        constructAndSavePanel(this, index);
    end % if
    % 133 135
    set(this, 'currentpanel', index);
    % 135 137
    set(hFig, p{:});
    % 137 139
    sendstatus(this, 'Ready');
end % function
