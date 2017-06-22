function theList = catList(hMessageLog)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    theList = iterator.visitImmediateChildren(cacheMergedLog(hMessageLog), @(hItem)hItem.Category);
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    theList = sort(unique(theList));
