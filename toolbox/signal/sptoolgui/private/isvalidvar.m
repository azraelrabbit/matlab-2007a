function bool = isvalidvar(str)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    if gt(length(str), 1.0)
        bool = and(isletter(str(1.0)), all(or(isletter(str(2.0:end)), ismember(str(2.0:end), '0123456789_'))));
    else
        % 17 18
        bool = isletter(str);
    end % if
end % function
