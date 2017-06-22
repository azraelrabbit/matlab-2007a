function fixtoolbar(fig)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if not(isempty(findall(fig, 'Tag', 'ScribeSelectToolBtn')))
        set(fig, 'Toolbar', 'figure');
    end % if
end % function
