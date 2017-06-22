function schema
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkg = findpackage('MPlay');
    this = schema.class(pkg, 'PlaybackControls');
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    findclass(pkg, 'MPlayer');
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    p = schema.prop(this, 'disableInput', 'bool');
    p.AccessFlags.PublicSet = 'off';
    p.FactoryValue = false;
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    cl = findclass(pkg, 'Source');
    schema.prop(this, 'srcObj', 'MPlay.Source');
    % 29 30
    schema.prop(this, 'hfig', 'MATLAB array');
    schema.prop(this, 'parent_toolbar', 'MATLAB array');
    schema.prop(this, 'parent_menu', 'MATLAB array');
    schema.prop(this, 'parent_menu_tools', 'MATLAB array');
    % 34 35
    hgw_pkg = findpackage('HGWidgets');
    cl = findclass(hgw_pkg, 'uistatusbar');
    p = schema.prop(this, 'status_bar', 'HGWidgets.uistatusbar');
    % 38 41
    % 39 41
    % 40 41
    schema.prop(this, 'button_connect', 'MATLAB array');
    schema.prop(this, 'menu_connect', 'MATLAB array');
end % function
