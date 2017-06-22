function h = uitoggletool(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h = spcwidgets.uitoggletool;
    % 7 11
    % 8 11
    % 9 11
    if eq(mod(nargin, 2.0), 1.0)
        h.parent = varargin{1.0};
        varargin = varargin(2.0:end);
    end
    % 14 16
    if isempty(h.parent)
        h.hbutton = builtin('uitoggletool');
    else
        h.hbutton = builtin('uitoggletool', h.parent);
    end
    set(h.hbutton, 'oncallback', @(p,e)exec_callback(h,'oncallback'));
    set(h.hbutton, 'offcallback', @(p,e)exec_callback(h,'offcallback'));
    set(h.hbutton, 'clickedcallback', @(p,e)exec_callback(h,'clickedcallback'));
    % 23 25
    InstallPropertyListeners(h);
    % 25 27
    set(h, varargin{:});
end
function InstallPropertyListeners(h)
    % 29 33
    % 30 33
    % 31 33
    h.listeners = handle.listener(h, h.findprop('Icons'), 'PropertyPostSet', @(p,e)local_auto_update(h));
    % 33 36
    % 34 36
    h.listeners(2.0) = handle.listener(h, h.findprop('Tooltips'), 'PropertyPostSet', @(p,e)local_auto_update(h));
    % 36 39
    % 37 39
    h.listeners(3.0) = handle.listener(h, h.findprop('State'), 'PropertyPostSet', @(p,e)local_react_to_state(h));
    % 39 42
    % 40 42
    h.listeners(4.0) = handle.listener(h, h.findprop('Enable'), 'PropertyPostSet', @(p,e)local_react_to_enable(h));
    % 42 45
    % 43 45
    h.listeners(5.0) = handle.listener(h, h.findprop('Separator'), 'PropertyPostSet', @(p,e)local_react_to_separator(h));
    % 45 48
    % 46 48
    h.listeners(6.0) = handle.listener(h, h.findprop('Visible'), 'PropertyPostSet', @(p,e)local_react_to_visible(h));
end
function local_react_to_state(obj)
    % 50 54
    % 51 54
    % 52 54
    set(obj.hbutton, 'State', obj.State);
    % 54 56
    local_auto_update(obj);
end
function local_react_to_enable(obj)
    % 58 61
    % 59 61
    set(obj.hbutton, 'Enable', obj.Enable);
end
function local_react_to_visible(obj)
    % 63 66
    % 64 66
    set(obj.hbutton, 'Visible', obj.Visible);
end
function local_react_to_separator(obj)
    % 68 71
    % 69 71
    set(obj.hbutton, 'separator', obj.Separator);
end
function exec_callback(obj, prop)
    % 73 82
    % 74 82
    % 75 82
    % 76 82
    % 77 82
    % 78 82
    % 79 82
    % 80 82
    local_auto_update(obj);
    cbFcn = obj.(prop);
    if ~(isempty(cbFcn))
        if ischar(cbFcn)
            % 85 87
            eval(cbFcn);
        else
            % 88 92
            % 89 92
            % 90 92
            feval(cbFcn, obj, []);
        end
    end
end
function local_auto_update(obj)
    % 96 101
    % 97 101
    % 98 101
    % 99 101
    obj.listeners(3.0).enable = 'off';
    obj.State = get(obj.hbutton, 'State');
    obj.listeners(3.0).enable = 'on';
    % 103 105
    switch obj.State
    case 'on'
        select = 1.0;
    otherwise
        % 108 110
        select = max(horzcat(1.0, numel(obj.Icons), numel(obj.Tooltips)));
    end
    % 111 114
    % 112 114
    i = min(select, numel(obj.Tooltips));
    if gt(i, 0.0)
        set(obj.hbutton, 'TooltipString', obj.Tooltips{i});
    end
    % 117 121
    % 118 121
    % 119 121
    i = min(select, numel(obj.Icons));
    if gt(i, 0.0)
        set(obj.hbutton, 'CData', obj.Icons{i});
    end
end
