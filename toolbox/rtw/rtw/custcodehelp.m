function custcodehelp(id)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if eq(id, 0.0)
        % 7 8
        str = 'These blocks insert custom code into the generated model files and functions.  The four file blocks contain text fields to insert custom user code at the top and bottom of the relevant header and source files.  The seven function blocks contain text fields to insert custom user code sections at the declarations, execution and exit sections of the designated model functions.';
    else
        % 10 17
        % 11 17
        % 12 17
        % 13 17
        % 14 17
        % 15 17
        % 16 17
        % 17 19
        % 18 19
        str = 'These eight blocks contain text fields to insert custom user code sections at the declaration, execution and exit sections of the designated subsystem functions.  By placing one of these blocks inside a subsytem, the custom user code will appear in that subsystem''s function.';
        % 20 27
        % 21 27
        % 22 27
        % 23 27
        % 24 27
        % 25 27
        % 26 27
    end % if
    % 28 29
    helpdlg(str)
end % function
