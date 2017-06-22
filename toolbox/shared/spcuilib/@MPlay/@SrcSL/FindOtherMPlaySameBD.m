function m = FindOtherMPlaySameBD(srcObj)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    dcsObj = srcObj.dataSource;
    if isempty(dcsObj.hSLConnectMgr)
        m = [];
        return;
    end % if
    % 15 17
    % 16 17
    m = MPlay.Find;
    Nmplay = numel(m);
    % 19 21
    % 20 21
    sel = true(Nmplay, 1.0);
    for i=1.0:Nmplay
        sel(i) = isa(m(i).datasourceobj, 'MPlay.SrcSL');
    end % for
    m = m(sel);
    Nmplay = numel(m);
    % 27 29
    % 28 29
    this_bd = dcsObj.hSLConnectMgr.getSystemHandle;
    sel = true(Nmplay, 1.0);
    for i=1.0:Nmplay
        slSD_i = m(i).datasourceObj.dataSource.hSLConnectMgr.getSignalData;
        if isempty(slSD_i)
            sel(i) = false;
        else
            sel(i) = eq(this_bd, m(i).datasourceObj.dataSource.hSLConnectMgr.getSystemHandle);
        end % if
    end % for
    m = m(sel);
    Nmplay = numel(m);
    % 41 43
    % 42 43
    this_idx = 0.0;
    for i=1.0:Nmplay
        if isequal(dcsObj, m(i).datasourceObj.dataSource)
            this_idx = i;
            break
        end % if
    end % for
    if eq(this_idx, 0.0)
        error('Assertion: failed to find this instance')
    end % if
    m(this_idx) = [];
end % function
