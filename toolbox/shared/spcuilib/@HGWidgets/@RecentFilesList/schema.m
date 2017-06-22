function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('HGWidgets');
    h = schema.class(pkg, 'RecentFilesList');
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    p = schema.prop(h, 'DefaultMaxFiles', 'double');
    p.FactoryValue = 10.0;
    p.AccessFlags.PublicSet = 'off';
    % 16 20
    % 17 20
    % 18 20
    % 19 20
    schema.prop(h, 'SelectedItem', 'MATLAB array');
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    p = schema.prop(h, 'PrefsGroup', 'string');
    p.FactoryValue = 'RecentFilesPrefs';
    p.AccessFlags.PublicSet = 'off';
    % 31 33
    % 32 33
    p = schema.prop(h, 'PrefsRecentFiles', 'string');
    p.FactoryValue = 'RecentFiles';
    p.AccessFlags.PublicSet = 'off';
    % 36 39
    % 37 39
    % 38 39
    p = schema.prop(h, 'PrefsRecentChooseFile', 'string');
    p.FactoryValue = 'RecentChooseFile';
    p.AccessFlags.PublicSet = 'off';
    % 42 47
    % 43 47
    % 44 47
    % 45 47
    % 46 47
    p = schema.prop(h, 'InitialMenu', 'MATLAB array');
    % 48 50
    % 49 50
    p = schema.prop(h, 'Menus', 'MATLAB array');
    % 51 59
    % 52 59
    % 53 59
    % 54 59
    % 55 59
    % 56 59
    % 57 59
    % 58 59
    p = schema.prop(h, 'LoadCallback', 'MATLAB array');
    % 60 63
    % 61 63
    % 62 63
    p = schema.prop(h, 'SaveCallback', 'MATLAB array');
    % 64 67
    % 65 67
    % 66 67
    p = schema.prop(h, 'EmptyListMsg', 'string');
    p.FactoryValue = '<no recent files>';
    % 69 72
    % 70 72
    % 71 72
    p = schema.prop(h, 'MenuStrNmax', 'double');
    p.FactoryValue = 25.0;
    % 74 76
    % 75 76
    p = schema.prop(h, 'MenuStrNpre', 'double');
    p.FactoryValue = 3.0;
    % 78 83
    % 79 83
    % 80 83
    % 81 83
    % 82 83
    findclass(pkg, 'LoadFile');
    p = schema.prop(h, 'loadfileObj', 'HGWidgets.LoadFile');
    % 85 86
    p = schema.prop(h, 'LoadFileTitle', 'string');
    p.FactoryValue = 'Choose file';
    % 88 89
    p = schema.prop(h, 'SaveFileTitle', 'string');
    p.FactoryValue = 'Save file';
    % 91 92
    p = schema.prop(h, 'FileFilterSpec', 'MATLAB array');
    p.FactoryValue = {'*.txt','Text files (*.txt)';'*.*','All Files (*.*)'};
end % function
