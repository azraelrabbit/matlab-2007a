function deleteClockRow(this, dialog)
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
    if eq(this.NumClockRows, 1.0)
        set(this, 'ClockPaths', '', 'ClockModes', '[]', 'ClockTimes', '[]');
        % 14 18
        % 15 18
        % 16 18
        % 17 18
        this.NumClockRows = 0.0;
        this.CurClockRow = 0.0;
    else
        % 21 23
        % 22 23
        [pStartInd, pEndInd] = this.parseString(this.ClockPaths, ';', 'deleteRow', this.CurClockRow, this.NumClockRows);
        % 24 27
        % 25 27
        % 26 27
        pm = eval(this.ClockModes);
        pm = horzcat(pm(1.0:minus(this.CurClockRow, 1.0)), pm(plus(this.CurClockRow, 1.0):end));
        % 29 30
        [tStartInd, tEndInd] = this.parseString(this.ClockTimes, ',', 'deleteRow', this.CurClockRow, this.NumClockRows);
        % 31 34
        % 32 34
        % 33 34
        set(this, 'ClockPaths', horzcat(this.ClockPaths(1.0:minus(pStartInd, 1.0)), this.ClockPaths(plus(pEndInd, 1.0):end)), 'ClockModes', horzcat('[', sprintf('%d ', pm), ']'), 'ClockTimes', horzcat(this.ClockTimes(1.0:minus(tStartInd, 1.0)), this.ClockTimes(plus(tEndInd, 1.0):end)));
        % 35 41
        % 36 41
        % 37 41
        % 38 41
        % 39 41
        % 40 41
        this.NumClockRows = minus(this.NumClockRows, 1.0);
        if gt(this.CurClockRow, this.NumClockRow)
            this.CurClockRow = this.NumClockRow;
        end % if
        % 45 46
        this.enableApplyButton(dialog);
        % 47 48
    end % if
    % 49 50
    this.DisableList = false;
end % function
