function Close(listenObj)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    delete(listenObj.pref_srcname);
    listenObj.pref_srcname = [];
    % 9 10
    delete(listenObj.datasource);
    listenObj.datasource = [];
    % 12 13
    delete(listenObj.scaling);
    listenObj.scaling = [];
    % 15 16
    delete(listenObj.initialDir);
    listenObj.initialDir = [];
    % 18 19
    delete(listenObj.StopMethod);
    listenObj.StopMethod = [];
    % 21 22
    delete(listenObj.NewMovieMethod);
    listenObj.NewMovieMethod = [];
    % 24 25
    delete(listenObj.ConnectToDataSource);
    listenObj.ConnectToDataSource = [];
end % function
