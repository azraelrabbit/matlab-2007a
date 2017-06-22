function cmt = createComment(d, commentString)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    cmt = javaMethod('createComment', java(d), rptgen.toString(commentString, 0.0));
    % 9 10
end % function
