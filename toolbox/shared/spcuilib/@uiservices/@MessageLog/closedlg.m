function closedlg(hMessageLog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hMessageLog.cache_SelectedDetail = '';
    % 9 10
    if not(isempty(hMessageLog.dialog))
        % 11 13
        % 12 13
        hMessageLog.DialogPosition = hMessageLog.dialog.position;
        hMessageLog.dialog.delete;
        hMessageLog.dialog = [];
    end % if
end % function
