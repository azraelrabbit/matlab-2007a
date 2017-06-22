function data = getClockListData(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    data = cell(1.0, this.NumClockRows);
    % 10 11
    if gt(this.NumClockRows, 0.0)
        ClockPaths = strread(this.ClockPaths, '%s', 'delimiter', ';', 'whitespace', '');
        ClockModes = eval(this.ClockModes);
        ClockTimes = strread(this.ClockTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 15 17
        % 16 17
        formatStr = this.getClockFormatString('all');
        % 18 19
        for ii=1.0:this.NumClockRows
            path = ClockPaths{ii};
            pathStrLen = this.getClockFormatString('pathLength');
            if gt(length(path), pathStrLen)
                path = horzcat('...', path(plus(minus(end, pathStrLen), 4.0):end));
            end % if
            % 25 26
            if isequal(ClockModes(ii), 1.0)
                data{1.0, ii} = sprintf(formatStr, path, 'Falling', ClockTimes{ii});
            else
                % 29 31
                % 30 31
                % 31 32
                data{1.0, ii} = sprintf(formatStr, path, 'Rising', ClockTimes{ii});
                % 33 36
                % 34 36
                % 35 36
            end % if
        end % for
    end % if
end % function
