function ud = getPortInfo(blockObj)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    % 20 21
    ud.ipInfoSL.portLabel = {'ts','tr','vc','fcn'};
    ud.opInfoSL.portLabel = {'#d','pe','w'};
    % 23 24
    ud.ipInfoSE.portLabel = {};
    ud.opInfoSE.portLabel = {'OUT'};
    % 26 28
    % 27 28
    ud.ipInfoSL.isEnabled = {'no','no','no','no'};
    ud.opInfoSL.isEnabled = {'no','no','no'};
    % 30 31
    ud.ipInfoSE.isEnabled = {};
    ud.opInfoSE.isEnabled = {'yes'};
    % 33 34
    ud.icon = 'des_src.jpg';
    % 35 41
    % 36 41
    % 37 41
    % 38 41
    % 39 41
    % 40 41
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
