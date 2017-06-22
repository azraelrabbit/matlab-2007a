function eSelects = getenabledselections(hSct)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    selects = getallselections(hSct);
    dSelects = get(hSct, 'DisabledSelections');
    % 12 13
    eSelects = {};
    % 14 16
    % 15 16
    for i=1.0:length(selects)
        if isempty(strmatch(selects{i}, dSelects))
            eSelects{plus(end, 1.0)} = selects{i};
        end % if
    end % for
end % function
