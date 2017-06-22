function exploreAction(libCat)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    libCat.Expanded = not(libCat.Expanded);
    % 10 11
    r = RptgenML.Root;
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    ed = DAStudio.EventDispatcher;
    ed.broadcastEvent('ListChangedEvent', r.getCurrentComponent);
end % function
