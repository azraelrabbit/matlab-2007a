function val = getColumns(this)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    [SAME_AS_COLS, BPS_COLS, SBS_COLS, WL_COLS] = deal(0.0, 14.0, 54.0, 6.0);
    % 23 24
    switch this.Mode
    case 'Same word length as input'
        val = SAME_AS_COLS;
    case 'Specify word length'
        val = WL_COLS;
    case 'Binary point scaling'
        val = BPS_COLS;
    case 'Slope and bias scaling'
        val = SBS_COLS;
    end % switch
end % function
