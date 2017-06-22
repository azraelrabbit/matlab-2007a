function cs = loop_getContextString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    src = c.ObjectSource;
    cs = c.findDisplayName('ObjectSource', src);
    % 11 12
    if strcmp(src, 'matfile')
        cs = horzcat(cs, ' ', c.Filename);
    end % if
end % function
