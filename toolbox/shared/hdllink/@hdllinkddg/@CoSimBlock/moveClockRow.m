function moveClockRow(this, dir, dialog)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    switch dir
    case 'up'
        moveIsValid = gt(this.CurClockRow, 1.0);
        newRow = minus(this.CurClockRow, 1.0);
    case 'down'
        % 15 16
        moveIsValid = lt(this.CurClockRow, this.NumClockRows);
        newRow = plus(this.CurClockRow, 1.0);
    otherwise
        % 19 20
        error('Unhandled case');
    end % switch
    % 22 24
    % 23 24
    if moveIsValid
        paths = strread(this.ClockPaths, '%s', 'delimiter', ';', 'whitespace', '');
        modes = eval(this.ClockModes);
        times = strread(this.ClockTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 28 30
        % 29 30
        this.DisableList = true;
        % 31 33
        % 32 33
        ind = this.CurClockRow;
        other = newRow;
        % 35 37
        % 36 37
        this.CurClockRow = newRow;
        % 38 39
        tmpPath = paths(ind);
        paths(ind) = paths(other);
        paths(other) = tmpPath;
        % 42 43
        tmpMode = modes(ind);
        modes(ind) = modes(other);
        modes(other) = tmpMode;
        % 46 47
        tmpTime = times(ind);
        times(ind) = times(other);
        times(other) = tmpTime;
        % 50 54
        % 51 54
        % 52 54
        % 53 54
        semi = cell(this.NumClockRows, 1.0);
        semi(:) = {';'};
        paths = strcat(semi, paths);
        paths = cat(2.0, paths{:});
        paths = paths(2.0:end);
        % 59 63
        % 60 63
        % 61 63
        % 62 63
        semi = cell(this.NumClockRows, 1.0);
        semi(:) = {','};
        times = strcat(semi, times);
        times = cat(2.0, times{:});
        times = horzcat('[', times(2.0:end), ']');
        % 68 71
        % 69 71
        % 70 71
        set(this, 'ClockPaths', paths, 'ClockModes', horzcat('[', sprintf('%d ', modes), ']'), 'ClockTimes', times);
        % 72 76
        % 73 76
        % 74 76
        % 75 76
        this.enableApplyButton(dialog);
        % 77 78
        this.DisableList = false;
    end % if
end % function
