function schema
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkg = findpackage('uimgr');
    inh = findclass(pkg, 'uiitem');
    this = schema.class(pkg, 'uirecentitemslist', inh);
    % 10 12
    % 11 12
    pkg_spc = findpackage('spcwidgets');
    findclass(pkg_spc, 'RecentFilesList');
    p = schema.prop(this, 'recentFiles', 'spcwidgets.RecentFilesList');
    p.AccessFlags.PublicSet = 'off';
end % function
