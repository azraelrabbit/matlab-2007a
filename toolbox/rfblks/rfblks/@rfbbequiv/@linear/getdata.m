function data = getdata(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ckt = get(h, 'RFckt');
    % 10 12
    % 11 12
    if isempty(ckt)
        data = [];
    else
        data = getdata(ckt);
    end % if
end % function
