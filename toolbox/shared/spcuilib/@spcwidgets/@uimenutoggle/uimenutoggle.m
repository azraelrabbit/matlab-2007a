function h = uimenutoggle(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h = spcwidgets.uimenutoggle;
    % 7 11
    % 8 11
    % 9 11
    if eq(mod(nargin, 2.0), 1.0)
        h.parent = varargin{1.0};
        varargin = varargin(2.0:end);
    end
    % 14 16
    if isempty(h.parent)
        h.hmenu = uimenu;
    else
        h.hmenu = uimenu(h.parent);
    end
    set(h.hmenu, 'Callback', @(p,e)exec_callback(h));
    % 21 23
    InstallPropertyListeners(h);
    % 23 25
    set(h, varargin{:});
end
function InstallPropertyListeners(h)
    % 27 31
    % 28 31
    % 29 31
    h.listeners = handle.listener(h, h.findprop('Accelerator'), 'PropertyPostSet', @(p,e)local_auto_update(h));
    % 31 34
    % 32 34
    h.listeners(2.0) = handle.listener(h, h.findprop('Checked'), 'PropertyPostSet', @(p,e)local_react_to_checked(h));
    % 34 37
    % 35 37
    h.listeners(3.0) = handle.listener(h, h.findprop('Enable'), 'PropertyPostSet', @(p,e)local_react_to_enable(h));
    % 37 40
    % 38 40
    h.listeners(4.0) = handle.listener(h, h.findprop('Label'), 'PropertyPostSet', @(p,e)local_auto_update(h));
    % 40 43
    % 41 43
    h.listeners(5.0) = handle.listener(h, h.findprop('Separator'), 'PropertyPostSet', @(p,e)local_react_to_separator(h));
    % 43 46
    % 44 46
    h.listeners(6.0) = handle.listener(h, h.findprop('Visible'), 'PropertyPostSet', @(p,e)local_react_to_visible(h));
    % 46 49
    % 47 49
    h.listeners(7.0) = handle.listener(h, h.findprop('Tag'), 'PropertyPostSet', @(p,e)local_react_to_tag(h));
end
function local_react_to_checked(obj)
    % 51 55
    % 52 55
    % 53 55
    set(obj.hmenu, 'Checked', obj.Checked);
    % 55 57
    local_auto_update(obj);
end
function local_react_to_enable(obj)
    % 59 62
    % 60 62
    set(obj.hmenu, 'Enable', obj.Enable);
end
function local_react_to_separator(obj)
    % 64 67
    % 65 67
    set(obj.hmenu, 'Separator', obj.Separator);
end
function local_react_to_visible(obj)
    % 69 72
    % 70 72
    set(obj.hmenu, 'Visible', obj.Visible);
end
function local_react_to_tag(obj)
    % 74 77
    % 75 77
    set(obj.hmenu, 'Tag', obj.Tag);
end
function exec_callback(obj)
    % 79 84
    % 80 84
    % 81 84
    % 82 84
    if strcmpi(obj.Checked, 'on')
        s = 'off';
    else
        s = 'on';
    end
    % 88 92
    % 89 92
    % 90 92
    obj.listeners(2.0).enable = 'off';
    obj.Checked = s;
    obj.listeners(2.0).enable = 'on';
    % 94 104
    % 95 104
    % 96 104
    % 97 104
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if strcmpi(obj.Checked, s)
        % 104 108
        % 105 108
        % 106 108
        local_auto_update(obj, 1.0);
        % 108 111
        % 109 111
        if ~(isempty(obj.Callback))
            if ischar(obj.Callback)
                eval(obj.Callback);
            else
                % 114 120
                % 115 120
                % 116 120
                % 117 120
                % 118 120
                feval(obj.Callback, obj, []);
            end
        end
    end
end
function local_auto_update(obj, dir)
    % 125 129
    % 126 129
    % 127 129
    if lt(nargin, 2.0)
        % 129 133
        % 130 133
        % 131 133
        dir = 0.0;
    end
    % 134 136
    if dir
        set(obj.hmenu, 'Checked', obj.Checked);
    else
        % 138 140
        obj.listeners(2.0).enable = 'off';
        obj.Checked = get(obj.hmenu, 'Checked');
        obj.listeners(2.0).enable = 'on';
    end
    % 143 145
    switch obj.Checked
    case 'on'
        select = 1.0;
    otherwise
        % 148 150
        select = max(horzcat(1.0, numel(obj.Labels), numel(obj.Accelerators)));
    end
    % 151 154
    % 152 154
    i = min(select, numel(obj.Accelerators));
    if gt(i, 0.0)
        set(obj.hmenu, 'Accelerator', obj.Accelerators{i});
    end
    % 157 161
    % 158 161
    % 159 161
    i = min(select, numel(obj.Labels));
    if gt(i, 0.0)
        set(obj.hmenu, 'Label', obj.Labels{i});
    end
end
