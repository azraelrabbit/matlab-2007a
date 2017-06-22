function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('MPlay');
    this = schema.class(hCreateInPackage, 'Widgets');
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(this, 'hfig', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 15 17
    % 16 17
    p = schema.prop(this, 'haxis', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 19 24
    % 20 24
    % 21 24
    % 22 24
    % 23 24
    p = schema.prop(this, 'himage', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 26 29
    % 27 29
    % 28 29
    p = schema.prop(this, 'himageTxt', 'mxArray');
    p.AccessFlags.PublicSet = 'off';
    % 31 34
    % 32 34
    % 33 34
    p = schema.prop(this, 'hmenus', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 36 39
    % 37 39
    % 38 39
    p = schema.prop(this, 'options_toolbar', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 41 44
    % 42 44
    % 43 44
    p = schema.prop(this, 'playback_toolbar', 'MATLAB array');
    p.AccessFlags.PublicSet = 'off';
    % 46 49
    % 47 49
    % 48 49
    hgw_pkg = findpackage('HGWidgets');
    cl = findclass(hgw_pkg, 'uistatusbar');
    p = schema.prop(this, 'hStatusBar', 'HGWidgets.uistatusbar');
    p.AccessFlags.PublicSet = 'off';
    % 53 56
    % 54 56
    % 55 56
    p = schema.prop(this, 'hScrollPanel', 'MATLAB array');
    p = schema.prop(this, 'hMagCombo', 'MATLAB array');
    p = schema.prop(this, 'hMagComboAPI', 'MATLAB array');
    % 59 62
    % 60 62
    % 61 62
    p = schema.prop(this, 'FitToViewState', 'bool');
    p.FactoryValue = false;
    % 64 67
    % 65 67
    % 66 67
    p = schema.prop(this, 'hPixelRegion', 'MATLAB array');
end % function
