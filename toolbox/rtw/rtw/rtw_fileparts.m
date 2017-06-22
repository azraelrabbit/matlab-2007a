function value = rtw_fileparts(fname)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    [pathstr, filestr, extstr] = fileparts(fname);
    value.Path = pathstr;
    value.File = filestr;
    value.Ext = extstr;
end % function
