function h = RecentFilesList(grp, prf)
    % 1 38
    % 2 38
    % 3 38
    % 4 38
    % 5 38
    % 6 38
    % 7 38
    % 8 38
    % 9 38
    % 10 38
    % 11 38
    % 12 38
    % 13 38
    % 14 38
    % 15 38
    % 16 38
    % 17 38
    % 18 38
    % 19 38
    % 20 38
    % 21 38
    % 22 38
    % 23 38
    % 24 38
    % 25 38
    % 26 38
    % 27 38
    % 28 38
    % 29 38
    % 30 38
    % 31 38
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    h = spcwidgets.RecentFilesList;
    % 39 42
    % 40 42
    % 41 42
    if lt(nargin, 1.0)
        msg = sprintf('A preferences group name must be specified.\nSee "setpref" for details on naming conventions.');
        % 44 45
        error('spcwidgets:NoPrefsGroup', msg);
    end % if
    local_SetPrefGroupName(h, grp);
    if gt(nargin, 1.0)
        local_SetFileListPrefName(h, prf);
    end % if
    % 51 52
    h.InitPrefs;
    % 53 55
    % 54 55
    h.loadfileObj = spcwidgets.LoadFile;
end % function
function local_SetPrefGroupName(h, grp)
    % 58 61
    % 59 61
    % 60 61
    if not(ischar(grp))
        error('spcwidgets:MustBeString', 'Preference group name must be a string');
    end % if
    h.PrefsGroup = grp;
end % function
function local_SetFileListPrefName(h, prf)
    % 67 70
    % 68 70
    % 69 70
    if not(ischar(prf))
        error('spcwidgets:MustBeString', 'File list preference name must be a string');
    end % if
    h.PrefsRecentFiles = prf;
end % function
