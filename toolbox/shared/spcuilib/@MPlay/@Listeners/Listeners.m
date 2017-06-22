function listenObj = Listeners(mplayObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    listenObj = MPlay.Listeners;
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    pk = findpackage('MPlay');
    cl = pk.findclass('Preferences');
    prop = cl.findprop('DisplayFullSourceName');
    listenObj.pref_srcname = handle.listener(mplayObj.preferencesObj, prop, 'PropertyPostSet', @(h,ev)mplayObj.updateTitleBar);
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    listenObj.datasource = handle.listener(mplayObj, 'DataSourceChangeEvent', @updateTitleBar);
    % 25 29
    % 26 29
    % 27 29
    cl = pk.findclass('ColorMap');
    listenObj.scaling = handle.listener(mplayObj.colormapObj, 'ScalingChanged', @ColorMap);
    % 30 32
    listenObj.scaling.CallbackTarget = mplayObj;
    % 32 43
    % 33 43
    % 34 43
    % 35 43
    % 36 43
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    hg_pk = findpackage('HGWidgets');
    cl = hg_pk.findclass('LoadFile');
    prop = cl.findprop('initialDir');
    listenObj.initialDir = handle.listener(mplayObj.connectfileObj, prop, 'PropertyPostSet', @SetLastConnectFileOpened);
    % 46 48
    listenObj.initialDir.CallbackTarget = mplayObj.preferencesObj;
    % 48 53
    % 49 53
    % 50 53
    % 51 53
    hg_pk = findpackage('MPlay');
    cl = hg_pk.findclass('Preferences');
    prop = cl.findprop('LastConnectFileOpened');
    listenObj.initialDir(2.0) = handle.listener(mplayObj.preferencesObj, prop, 'PropertyPostSet', @SetInitialDir);
    % 56 58
    listenObj.initialDir(2.0).CallbackTarget = mplayObj.connectfileObj;
    % 58 61
    % 59 61
    hg_pk = findpackage('MPlay');
    cl = hg_pk.findclass('Preferences');
    prop = cl.findprop('RecentSourcesListLength');
    listenObj.initialDir(3.0) = handle.listener(mplayObj.preferencesObj, prop, 'PropertyPostSet', @SetMaxPref);
    % 64 66
    listenObj.initialDir(3.0).CallbackTarget = mplayObj.recentSourcesObj;
    % 66 86
    % 67 86
    % 68 86
    % 69 86
    % 70 86
    % 71 86
    % 72 86
    % 73 86
    % 74 86
    % 75 86
    % 76 86
    % 77 86
    % 78 86
    % 79 86
    % 80 86
    % 81 86
    % 82 86
    % 83 86
    % 84 86
    listenObj.StopMethod = handle.listener(mplayObj, 'StopEvent', @disp);
    % 86 88
    listenObj.StopMethod.CallbackTarget = mplayObj;
    listenObj.StopMethod.Enabled = 'off';
    % 89 95
    % 90 95
    % 91 95
    % 92 95
    % 93 95
    listenObj.PauseMethod = handle.listener(mplayObj, 'PauseEvent', @disp);
    % 95 97
    listenObj.PauseMethod.CallbackTarget = mplayObj;
    listenObj.PauseMethod.Enabled = 'off';
    % 98 104
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    listenObj.NewMovieMethod = handle.listener(mplayObj, 'NewMovieEvent', @disp);
    % 104 106
    listenObj.NewMovieMethod.CallbackTarget = mplayObj;
    listenObj.NewMovieMethod.Enabled = 'off';
    % 107 111
    % 108 111
    % 109 111
    listenObj.ConnectToDataSource = handle.listener(mplayObj, 'NewMovieEvent', @disp);
    % 111 113
    listenObj.ConnectToDataSource.CallbackTarget = mplayObj;
    listenObj.ConnectToDataSource.Enabled = 'off';
end
