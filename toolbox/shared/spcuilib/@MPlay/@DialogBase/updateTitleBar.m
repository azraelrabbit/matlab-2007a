function updateTitleBar(dlgObj, eventData, mplayObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    dataObj = mplayObj.datasourceObj.dataSource;
    if mplayObj.preferencesObj.DisplayFullSourceName
        dsrc = dataObj.sourceName;
    else
        dsrc = dataObj.sourceNameShort;
    end % if
    dlgObj.fullTitleStr = sprintf('%s [%d] - %s: %s', dlgObj.titleStr, mplayObj.getInstance, dataObj.type, dsrc);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    show(dlgObj, false);
end % function
