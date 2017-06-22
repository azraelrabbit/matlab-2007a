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
    if c.ObjectSection
        osType = horzcat(' ', c.findDisplayName('SectionType', c.getSectionType));
    else
        osType = '';
    end % if
    % 15 16
    try
        contextString = c.loop_getContextString;
    catch
        % 19 20
        contextString = '';
    end % try
    if not(isempty(contextString))
        contextString = horzcat(' - ', contextString);
    end % if
    % 25 26
    try
        objType = c.loop_getObjectType;
    catch
        objType = xlate('Unknown');
    end % try
    % 31 33
    % 32 33
    s = horzcat(objType, xlate(' Loop'), osType, contextString);
end % function
