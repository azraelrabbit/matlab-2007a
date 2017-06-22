function huiRFL = connect(huiRFL)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    ConnectMenu(huiRFL.recentFiles, huiRFL.GraphicalParent);
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    hListen = handle.listener(huiRFL.GraphicalParent, 'ObjectBeingDestroyed', @(hh,ev)uiRFL_destroy(huiRFL));
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    setappdata(huiRFL.GraphicalParent, 'uimgr_uirecentitemslist_connect', hListen);
end
function uiRFL_destroy(huiRFL)
    % 38 45
    % 39 45
    % 40 45
    % 41 45
    % 42 45
    % 43 45
    if ishandle(huiRFL)
        huiRFL.hWidget = [];
    end
end
