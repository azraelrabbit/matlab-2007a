function setIndex(hUI, idx)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    whichDefns = plus(hUI.mainActiveTab, 1.0);
    hUI.Index(whichDefns) = idx;
end % function
