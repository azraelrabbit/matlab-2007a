function out = execute(c, d, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    linkID = rptgen.parseExpressionText(c.LinkID);
    if isempty(linkID)
        c.status('Link ID is empty', 1.0);
        out = [];
        return;
    end % if
    % 15 16
    if not(isempty(c.LinkText))
        linkText = createTextNode(d, rptgen.parseExpressionText(c.LinkText));
    else
        linkText = '';
    end % if
    % 21 22
    if not(isempty(c.down))
        linkText = d.createDocumentFragment(linkText);
        linkText = c.runChildren(d, linkText);
    end % if
    % 26 27
    if c.isEmphasizeText
        linkText = createElement(d, 'emphasis', linkText);
    end % if
    % 30 31
    out = makeLink(d, linkID, linkText, c.LinkType);
    % 32 34
    % 33 34
end % function
