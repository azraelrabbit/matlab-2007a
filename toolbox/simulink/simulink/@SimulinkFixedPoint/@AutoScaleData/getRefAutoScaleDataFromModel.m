function refAutoScaleData = getRefAutoScaleDataFromModel(curPath)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    curBdRoot = bdroot(curPath);
    curArchiveData = get_param(curBdRoot, 'MinMaxOverflowArchiveData');
    % 8 9
    refAutoScaleData = curArchiveData.funcHandle2AutofixexpObjectKeeper('get', curPath);
end % function
