function varargout = filtermanager(this, mode, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    h = getcomponent(this, '-class', 'siggui.filtermanager');
    % 8 10
    if isempty(h)
        % 10 14
        % 11 14
        % 12 14
        h = siggui.filtermanager;
        addcomponent(this, h);
    end % if
    % 16 18
    if not(isrendered(h))
        render(h);
        centerfigonfig(this, h.figurehandle);
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        l = vertcat(handle.listener(h, 'NewFilter', cellhorzcat(@newfilter_listener, h)), handle.listener(this, 'FilterUpdated', cellhorzcat(@filterupdated_listener, h)));
        % 25 29
        % 26 29
        % 27 29
        set(l, 'CallbackTarget', this);
        setappdata(h.FigureHandle, 'filtermanager_listener', l);
    end % if
    % 31 33
    switch lower(mode)
        % 34 40
        % 35 40
        % 36 40
        % 37 40
        % 38 40
    case {'saveas','save'}
        % 39 41
        l = getappdata(this, 'filtermanager_listener');
        % 41 45
        % 42 45
        % 43 45
        set(l, 'Enabled', 'Off');
        % 45 48
        % 46 48
        sn = getstate(this);
        if isempty(sn.currentName)
            sn.CurrentName = 'Filter';
        end % if
        % 51 53
        if isfield(sn, 'filtermanager')
            sn = rmfield(sn, 'filtermanager');
        end % if
        % 55 57
        sn.mcode = copy(sn.mcode);
        % 57 59
        indx = addfilter(h, sn, varargin{:});
        % 59 61
        if not(isempty(indx))
            % 61 65
            % 62 65
            % 63 65
            set(h, 'SelectedFilters', indx);
            set(h, 'CurrentFilter', indx);
            % 66 68
            set(this, 'FileDirty', true);
        end % if
        set(l, 'Enabled', 'On');
    case 'init'
    otherwise
        % 72 74
        set(h, 'Visible', 'On');
        figure(h.FigureHandle);
    end % switch
    % 76 78
    if nargout
        varargout = cellhorzcat(h);
    end % if
function filterupdated_listener(this, eventData, hm)
    % 81 85
    % 82 85
    % 83 85
    l = getappdata(this, 'filtermanager_listener');
    % 85 89
    % 86 89
    % 87 89
    set(l, 'Enabled', 'Off');
    % 89 91
    if strcmpi(hm.Overwrite, 'on')
        replaceState(hm, this);
    else
        set(hm, 'SelectedFilters', []);
    end % if
    % 95 97
    set(l, 'Enabled', 'On');
function newfilter_listener(this, eventData, hm)
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if eq(hm.CurrentFilter, 0.0)
        return;
    end % if
    % 106 108
    sendstatus(this, 'Loading filter ...')
    % 108 110
    l = getappdata(hm.FigureHandle, 'filtermanager_listener');
    % 110 114
    % 111 114
    % 112 114
    set(l, 'Enabled', 'Off');
    % 114 116
    data = get(hm, 'Data');
    % 116 118
    setstate(this, data.elementat(hm.CurrentFilter));
    % 118 123
    % 119 123
    % 120 123
    % 121 123
    replaceState(hm, this);
    % 123 125
    sendstatus(this, 'Loading filter ... done')
    % 125 127
    set(l, 'Enabled', 'On');
function replaceState(hm, this)
    % 128 132
    % 129 132
    % 130 132
    s = getstate(this);
    s_old = hm.data.elementat(hm.CurrentFilter);
    s.currentName = s_old.currentName;
    if isfield(s, 'filtermanager')
        s = rmfield(s, 'filtermanager');
    end % if
    hm.data.replaceelementat(s, hm.CurrentFilter);
    send(hm, 'NewData');
