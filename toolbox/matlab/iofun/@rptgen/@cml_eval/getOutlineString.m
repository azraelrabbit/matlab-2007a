function s = getOutlineString(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    eString = c.EvalString;
    if gt(length(eString), 32.0)
        eString = horzcat(eString(1.0:32.0), '...');
    end % if
    % 13 14
    s = sprintf('Eval - %s', eString);
end % function
