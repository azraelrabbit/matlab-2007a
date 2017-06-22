function formatted_comment = hdlformatcomment(unformatted_comment, indent)
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
    if isempty(unformatted_comment)
        formatted_comment = unformatted_comment;
    else
        if eq(nargin, 2.0)
            comment_prefix = blanks(indent);
        else
            comment_prefix = '';
        end % if
        comment_prefix = horzcat(comment_prefix, hdlgetparameter('comment_char'), ' ');
        % 23 25
        % 24 25
        comment_cont = horzcat(char(10.0), comment_prefix);
        % 26 28
        % 27 28
        formatted_comment = horzcat(comment_prefix, unformatted_comment);
        % 29 30
        formatted_comment = strrep(formatted_comment, char(10.0), comment_cont);
        % 31 32
        formatted_comment = strrep(formatted_comment, '\n', comment_cont);
        % 33 34
        formatted_comment = horzcat(formatted_comment, char(10.0));
    end % if
end % function
