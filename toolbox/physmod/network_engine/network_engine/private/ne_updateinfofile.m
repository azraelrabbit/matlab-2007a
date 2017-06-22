function ne_updateinfofile(info)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    infoFileName = ne_infofilename(info.SourceFile);
    if exist(infoFileName, 'file')
        delete(infoFileName);
    end % if
    % 12 13
    ne_writeinfofile(infoFileName, info);
    % 14 15
    fileattrib(infoFileName, '-w');
end % function
