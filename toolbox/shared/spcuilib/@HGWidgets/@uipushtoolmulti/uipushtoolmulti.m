function h = uipushtoolmulti(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    h = HGWidgets.uipushtoolmulti;
    % 7 11
    % 8 11
    % 9 11
    if eq(mod(nargin, 2.0), 1.0)
        h.parent = varargin{1.0};
        varargin = varargin(2.0:end);
    end
    if isempty(h.parent)
        h.hbutton = uipushtool;
    else
        h.hbutton = uipushtool(h.parent);
    end
    set(h.hbutton, 'clickedcallback', @(p,e)exec_callback(h));
    % 20 22
    InstallPropertyListeners(h);
    % 22 24
    set(h, varargin{:});
end
function InstallPropertyListeners(h)
    % 26 30
    % 27 30
    % 28 30
    pkg = findpackage('HGWidgets');
    cl = findclass(pkg, 'uipushtoolmulti');
    % 31 33
    h.listeners = handle.listener(h, cl.findprop('Icons'), 'PropertyPostSet', @(p,e)local_update_icontooltip(h));
    % 33 36
    % 34 36
    h.listeners(2.0) = handle.listener(h, cl.findprop('Tooltips'), 'PropertyPostSet', @(p,e)local_update_icontooltip(h));
    % 36 39
    % 37 39
    h.listeners(3.0) = handle.listener(h, cl.findprop('Selection'), 'PropertyPostSet', @(p,e)local_react_to_selection(h));
    % 39 42
    % 40 42
    h.listeners(4.0) = handle.listener(h, cl.findprop('Enable'), 'PropertyPostSet', @(p,e)local_react_to_enable(h));
    % 42 45
    % 43 45
    h.listeners(5.0) = handle.listener(h, cl.findprop('Separator'), 'PropertyPostSet', @(p,e)local_react_to_separator(h));
end
function local_update_icontooltip(obj)
    % 47 61
    % 48 61
    % 49 61
    % 50 61
    % 51 61
    % 52 61
    % 53 61
    % 54 61
    % 55 61
    % 56 61
    % 57 61
    % 58 61
    % 59 61
    maxSel = max(horzcat(1.0, numel(obj.Icons), numel(obj.Tooltips)));
    if gt(obj.Selection, maxSel)
        need_force = eq(obj.Selection, 1.0);
        obj.Selection = 1.0;
        if need_force
            local_react_to_selection(obj);
        end
    else
        % 68 71
        % 69 71
        local_react_to_selection(obj);
    end
end
function local_react_to_selection(obj)
    % 74 79
    % 75 79
    % 76 79
    % 77 79
    i = min(obj.Selection, numel(obj.Tooltips));
    if gt(i, 0.0)
        set(obj.hbutton, 'TooltipString', obj.Tooltips{i});
    end
    % 82 86
    % 83 86
    % 84 86
    i = min(obj.Selection, numel(obj.Icons));
    if gt(i, 0.0)
        set(obj.hbutton, 'CData', obj.Icons{i});
    end
end
function local_react_to_enable(obj)
    % 91 94
    % 92 94
    set(obj.hbutton, 'Enable', obj.Enable);
end
function local_react_to_separator(obj)
    % 96 99
    % 97 99
    set(obj.hbutton, 'separator', obj.Separator);
end
function exec_callback(obj)
    % 101 108
    % 102 108
    % 103 108
    % 104 108
    % 105 108
    % 106 108
    cbFcn = obj.clickedcallback;
    if ~(isempty(cbFcn))
        feval(cbFcn);
    end
end
