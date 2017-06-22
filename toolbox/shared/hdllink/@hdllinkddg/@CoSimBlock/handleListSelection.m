function handleListSelection(this, tab, index)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch tab
    case 'port'
        % 11 12
        this.CurPortRow = plus(index, 1.0);
    case 'clock'
        % 14 15
        this.CurClockRow = plus(index, 1.0);
    end % switch
end % function
