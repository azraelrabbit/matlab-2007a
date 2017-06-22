function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if not(builtin('license', 'checkout', 'SIMULINK_Report_Gen'))
        s = xlate('[Unlicensed Component]');
        return;
        % 12 14
    end % if
    % 14 16
    ct = getContextType(rptgen_sf.appdata_sf, c, true);
    if strcmpi(ct, 'Object')
        ct = xlate('Current object');
    else
        if strcmp(c.CountDepth, 'shallow')
            ct = sprintf('Children of %s', lower(ct));
        else
            ct = sprintf('All objects in %s', lower(ct));
        end % if
    end % if
    s = sprintf('Count - %s', ct);
end % function
