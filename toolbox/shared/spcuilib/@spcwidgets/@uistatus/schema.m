function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uistatus');
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    p = schema.prop(this, 'Callback', 'MATLAB array');
    % 16 17
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_callback;
    p.SetFunction = @sf_callback;
    % 20 21
    p = schema.prop(this, 'Enable', 'on/off');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_enable;
    p.SetFunction = @sf_enable;
    % 25 27
    % 26 27
    p = schema.prop(this, 'Index', 'int');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_index;
    p.SetFunction = @sf_index;
    % 31 32
    schema.prop(this, 'Tag', 'string');
    % 33 34
    p = schema.prop(this, 'Text', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_text;
    p.SetFunction = @sf_text;
    % 38 39
    p = schema.prop(this, 'Tooltip', 'string');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_tooltip;
    p.SetFunction = @sf_tooltip;
    % 43 44
    p = schema.prop(this, 'Truncate', 'on/off');
    p.AccessFlags.Init = 'off';
    p.GetFunction = @gf_trunc;
    p.SetFunction = @sf_trunc;
    % 48 49
    p = schema.prop(this, 'Visible', 'on/off');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @sf_visible;
    p.GetFunction = @gf_visible;
    % 53 54
    p = schema.prop(this, 'Width', 'int');
    p.AccessFlags.Init = 'off';
    p.SetFunction = @sf_width;
    p.GetFunction = @gf_width;
    % 58 63
    % 59 63
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(this, 'TextHandle', 'handle');
    p.FactoryValue = [];
    p.Visible = 'off';
    % 66 68
    % 67 68
    p = schema.prop(this, 'privateIndex', 'int');
    p.Visible = 'off';
end % function
function val = sf_width(h, val)
    % 72 73
    if ishandle(h)
        % 74 75
        h.up.hWidget.OptionWidths(h.privateIndex) = val;
    end % if
end % function
function val = gf_width(h, val)
    if ishandle(h)
        % 80 81
        val = h.up.hWidget.OptionWidths(h.privateIndex);
    end % if
end % function
function val = sf_index(h, val)
    % 85 86
    error('spcwidgets:uistatus:ReadOnly', 'Index is read-only.');
end % function
function val = gf_index(h, val)
    % 89 90
    val = h.privateIndex;
end % function
function str = sf_text(h, str)
    % 93 94
    if ishandle(h)
        OptionText(h.up.hWidget, h.privateIndex, str);
    end % if
end % function
function str = gf_text(h, str)
    if ishandle(h)
        str = OptionText(h.up.hWidget, h.privateIndex);
    end % if
end % function
function str = sf_tooltip(h, str)
    % 104 105
    if ishandle(h)
        OptionTooltip(h.up.hWidget, h.privateIndex, str);
    end % if
end % function
function str = gf_tooltip(h, str)
    if ishandle(h)
        str = OptionTooltip(h.up.hWidget, h.privateIndex);
    end % if
end % function
function str = sf_callback(h, str)
    % 115 116
    if ishandle(h)
        OptionCallback(h.up.hWidget, h.privateIndex, str);
    end % if
end % function
function str = gf_callback(h, str)
    if ishandle(h)
        str = OptionCallback(h.up.hWidget, h.privateIndex);
    end % if
end % function
function ena = sf_enable(h, ena)
    % 126 127
    if ishandle(h)
        OptionEnable(h.up.hWidget, h.privateIndex, ena);
    end % if
end % function
function ena = gf_enable(h, ena)
    if ishandle(h)
        ena = OptionEnable(h.up.hWidget, h.privateIndex);
    end % if
end % function
function vis = sf_visible(h, vis)
    % 137 138
    if ishandle(h)
        OptionVisible(h.up.hWidget, h.privateIndex, vis);
    end % if
end % function
function vis = gf_visible(h, vis)
    if ishandle(h)
        vis = OptionVisible(h.up.hWidget, h.privateIndex);
    end % if
end % function
function trunc = sf_trunc(h, trunc)
    % 148 149
    if ishandle(h)
        OptionTruncate(h.up.hWidget, h.privateIndex, trunc);
    end % if
end % function
function trunc = gf_trunc(h, trunc)
    if ishandle(h)
        trunc = OptionTruncate(h.up.hWidget, h.privateIndex);
    end % if
end % function
