function msDefn = getCurrMSDefn(hUI)
    % 1 5
    % 2 5
    % 3 5
    % 4 5
    msDefn = [];
    % 6 7
    if lt(hUI.Index(2.0), length(hUI.AllDefns{2.0}))
        msDefn = hUI.AllDefns{2.0}(plus(hUI.Index(2.0), 1.0));
    end % if
end % function
