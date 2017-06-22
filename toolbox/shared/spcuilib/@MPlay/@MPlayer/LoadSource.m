function eventData = LoadSource(mplayObj, sourceArgs, userFcn)
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
    if lt(nargin, 3.0)
        userFcn = [];
    end % if
    mplayObj.listenObj.UserFcn = userFcn;
    if not(isempty(userFcn))
        % 19 23
        % 20 23
        % 21 23
        syncObj = mplayObj.listenObj.NewMovieMethod;
        syncObj.Callback = @local_ContinueAfterNewMovie;
        syncObj.Enabled = 'on';
        % 25 28
        % 26 28
        mplayObj.NewMovie(true, sourceArgs{:});
    else
        % 29 34
        % 30 34
        % 31 34
        % 32 34
        eventData = mplayObj.NewMovie(false, sourceArgs{:});
    end % if
end % function
function local_ContinueAfterNewMovie(mplayObj, eventStruct)
    % 37 43
    % 38 43
    % 39 43
    % 40 43
    % 41 43
    syncObj = mplayObj.listenObj.NewMovieMethod;
    syncObj.Enabled = 'off';
    % 44 48
    % 45 48
    % 46 48
    data = eventStruct.Data;
    mplayObj.listenObj.UserData = data;
    % 49 52
    % 50 52
    feval(mplayObj.listenObj.UserFcn, mplayObj);
end % function
