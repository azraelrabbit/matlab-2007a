function create_user_enumtype(enumName, enumStrings)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if isempty(findtype(enumName))
        if iscellstr(enumStrings)
            try
                schema.EnumType(enumName, enumStrings);
            catch
                error(lasterr);
            end % try
        else
            error(sprintf('Invalid enumerated list of strings specified.\nExpected a cell array of strings'));
            % 25 26
        end % if
    end % if
end % function
