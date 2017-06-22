function s = getOutlineString(c)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    cText = c.CommentText;
    if gt(length(cText), 32.0)
        cText = horzcat(cText(1.0:32.0), '...');
    end % if
    % 14 15
    s = sprintf('Comment - %s', cText);
end % function
