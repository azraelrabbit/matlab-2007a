function formated_comment = insertComment(this, comment_string)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    comment_char = hdlgetparameter('comment_char');
    indentedcomment = horzcat('  ', comment_char, ' ');
    separatorline = horzcat('  ', comment_char, ' ', mtimes('-', ones(1.0, minus(63.0, length(comment_char)))), '\n');
    % 9 10
    formated_comment = cell2mat(horzcat(separatorline, indentedcomment, comment_string, '\n', separatorline));
    % 11 12
end % function
