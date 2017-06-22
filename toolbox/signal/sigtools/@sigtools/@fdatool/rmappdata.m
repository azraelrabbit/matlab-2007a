function rmappdata(hFDA, fieldname)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    error(nargchk(2.0, 2.0, nargin));
    % 11 12
    data = get(hFDA, 'ApplicationData');
    % 13 14
    data = rmfield(data, fieldname);
    % 15 16
    setappdata(hFDA, data);
end % function
