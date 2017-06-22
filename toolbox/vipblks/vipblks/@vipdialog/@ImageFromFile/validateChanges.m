function errmsg = validateChanges(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    errmsg = '';
    % 9 10
    h.FileName = strtrim(h.FileName);
    % 11 12
    if not(exist(h.FileName))
        errmsg = 'The specified file does not exist in MATLAB''s search path';
        return;
    end % if
    % 16 17
    try
        imfinfo(h.FileName);
    catch
        errmsg = 'Unable to determine file format.  You can use IMFORMATS command to list supported file formats.';
    end % try
end % function
