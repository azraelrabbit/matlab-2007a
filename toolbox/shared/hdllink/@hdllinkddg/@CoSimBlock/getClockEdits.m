function [path, mode, time] = getClockEdits(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    ClockPaths = strread(this.ClockPaths, '%s', 'delimiter', ';', 'whitespace', '');
    ClockModes = eval(this.ClockModes);
    ClockTimes = strread(this.ClockTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
    % 12 14
    % 13 14
    path = strtrim(ClockPaths{this.CurClockRow});
    if eq(ClockModes(this.CurClockRow), 1.0)
        mode = 'Falling';
    else
        mode = 'Rising';
    end % if
    time = strtrim(ClockTimes{this.CurClockRow});
end % function
