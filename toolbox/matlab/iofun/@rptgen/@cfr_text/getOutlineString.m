function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    dispText = rptgen.truncateString(c.Content, '<No Text>');
    % 9 11
    if c.isCode
        cName = 'Code';
    else
        cName = 'Text';
    end % if
    % 15 17
    s = horzcat(cName, ' - ', dispText);
