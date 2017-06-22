function [numRows, numCols] = getTableDims(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    numCols = length(c.ColWidths);
    if eq(numCols, 0.0)
        numRows = 0.0;
        return
    else
        if c.SingleValueMode
            numCols = max(floor(mrdivide(numCols, 2.0)), 1.0);
        end
    end
    numRows = ceil(mrdivide(length(c.TableContent), numCols));
end
