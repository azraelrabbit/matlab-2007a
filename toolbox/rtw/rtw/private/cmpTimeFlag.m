function result = cmpTimeFlag(file1, file2)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    if isempty(file1)
        result = 2.0;
        return
    end
    % 16 18
    if isempty(file2)
        result = -2.0;
        return
    end
    % 21 23
    record1 = dir(eval('file1'));
    [row, col] = size(record1);
    if (eq(row, 0.0)) | (eq(col, 0.0))
        result = 2.0;
        return
    end
    record2 = dir(eval('file2'));
    [row, col] = size(record2);
    if (eq(row, 0.0)) | (eq(col, 0.0))
        result = -2.0;
        return
    end
    % 34 36
    date1 = record1.datenum;
    date2 = record2.datenum;
    % 37 39
    if lt(date1, date2)
        result = 1.0;
        return
    else
        if gt(date1, date2)
            result = -1.0;
            return
        end
    end
    result = 0.0;
end
