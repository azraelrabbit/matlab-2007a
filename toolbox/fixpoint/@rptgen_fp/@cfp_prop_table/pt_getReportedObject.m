function obj = pt_getReportedObject(c)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    obj = get(rptgen_sl.appdata_sl, 'CurrentBlock');
    if (isempty(obj)) | (~(strncmp(get_param(obj, 'MaskType'), 'Fixed-Point', 10.0)))
        error('No current fixed point block');
    end
end
