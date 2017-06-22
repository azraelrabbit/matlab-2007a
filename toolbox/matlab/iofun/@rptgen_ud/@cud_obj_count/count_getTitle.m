function t = count_getTitle(this, ps, rootObj, d)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    t = d.createDocumentFragment(xlate('Count: '));
    % 13 14
    ps.makeLink(rootObj, '', 'link', d, t, ', ');
end % function
