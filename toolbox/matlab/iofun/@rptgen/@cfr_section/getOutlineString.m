function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    if c.isTitleFromSubComponent
        tString = '<Title from first child>';
    else
        tString = rptgen.truncateString(c.SectionTitle, 16.0);
    end % if
    % 13 16
    % 14 16
    sType = c.findDisplayName('SectionType', c.getSectionType);
    if isempty(sType)
        sType = '<no section>';
    end % if
    % 19 21
    s = horzcat(sType, ' - ', tString);
