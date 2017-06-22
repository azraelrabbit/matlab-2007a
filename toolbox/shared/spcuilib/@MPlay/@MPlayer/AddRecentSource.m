function AddRecentSource(mplayObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if isSerializable(mplayObj.datasourceObj)
        % 7 13
        % 8 13
        % 9 13
        % 10 13
        % 11 13
        itemName = mplayObj.datasourceObj.dataSource.sourceName;
        % 13 16
        % 14 16
        itemData = mplayObj.Source;
        % 16 19
        % 17 19
        mplayObj.recentSourcesObj.SetMostRecent(cellhorzcat(itemName, itemData));
    end % if
end % function
