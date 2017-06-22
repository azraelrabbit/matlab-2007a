function gt = name_getGenericType(c)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    if strncmpi(c.ObjectType, 'auto', 4.0)
        gt = getContextType(rptgen_sl.appdata_sl, c, logical(0));
    else
        gt = c.ObjectType;
    end
end
