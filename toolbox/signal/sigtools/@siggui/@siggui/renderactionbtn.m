function renderactionbtn(this, pos, str, method, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    error(nargchk(4.0, 5.0, nargin));
    % 12 14
    sz = gui_sizes(this);
    cbs = siggui_cbs(this);
    % 15 17
    width = plus(largestuiwidth(cellhorzcat(str)), mtimes(20.0, sz.pixf));
    % 17 19
    if ischar(method)
        field = lower(method);
    else
        field = lower(func2str(method));
    end
    tag = horzcat(get(classhandle(this), 'Name'), '_', field);
    h = get(this, 'Handles');
    h.(field) = uicontrol(this.FigureHandle, 'String', str, 'Style', 'PushButton', 'HorizontalAlignment', 'Center', 'Tag', tag, 'Visible', 'Off', 'Position', horzcat(plus(pos(1.0), mrdivide(minus(pos(3.0), width), 2.0)), plus(pos(2.0), sz.vfus), width, sz.bh), 'Callback', cellhorzcat(cbs.method, this, method, varargin{:}));
    % 26 35
    % 27 35
    % 28 35
    % 29 35
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    set(this, 'Handles', h);
    % 35 37
    [cshtags, cshtool] = getcshtags(this);
    if isfield(cshtags, field)
        cshelpcontextmenu(h.(field), cshtags.(field), cshtool);
    end
end
