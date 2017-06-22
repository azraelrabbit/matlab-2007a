function plist = getClientProperties(this, onlyVisible)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    plist = getClientPropertyList;
    % 10 11
    if onlyVisible
        plist = plist(horzcat(plist.Visible));
    end % if
end % function
