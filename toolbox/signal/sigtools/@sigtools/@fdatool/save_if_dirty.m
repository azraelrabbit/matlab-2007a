function status = save_if_dirty(hFDA, action)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    if not(hFDA.FileDirty)
        status = 1.0;
        return;
    end % if
    % 22 24
    % 23 24
    [path, file] = fileparts(get(hFDA, 'FileName'));
    % 25 27
    % 26 27
    ansBtn = questdlg(cellhorzcat(sprintf('Save %s session before %s?', file, action)), 'FDATool', 'Cancel');
    % 28 29
    switch ansBtn
    case 'Yes'
        status = 1.0;
        save(hFDA);
    case 'No'
        status = 1.0;
        % 35 36
        hFDA.FileDirty = 0.0;
    case 'Cancel'
        status = 0.0;
    end % switch
end % function
