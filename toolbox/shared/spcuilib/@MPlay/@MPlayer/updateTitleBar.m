function updateTitleBar(hMPlay, ev)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    dataObj = hMPlay.datasourceObj.dataSource;
    if hMPlay.preferencesObj.DisplayFullSourceName
        dsrc = dataObj.sourceName;
    else
        dsrc = dataObj.sourceNameShort;
    end % if
    nameStr = sprintf('%s [%d] - %s: %s', 'MPlay', hMPlay.getInstance, dataObj.type, dsrc);
    % 18 20
    % 19 20
    set(hMPlay.widgetsObj.hfig, 'name', nameStr);
    % 21 25
    % 22 25
    % 23 25
    % 24 25
    send(hMPlay, 'UpdateTitleBarEvent');
end % function
