function dlgDatatypeEnum(dao, propName, dlgH)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    newValue = dlgH.getWidgetValue(propName);
    % 9 10
    allValues = dlgH.getUserData(propName);
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isnumeric(newValue) || islogical(newValue)
        if lt(newValue, size(allValues, 1.0))
            newValue = allValues{plus(newValue, 1.0), 1.0};
        else
            warning('Invalid enumerated value index');
        end % if
    else
        % 22 23
        foundIdx = find(strcmpi(allValues(:, 2.0), newValue));
        if not(isempty(foundIdx))
            newValue = allValues{foundIdx(1.0), 1.0};
        else
            foundIdx = find(strcmpi(allValues(:, 1.0), newValue));
            if not(isempty(foundIdx))
                % 29 31
                % 30 31
                dlgH.setWidgetValue(propName, allValues{foundIdx(1.0), 2.0});
            end % if
        end % if
        % 34 35
    end % if
    % 36 37
    try
        set(dao, propName, newValue);
    catch
        % 40 41
        warning('Invalid enumerated value');
    end % try
end % function
