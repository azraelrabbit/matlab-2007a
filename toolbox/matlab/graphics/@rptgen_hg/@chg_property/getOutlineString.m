function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    s = sprintf('%s Property - %s', c.ObjectType, get(c, horzcat(c.ObjectType, 'Property')));
end % function
