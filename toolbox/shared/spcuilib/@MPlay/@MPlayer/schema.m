function schema
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    package = findpackage('MPlay');
    this = schema.class(package, 'MPlayer');
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    p = schema.prop(this, 'instance', 'double');
    p.AccessFlags.PublicSet = 'off';
    % 20 23
    % 21 23
    % 22 23
    p = schema.prop(this, 'conversionFcn', 'MATLAB array');
    p.FactoryValue = [];
    % 25 26
    findclass(package, 'ColorMap');
    schema.prop(this, 'colorMapObj', 'MPlay.ColorMap');
    % 28 29
    findclass(package, 'Source');
    schema.prop(this, 'datasourceObj', 'MPlay.Source');
    % 31 32
    p = schema.prop(this, 'imtoolObj', 'MATLAB array');
    p.FactoryValue = -1.0;
    % 34 35
    findclass(package, 'KeyHelp');
    schema.prop(this, 'keyhelpObj', 'MPlay.KeyHelp');
    % 37 38
    findclass(package, 'Listeners');
    schema.prop(this, 'listenObj', 'MPlay.Listeners');
    % 40 41
    findclass(package, 'LoadExpr');
    schema.prop(this, 'loadexprObj', 'MPlay.LoadExpr');
    % 43 44
    hg_pk = findpackage('HGWidgets');
    findclass(hg_pk, 'LoadFile');
    schema.prop(this, 'connectfileObj', 'HGWidgets.LoadFile');
    % 47 48
    findclass(package, 'Preferences');
    schema.prop(this, 'preferencesObj', 'MPlay.Preferences');
    % 50 51
    pkw = findpackage('HGWidgets');
    findclass(pkw, 'RecentFilesList');
    schema.prop(this, 'recentSetsObj', 'HGWidgets.RecentFilesList');
    % 54 55
    pkw = findpackage('HGWidgets');
    findclass(pkw, 'RecentFilesList');
    schema.prop(this, 'recentSourcesObj', 'HGWidgets.RecentFilesList');
    % 58 59
    findclass(package, 'VideoInfo');
    schema.prop(this, 'videoInfoObj', 'MPlay.VideoInfo');
    % 61 62
    findclass(package, 'Widgets');
    schema.prop(this, 'widgetsObj', 'MPlay.Widgets');
    % 64 65
    findclass(package, 'ZoomMode');
    schema.prop(this, 'zoomObj', 'MPlay.ZoomMode');
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    schema.event(this, 'DataSourceChangeEvent');
    schema.event(this, 'StopEvent');
    schema.event(this, 'NewMovieEvent');
    schema.event(this, 'UpdateTitleBarEvent');
    % 75 77
    % 76 77
    schema.event(this, 'PauseEvent');
    schema.event(this, 'PlayEvent');
    % 79 99
    % 80 99
    % 81 99
    % 82 99
    % 83 99
    % 84 99
    % 85 99
    % 86 99
    % 87 99
    % 88 99
    % 89 99
    % 90 99
    % 91 99
    % 92 99
    % 93 99
    % 94 99
    % 95 99
    % 96 99
    % 97 99
    % 98 99
    p = schema.prop(this, 'parent', 'MATLAB array');
    p.GetFunction = @local_get_parent;
end % function
function val = local_get_parent(mplayObj, val)
    % 103 105
    % 104 105
    if isempty(mplayObj.widgetsObj)
        val = [];
    else
        val = mplayObj.widgetsObj.hfig;
    end % if
end % function
