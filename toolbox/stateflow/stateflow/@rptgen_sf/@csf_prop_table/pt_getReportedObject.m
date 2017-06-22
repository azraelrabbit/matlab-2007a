function obj = pt_getReportedObject(this)
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
    obj = get(rptgen_sf.appdata_sf, 'CurrentObject');
    if not(ishandle(obj))
        error(xlate('No current Stateflow object for property table'));
    end % if
end % function
