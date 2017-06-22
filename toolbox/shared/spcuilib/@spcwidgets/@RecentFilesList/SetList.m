function SetList(h, files)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    grp = h.PrefsGroup;
    prf = h.PrefsRecentFiles;
    setpref(grp, prf, files);
    % 11 13
    % 12 13
    h.UpdateMenus;
end % function
