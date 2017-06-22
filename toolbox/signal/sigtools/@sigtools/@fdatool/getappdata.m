function data = getappdata(hFDA, fieldname)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    error(nargchk(1.0, 2.0, nargin));
    % 10 12
    data = get(hFDA, 'ApplicationData');
    if gt(nargin, 1.0)
        try
            data = data.(fieldname);
        catch
            data = [];
        end % try
    end
end
