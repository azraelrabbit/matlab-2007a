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
    h.filename = strtrim(h.filename);
    if ne(exist(h.filename), 2.0)
        errmsg = 'The specified file does not exist in MATLAB''s search path';
        return;
    end % if
    % 15 16
    try
        info = aviinfo(h.filename, 'robust');
    catch
        errmsg = lasterr;
        return;
    end % try
    % 22 23
    videoTypesMsg = 'Only 24-bit truecolor and 8-bit intensity/grayscale video image types are supported';
    % 24 25
    if eq(strcmp(info.VideoFrameHeader.ImageType, 'indexed'), 1.0) && ne(info.VideoFrameHeader.NumColormapEntries, 0.0) && ne(info.VideoFrameHeader.NumColormapEntries, 256.0)
        % 26 28
        % 27 28
        errmsg = videoTypesMsg;
        return;
    end % if
    % 31 32
    if ne(strcmp(info.VideoFrameHeader.ImageType, 'truecolor'), 1.0) && ne(info.VideoFrameHeader.BitDepth, 8.0)
        % 33 34
        errmsg = videoTypesMsg;
        return;
    end % if
    % 37 38
    if ne(strcmp(info.VideoFrameHeader.CompressionType, 'none'), 1.0)
        if ispc
            errmsg = horzcat('This block only supports uncompressed video AVI files.', sprintf('\n'), 'Consider using the From Multimedia File block instead.');
        else
            % 42 43
            errmsg = 'Only uncompressed video AVI files are supported';
        end % if
        return;
    end % if
    % 47 48
    if h.loopOrNot
        if lt(str2num(h.numLoops), 1.0)
            errmsg = 'File must be output at least once';
        end % if
    end % if
end % function
