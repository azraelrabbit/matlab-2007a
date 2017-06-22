function schema
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    pkg = findpackage('spcwidgets');
    this = schema.class(pkg, 'uistatusbase');
    % 13 26
    % 14 26
    % 15 26
    % 16 26
    % 17 26
    % 18 26
    % 19 26
    % 20 26
    % 21 26
    % 22 26
    % 23 26
    % 24 26
    % 25 26
    p = schema.prop(this, 'GrabBar', 'on/off');
    p.FactoryValue = 'on';
    % 28 39
    % 29 39
    % 30 39
    % 31 39
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    p = schema.prop(this, 'OptionWidths', 'MATLAB array');
    p.FactoryValue = [];
    % 41 42
    schema.prop(this, 'Parent', 'handle');
    % 43 44
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'on';
    % 46 50
    % 47 50
    % 48 50
    % 49 50
    p = schema.prop(this, 'hContainer', 'MATLAB array');
    p.Visible = 'off';
    % 52 55
    % 53 55
    % 54 55
    p = schema.prop(this, 'hAllOptions', 'MATLAB array');
    p.Visible = 'off';
    % 57 59
    % 58 59
    p = schema.prop(this, 'hStatusText', 'MATLAB array');
    p.Visible = 'off';
    % 61 63
    % 62 63
    p = schema.prop(this, 'hOptionText', 'MATLAB array');
    p.Visible = 'off';
    % 65 66
    p = schema.prop(this, 'listeners', 'handle.listener vector');
    p.Visible = 'off';
end % function
