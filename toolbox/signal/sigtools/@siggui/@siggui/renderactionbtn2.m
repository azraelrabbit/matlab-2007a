function renderactionbtn2(this, row, col, str, method, varargin)
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
    if ischar(method)
        field = lower(method);
    else
        field = lower(func2str(method));
    end
    tag = horzcat(get(classhandle(this), 'Name'), '_', field);
    hPanel = get(this, 'Container');
    hLayout = get(this, 'Layout');
    if isempty(hLayout)
        hLayout = siglayout.gridbaglayout(hPanel);
        set(this, 'Layout', hLayout);
    end
    h = get(this, 'Handles');
    % 29 31
    h.(field) = uicontrol(hPanel, 'String', str, 'Style', 'PushButton', 'HorizontalAlignment', 'Center', 'Tag', tag, 'Callback', cellhorzcat(cbs.method, this, method, varargin{:}));
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    set(this, 'Handles', h);
    % 38 40
    hLayout.add(h.(field), row, col, 'MinimumHeight', sz.uh, 'minimumwidth', plus(largestuiwidth(h.(field)), mtimes(20.0, sz.pixf)));
    % 40 44
    % 41 44
    % 42 44
    [cshtags, cshtool] = getcshtags(this);
    if isfield(cshtags, field)
        cshelpcontextmenu(h.(field), cshtags.(field), cshtool);
    end
end
