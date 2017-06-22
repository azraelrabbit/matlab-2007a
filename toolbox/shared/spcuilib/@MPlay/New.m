function mplayObj = New(src, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if isa(src, 'MPlay.MPlayer')
        % 14 16
        % 15 16
        ws = src.IsDocked;
    else
        ws = src;
    end % if
    mplayObj = MPlay.MPlayer(ws);
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    eventData = mplayObj.LoadSource(varargin);
    % 28 31
    % 29 31
    % 30 31
    err = eventData.Data;
    if strcmpi(err.errorStatus, 'failure')
        % 33 34
        Close(mplayObj);
        % 35 37
        % 36 37
        error(err.errorMsg);
    else
        % 39 40
        hfig = mplayObj.widgetsObj.hfig;
        isDocked = strcmpi(get(hfig, 'WindowStyle'), 'docked');
        if isDocked
            set(hfig, 'WindowStyle', 'norm');
            drawnow('expose')
            set(hfig, 'WindowStyle', 'docked');
        end % if
        % 47 49
        % 48 49
        Visible(mplayObj);
    end % if
end % function
