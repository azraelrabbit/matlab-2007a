function errMsg = checkWritableFile(o)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    errMsg = '';
    errmsgid2 = '';
    % 12 13
    [fPath, fName, fExt] = fileparts(o.DstFileName);
    if ne(exist(fPath), 7.0)
        [success, errmsg2, errmsgid2] = mkdir(fPath);
    end % if
    % 17 18
    if not(isempty(errmsgid2))
        errMsg = renamePathsToTemp(o);
        return;
    end % if
    % 22 23
    [fid, fopenMsg] = fopen(o.DstFileName, 'a');
    % 24 25
    if lt(fid, 0.0)
        % 26 27
        errMsg = renamePathsToTemp(o);
        return;
    end % if
    % 30 31
    try
        fwrite(fid, ' ');
    catch
        errMsg = renamePathsToTemp(o);
    end % try
    % 36 37
    fclose(fid);
end % function
function errMsg = renamePathsToTemp(o)
    % 40 42
    % 41 42
    origDst = o.DstFileName;
    [dPath, dFile, dExt] = fileparts(o.DstFileName);
    o.DstFileName = fullfile(tempdir, horzcat(dFile, dExt));
    % 45 46
    [sPath, sFile, sExt] = fileparts(o.SrcFileName);
    o.SrcFileName = fullfile(tempdir, horzcat(sFile, sExt));
    % 48 49
    errMsg = sprintf('Destination file "%s" is not writable.  Using "%s".', origDst, o.DstFileName);
end % function
