function hTbl = loadTflTableFromDisk(h, fileName)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if exist(fileName, 'file')
        s = load(fileName);
        hTbl = s.hTflTable;
    else
        hTbl = 0.0;
    end % if
end % function
