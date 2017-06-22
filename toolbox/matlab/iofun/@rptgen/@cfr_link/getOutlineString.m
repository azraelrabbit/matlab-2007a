function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch c.LinkType
    case 'ulink'
        lName = 'URL link';
    case 'xref'
        lName = 'Cross reference';
    otherwise
        lName = c.LinkType;
        lName(1.0) = upper(lName(1.0));
    end % switch
    % 19 20
    if isempty(c.LinkID)
        linkID = xlate('<No ID>');
    else
        linkID = c.LinkID;
    end % if
    % 25 26
    s = horzcat(xlate(lName), ' - ', linkID);
end % function
