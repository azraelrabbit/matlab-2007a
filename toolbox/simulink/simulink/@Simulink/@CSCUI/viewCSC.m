function viewCSC(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    fileinfo = h.cscRegFile;
    filepath = fileinfo{1.0};
    filename = fileinfo{2.0};
    fileext = fileinfo{3.0};
    % 12 13
    div = filesep;
    filelong = horzcat(filepath, div, filename, fileext);
    % 15 16
    if isempty(filepath) || isempty(filename)
        errordlg('The CSC registration file path or name must not be empty.', 'Custom Storage Class Designer', 'non-modal');
        % 18 19
        return;
    end % if
    % 21 23
    % 22 23
    edit(filelong);
end % function
