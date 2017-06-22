function changeClockRow(this, dialog)
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
    % 11 13
    % 12 13
    [pStartInd, pEndInd] = this.parseString(this.ClockPaths, ';', 'changeRow', this.CurClockRow, this.NumClockRows);
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    newPath = this.stripPath(this.ClockPathEdit);
    if isempty(newPath)
        newPath = ' ';
    end % if
    % 23 24
    pm = eval(this.ClockModes);
    % 25 26
    switch this.ClockModeEdit
    case 'Falling'
        pm = horzcat(pm(1.0:minus(this.CurClockRow, 1.0)), 1.0, pm(plus(this.CurClockRow, 1.0):end));
    case 'Rising'
        pm = horzcat(pm(1.0:minus(this.CurClockRow, 1.0)), 2.0, pm(plus(this.CurClockRow, 1.0):end));
    otherwise
        error('CoSim::changeClockRow: invalid clock edge mode')
    end % switch
    % 34 35
    newTime = strtrim(this.ClockTimeEdit);
    if isempty(newTime)
        newTime = ' ';
    end % if
    % 39 40
    [tStartInd, tEndInd] = this.parseString(this.ClockTimes, ',', 'changeRow', this.CurClockRow, this.NumClockRows);
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    % 45 46
    set(this, 'ClockPaths', horzcat(this.ClockPaths(1.0:minus(pStartInd, 1.0)), newPath, this.ClockPaths(plus(pEndInd, 1.0):end)), 'ClockModes', horzcat('[', sprintf('%d ', pm), ']'), 'ClockTimes', horzcat(this.ClockTimes(1.0:minus(tStartInd, 1.0)), newTime, this.ClockTimes(plus(tEndInd, 1.0):end)));
    % 47 55
    % 48 55
    % 49 55
    % 50 55
    % 51 55
    % 52 55
    % 53 55
    % 54 55
    dialog.enableApplyButton(true);
    % 56 58
    % 57 58
    this.DisableList = false;
end % function
