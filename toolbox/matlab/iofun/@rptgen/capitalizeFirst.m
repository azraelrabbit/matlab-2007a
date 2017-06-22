function s = capitalizeFirst(s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isempty(s))
        s = horzcat(upper(s(1.0)), s(2.0:end));
    else
        s = '';
    end % if
end % function
