function errmsg = validateChanges(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    errmsg = '';
    % 9 11
    % 10 11
    [path, file_no_path, file_ext] = fileparts(h.outputFilename);
    if ne(strcmpi(file_ext, '.avi'), 1.0)
        errmsg = 'File extension must be ''.avi''';
        return;
    end % if
end % function
