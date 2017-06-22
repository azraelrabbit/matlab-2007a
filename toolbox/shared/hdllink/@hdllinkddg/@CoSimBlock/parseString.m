function [startIndex, endIndex] = parseString(this, string, delim, mode, curRow, numRows)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    if strcmp(delim, ',')
        offset = 1.0;
    else
        if strcmp(delim, ';')
            offset = 0.0;
        else
            error('parseString called with unknown delimiter')
        end
    end
    inds = strfind(string, delim);
    switch mode
    case 'addRow'
        % 28 30
        if gt(curRow, length(inds))
            startIndex = minus(length(string), offset);
        else
            startIndex = minus(inds(curRow), 1.0);
        end
        endIndex = startIndex;
    case 'changeRow'
        % 36 38
        if eq(curRow, 1.0)
            startIndex = plus(1.0, offset);
            if gt(numRows, 1.0)
                endIndex = minus(inds(1.0), 1.0);
            else
                endIndex = minus(length(string), offset);
            end
        else
            if lt(curRow, numRows)
                startIndex = plus(inds(minus(curRow, 1.0)), 1.0);
                endIndex = minus(inds(curRow), 1.0);
            else
                startIndex = plus(inds(minus(curRow, 1.0)), 1.0);
                endIndex = minus(length(string), offset);
            end
        end
    case 'deleteRow'
        if eq(curRow, 1.0)
            startIndex = plus(1.0, offset);
            if gt(numRows, 1.0)
                endIndex = inds(1.0);
            else
                endIndex = minus(length(string), offset);
            end
        else
            if lt(curRow, numRows)
                startIndex = inds(minus(curRow, 1.0));
                endIndex = minus(inds(curRow), 1.0);
            else
                startIndex = inds(minus(curRow, 1.0));
                endIndex = minus(length(string), offset);
            end
        end
    end
end
