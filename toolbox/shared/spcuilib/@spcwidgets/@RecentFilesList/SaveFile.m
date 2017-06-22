function [fname, cancel] = SaveFile(h)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    c = h.loadfileObj;
    c.filterspec = h.FileFilterSpec;
    c.title = h.SaveFileTitle;
    % 18 19
    grp = h.PrefsGroup;
    prf = h.PrefsRecentChooseFile;
    c.initialDir = getpref(grp, prf);
    % 22 23
    cancel = not(c.select(true));
    if cancel
        fname = '';
    else
        % 27 28
        setpref(grp, prf, c.initialDir);
        % 29 31
        % 30 31
        fname = c.fullfile;
        h.SelectedItem = fname;
        % 33 34
        h.SetMostRecent(fname);
        % 35 38
        % 36 38
        % 37 38
        cbFcn = h.SaveCallback;
        if not(isempty(cbFcn))
            cbFcn();
        end % if
    end % if
end % function
