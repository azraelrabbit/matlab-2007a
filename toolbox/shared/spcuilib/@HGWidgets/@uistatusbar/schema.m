function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    pkg = findpackage('HGWidgets');
    this = schema.class(pkg, 'uistatusbar');
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    p = schema.prop(this, 'parent', 'MATLAB array');
    % 16 18
    p = schema.prop(this, 'BackgroundColor', 'MATLAB array');
    p.FactoryValue = [.8 .8 .8];
    % 19 21
    p = schema.prop(this, 'OptionWidths', 'MATLAB array');
    p.FactoryValue = [40.0 40.0];
    % 22 24
    p = schema.prop(this, 'Visible', 'on/off');
    p.FactoryValue = 'on';
    % 25 27
    p = schema.prop(this, 'AutoResize', 'on/off');
    p.FactoryValue = 'on';
    % 28 33
    % 29 33
    % 30 33
    % 31 33
    hg_pk = findpackage('hg');
    % 33 36
    % 34 36
    findclass(hg_pk, 'uicontainer');
    schema.prop(this, 'hContainer', 'MATLAB array');
    % 37 39
    schema.prop(this, 'hStatusAndOptions', 'MATLAB array');
    % 39 42
    % 40 42
    schema.prop(this, 'hAllOptions', 'MATLAB array');
    % 42 45
    % 43 45
    findclass(hg_pk, 'uicontrol');
    schema.prop(this, 'hRegionFrame', 'MATLAB array');
    % 46 49
    % 47 49
    schema.prop(this, 'hStatusText', 'MATLAB array');
    % 49 52
    % 50 52
    schema.prop(this, 'hOptionText', 'MATLAB array');
    % 52 54
    schema.prop(this, 'listeners', 'handle.listener vector');
end % function
