function setappdata(hFDA, fieldname, val)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    error(nargchk(2.0, 3.0, nargin));
    % 10 12
    if lt(nargin, 3.0)
        set(hFDA, 'ApplicationData', fieldname);
    else
        % 14 17
        % 15 17
        data = get(hFDA, 'ApplicationData');
        % 17 19
        data.(fieldname) = val;
        % 19 21
        set(hFDA, 'ApplicationData', data);
    end
end
