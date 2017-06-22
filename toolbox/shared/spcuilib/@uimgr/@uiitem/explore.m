function explore(hItem)
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
    if isempty(hItem.explorer)
        hItem.explorer = uimgr.uiexplorer(hItem);
    else
        hItem.explorer.hItem = hItem;
    end % if
    hItem.explorer.show;
end % function
