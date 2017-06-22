function currDefn = getCurrDefn(hUI)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    currDefn = [];
    % 7 8
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    currIndex = hUI.Index(whichDefns);
    % 10 11
    if lt(currIndex, length(hUI.AllDefns{whichDefns}))
        currDefn = hUI.AllDefns{whichDefns}(plus(currIndex, 1.0));
    end % if
end % function
