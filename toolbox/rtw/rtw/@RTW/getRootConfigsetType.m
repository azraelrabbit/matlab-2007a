function csType = getRootConfigsetType(cs)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    csType = 'unknown';
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    cur = cs.getComponent('any', 'Target');
    parent = cur.getComponent('any', 'Target');
    % 13 14
        while not(isempty(parent))
        cur = parent;
        parent = cur.getComponent('any', 'Target');
    end % while
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    if isa(cur, 'Simulink.ERTTargetCC')
        csType = 'ERT';
        return;
    end % if
    % 27 29
    % 28 29
    if isa(cur, 'Simulink.GRTTargetCC')
        csType = 'GRT';
        return;
    end % if
    % 33 35
    % 34 35
    if isa(cur, 'Simulink.STFCustomTargetCC')
        csType = 'STFCustom';
        return;
    end % if
    % 39 41
    % 40 41
    if isa(cur, 'RTW.RSimTargetCC')
        csType = 'RSim';
        return;
    end % if
    % 45 47
    % 46 47
    if isa(cur, 'RTW.TornadoTargetCC')
        csType = 'Tornado';
        return;
    end % if
    % 51 53
    % 52 53
    if isa(cur, 'RTW.RTWinTargetCC')
        csType = 'RTWin';
        return;
    end % if
    % 57 59
    % 58 59
    if isa(cur, 'TIC6000TgtPkg.C6000TargetCC')
        csType = 'c6000';
        return;
    end % if
    % 63 65
    % 64 65
    if isa(cur, 'xpctarget.xpcTargetCC')
        csType = 'xpcTarget';
        return;
    end % if
end % function
