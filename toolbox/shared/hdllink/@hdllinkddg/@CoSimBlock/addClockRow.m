function addClockRow(this, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    this.DisableList = true;
    % 11 12
    if eq(this.NumClockRows, 0.0)
        set(this, 'ClockPaths', ' ', 'ClockModes', '[1]', 'ClockTimes', '[2]');
    else
        % 15 17
        % 16 17
        % 17 18
        pInd = this.parseString(this.ClockPaths, ';', 'addRow', this.CurClockRow);
        % 19 20
        pm = eval(this.ClockModes);
        pm = horzcat(pm(1.0:this.CurClockRow), 1.0, pm(plus(this.CurClockRow, 1.0):end));
        % 22 23
        tInd = this.parseString(this.ClockTimes, ',', 'addRow', this.CurClockRow);
        % 24 25
        set(this, 'ClockPaths', horzcat(this.ClockPaths(1.0:pInd), '; ', this.ClockPaths(plus(pInd, 1.0):end)), 'ClockModes', horzcat('[', sprintf('%d ', pm), ']'), 'ClockTimes', horzcat(this.ClockTimes(1.0:tInd), ',2', this.ClockTimes(plus(tInd, 1.0):end)));
        % 26 31
        % 27 31
        % 28 31
        % 29 31
        % 30 31
    end % if
    % 32 33
    this.NumClockRows = plus(this.NumClockRows, 1.0);
    this.CurClockRow = plus(this.CurClockRow, 1.0);
    % 35 36
    this.enableApplyButton(dialog);
    % 37 39
    % 38 39
    this.DisableList = false;
end % function
