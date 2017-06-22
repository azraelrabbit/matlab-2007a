function val = getColumns(this)
    % 1 23
    % 2 23
    % 3 23
    % 4 23
    % 5 23
    % 6 23
    % 7 23
    % 8 23
    % 9 23
    % 10 23
    % 11 23
    % 12 23
    % 13 23
    % 14 23
    % 15 23
    % 16 23
    % 17 23
    % 18 23
    % 19 23
    % 20 23
    % 21 23
    % 22 23
    [SAME_AS_COLS, BPS_COLS, SBS_COLS, WL_COLS] = deal(0.0, 14.0, 54.0, 6.0);
    % 24 25
    switch this.Mode
    case 'Same word length as input'
        val = SAME_AS_COLS;
    case 'Specify word length'
        val = WL_COLS;
    case 'Binary point scaling'
        val = BPS_COLS;
    case 'Slope and bias scaling'
        val = SBS_COLS;
    otherwise
        val = SAME_AS_COLS;
    end % switch
end % function
