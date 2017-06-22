function rawStr = dlgDatatypeString(dao, propName, rawStr)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if ~(isequal(dao.(propName), rawStr))
        set(dao, propName, rawStr);
        % 12 14
    end
end
