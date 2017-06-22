function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uistatusbar');
    % 9 11
    p = schema.prop(this, 'Callback', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_callback;
    p.SetFunction = @sf_callback;
    % 14 16
    p = schema.prop(this, 'Children', 'MATLAB array');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_children;
    p.SetFunction = @sf_children;
    % 19 21
    p = schema.prop(this, 'Enable', 'on/off');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_enable;
    p.SetFunction = @sf_enable;
    % 24 26
    p = schema.prop(this, 'GrabBar', 'on/off');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_grabbar;
    p.SetFunction = @sf_grabbar;
    % 29 37
    % 30 37
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    p = schema.prop(this, 'OptionWidths', 'MATLAB array');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_optionwidths;
    p.SetFunction = @sf_optionwidths;
    % 40 42
    schema.prop(this, 'Tag', 'string');
    % 42 44
    p = schema.prop(this, 'Text', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_text;
    p.SetFunction = @sf_text;
    % 47 49
    p = schema.prop(this, 'Tooltip', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_tooltip;
    p.SetFunction = @sf_tooltip;
    % 52 54
    p = schema.prop(this, 'Type', 'string');
    p.FactoryValue = 'spcwidgets.uistatusbar';
    p.SetFunction = @sf_type;
    % 56 58
    p = schema.prop(this, 'Visible', 'on/off');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_visible;
    p.SetFunction = @sf_visible;
    % 61 67
    % 62 67
    % 63 67
    % 64 67
    % 65 67
    findclass(pkg, 'uistatusbase');
    p = schema.prop(this, 'hWidget', 'spcwidgets.uistatusbase');
    p.Visible = 'off';
    % 69 72
    % 70 72
    p = schema.prop(this, 'TextHandle', 'handle');
    p.FactoryValue = [];
    p.Visible = 'off';
end % function
function str = sf_text(h, str)
    % 76 78
    StatusText(h.hWidget, str);
end % function
function str = gf_text(h, str)
    if ishandle(h)
        str = StatusText(h.hWidget);
    end % if
end % function
function str = sf_tooltip(h, str)
    % 85 87
    StatusTooltip(h.hWidget, str);
end % function
function str = gf_tooltip(h, str)
    if ishandle(h)
        str = StatusTooltip(h.hWidget);
    end % if
end % function
function state = sf_grabbar(h, state)
    % 94 96
    if ishandle(h)
        h.hWidget.GrabBar = state;
    end % if
end % function
function state = gf_grabbar(h, state)
    % 100 102
    if ishandle(h)
        state = h.hWidget.GrabBar;
    end % if
end % function
function str = sf_callback(h, str)
    % 106 108
    if ishandle(h)
        StatusCallback(h.hWidget, str);
    end % if
end % function
function str = gf_callback(h, str)
    if ishandle(h)
        str = StatusCallback(h.hWidget);
    end % if
end % function
function ena = sf_enable(h, ena)
    % 117 119
    if ishandle(h)
        StatusEnable(h.hWidget, ena);
    end % if
end % function
function ena = gf_enable(h, ena)
    % 123 125
    if ishandle(h)
        ena = StatusEnable(h.hWidget);
    end % if
end % function
function state = sf_visible(h, state)
    if ishandle(h)
        h.hWidget.Visible = state;
    end % if
end % function
function state = gf_visible(h, state)
    % 134 136
    if ishandle(h)
        state = h.hWidget.Visible;
    end % if
end % function
function s = sf_optionwidths(h, s)
    % 140 142
    error('spcwidgets:uistatusbar:ReadOnly', 'OptionWidths is read-only.');
end % function
function s = gf_optionwidths(h, s)
    % 144 146
    if ishandle(h)
        s = h.hWidget.OptionWidths;
    end % if
end % function
function s = sf_children(h, s)
    % 150 152
    error('spcwidgets:uistatusbar:ReadOnly', 'Children is read-only.');
end % function
function s = gf_children(h, s)
    % 154 160
    % 155 160
    % 156 160
    % 157 160
    % 158 160
    s = [];
    if not(isempty(h))
        hc = h.down('last');
            while not(isempty(hc))
            s = horzcat(s, hc);
            hc = hc.left;
        end % while
    end % if
end % function
function val = sf_type(obj, val)
    % 169 171
    if not(isempty(obj.Type))
        error('Property is read-only.');
    end % if
end % function
