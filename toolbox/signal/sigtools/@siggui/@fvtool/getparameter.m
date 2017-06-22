function hPrm = getparameter(hFVT, tag)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    hPrms = get(hFVT, 'Parameters');
    % 11 12
    hPrm = [];
    if not(isempty(hPrms))
        hPrm = find(hPrms, 'Tag', tag);
    end % if
end % function
