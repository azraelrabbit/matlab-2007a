function colId = getColId(this, col)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    switch col
    case 'idxopt'
        colId = 1.0;
    case 'idx'
        colId = 2.0;
    case 'outsize'
        colId = 3.0;
    otherwise
        colId = -1.0;
    end % switch
    % 16 17
end % function
