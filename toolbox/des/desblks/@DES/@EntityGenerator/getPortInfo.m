function ud = getPortInfo(blockObj)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    ud.ipInfoSL.portLabel = {'t','tr','fcn','ts'};
    ud.opInfoSL.portLabel = {'#c','w','blkd'};
    % 20 21
    ud.ipInfoSE.portLabel = {};
    ud.opInfoSE.portLabel = {'OUT'};
    % 23 25
    % 24 25
    ud.ipInfoSL.isEnabled = {'no','no','no','no'};
    ud.opInfoSL.isEnabled = {'no','no','no'};
    % 27 28
    ud.ipInfoSE.isEnabled = {};
    ud.opInfoSE.isEnabled = {'yes'};
    % 30 31
    ud.icon = 'des_src.jpg';
    % 32 38
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    if ne(length(ud.ipInfoSL.portLabel), length(ud.ipInfoSL.isEnabled))
        error('ipInfoSL field size mismatch!!!');
    end % if
    if ne(length(ud.opInfoSL.portLabel), length(ud.opInfoSL.isEnabled))
        error('opInfoSL field size mismatch!!!');
    end % if
    if ne(length(ud.ipInfoSE.portLabel), length(ud.ipInfoSE.isEnabled))
        error('ipInfoSE field size mismatch!!!');
    end % if
    if ne(length(ud.opInfoSE.portLabel), length(ud.opInfoSE.isEnabled))
        error('opInfoSE field size mismatch!!!');
    end % if
end % function
