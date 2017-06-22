function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    hCreateInPackage = findpackage('MPlay');
    this = schema.class(hCreateInPackage, 'Listeners');
    % 9 12
    % 10 12
    % 11 12
    p = schema.prop(this, 'datasource', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p = schema.prop(this, 'pref_srcname', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    p = schema.prop(this, 'scaling', 'handle.listener');
    p.AccessFlags.PublicSet = 'off';
    p = schema.prop(this, 'initialDir', 'handle.listener vector');
    p.AccessFlags.PublicSet = 'off';
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    schema.prop(this, 'StopMethod', 'handle.listener');
    schema.prop(this, 'PauseMethod', 'handle.listener');
    schema.prop(this, 'NewMovieMethod', 'handle.listener');
    % 33 37
    % 34 37
    % 35 37
    % 36 37
    schema.prop(this, 'ConnectToDataSource', 'handle.listener');
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    schema.prop(this, 'UserFcn', 'MATLAB array');
    schema.prop(this, 'UserData', 'MATLAB array');
end % function
