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
    obj = get(rptgen_sl.appdata_sl, horzcat('Current', c.ObjectType));
    if (isempty(obj)) | (isequal(obj, -1.0))
        error(sprintf('No current %s for property table', lower(c.ObjectType)));
    end
end
