function stcvhtml(filepath, filename)
    % 1 4
    % 2 4
    % 3 4
    currentpath = pwd;
    cd(filepath);
    [t, d] = cvload(filename);
    % 7 8
    if not(isempty(d{1.0}))
        cvhtml(filename, d{:});
    else
        warndlg('Unable to launch Model Coverage Report because no coverage data was recorded.', 'SystemTest', 'modal')
    end % if
    % 13 14
    cd(currentpath);
end % function
