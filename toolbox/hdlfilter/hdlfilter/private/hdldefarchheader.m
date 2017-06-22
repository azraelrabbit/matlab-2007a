function comment = hdldefarchheader(nname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    commentchars = hdlgetparameter('comment_char');
    % 9 10
    separatorline = horzcat(repmat(commentchars, 1.0, floor(mrdivide(64.0, length(commentchars)))), '\n');
    % 11 12
    comment = horzcat(separatorline, commentchars, 'Module Architecture: ', nname, '\n', separatorline);
    % 13 14
end % function
