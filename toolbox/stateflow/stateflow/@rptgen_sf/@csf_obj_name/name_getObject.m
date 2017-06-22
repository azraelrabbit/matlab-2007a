function o = name_getObject(c)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    o = get(rptgen_sf.appdata_sf, 'CurrentObject');
    if not(ishandle(o))
        o = [];
    end % if
end % function
