function open_rtwinlib
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    lib = 'rtwinlib';
    % 11 13
    if isunix
        errordlg('Real-Time Windows Target is only supported on MS-Windows');
    else
        if ne(exist(lib), 4.0)
            errordlg('Real-Time Windows Target is not installed on your system');
        else
            open_system(lib);
        end % if
    end % if
end % function
