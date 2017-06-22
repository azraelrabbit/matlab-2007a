function design(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    hDM = get(this, 'CurrentDesignMethod');
    if isempty(hDM)
        buildcurrent(this);
        hDM = get(this, 'CurrentDesignMethod');
    end % if
    % 13 14
    set(this, 'isDesigned', 1.0);
    % 15 16
    sendstatus(this, 'Designing Filter ... ');
    % 17 18
    try
        % 19 21
        % 20 21
        syncGUIvals(hDM, get(this, 'ActiveComponents'));
        % 22 24
        % 23 24
        data.filter = designwfs(hDM);
        data.mcode = genmcode(hDM);
    catch
        set(this, 'isDesigned', 0.0);
        rethrow(lasterror);
    end % try
    % 30 32
    % 31 32
    send(this, 'FilterDesigned', sigdatatypes.sigeventdata(this, 'FilterDesigned', data));
    % 33 35
    % 34 35
    sendstatus(this, 'Designing Filter ... Done');
end % function
