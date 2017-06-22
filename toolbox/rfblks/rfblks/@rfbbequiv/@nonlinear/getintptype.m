function intptype = getintptype(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    intptype = 'linear';
    % 10 12
    % 11 12
    ckt = get(h, 'RFckt');
    % 13 15
    % 14 15
    if not(isempty(ckt))
        intptype = get(ckt, 'IntpType');
    end % if
end % function
