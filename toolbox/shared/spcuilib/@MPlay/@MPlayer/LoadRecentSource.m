function errStatus = LoadRecentSource(mplayObj)
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
    item = mplayObj.recentSourcesObj.SelectedItem;
    % 16 18
    % 17 18
    sourceArgs = item{2.0};
    % 19 21
    % 20 21
    mplayObj.LoadSource(sourceArgs, @local_LoadRecentSourceContinue);
end % function
function local_LoadRecentSourceContinue(mplayObj)
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    err = mplayObj.listenObj.UserData;
    % 29 30
    if strcmpi(err.errorStatus, 'failure')
        errmsg = MPlay.errorClean(err.errorMsg);
        MPlay.errorHandler(errmsg, 'Load Recent Source');
    else
        % 34 42
        % 35 42
        % 36 42
        % 37 42
        % 38 42
        % 39 42
        % 40 42
        % 41 42
    end % if
end % function
