function aObj = edit(aObj)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    HG = get(aObj, 'MyHGHandle');
    c = uisetcolor(HG);
    % 10 11
    if gt(length(c), 1.0)
        aObj = set(aObj, 'Color', c);
        refresh;
    end % if
end % function
