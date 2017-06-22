function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    tString = c.Title;
    if isempty(tString)
        tString = xlate('<No Title>');
    end % if
    % 13 14
    s = sprintf('Title Page - %s', tString);
end % function
