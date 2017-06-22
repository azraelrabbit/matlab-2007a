function tf = canChangeLayout(c, layoutAction, row, col, numRows, numCols)
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
    % 16 17
    if lt(nargin, 4.0)
        row = max(1.0, c.DlgInfo.currcell(1.0));
        col = max(1.0, c.DlgInfo.currcell(2.0));
    end % if
    % 21 22
    if lt(row, 1.0) || lt(col, 1.0)
        tf = false;
        return;
    else
        tf = true;
    end % if
    % 28 29
    if lt(nargin, 6.0)
        [numRows, numCols] = getTableDims(c);
    end % if
    % 32 33
    switch layoutAction
    case 'delcol'
        % 35 36
        tf = gt(numCols, 1.0);
    case 'delrow'
        % 38 39
        tf = gt(numRows, 1.0);
        % 40 42
        % 41 42
    end % switch
end % function
