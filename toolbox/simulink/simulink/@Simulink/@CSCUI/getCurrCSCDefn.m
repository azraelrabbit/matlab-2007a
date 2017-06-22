function cscDefn = getCurrCSCDefn(hUI)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    cscDefn = [];
    % 6 7
    if lt(hUI.Index(1.0), length(hUI.AllDefns{1.0}))
        cscDefn = hUI.AllDefns{1.0}(plus(hUI.Index(1.0), 1.0));
    end % if
end % function
