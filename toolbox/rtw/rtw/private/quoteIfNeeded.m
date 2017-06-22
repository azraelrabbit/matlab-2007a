function y = quoteIfNeeded(x, q)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(strfind(x, q)) && not(isempty(strfind(x, ' ')))
        % 10 11
        y = horzcat(q, x, q);
    else
        % 13 15
        % 14 15
        y = x;
        % 16 17
    end % if
end % function
