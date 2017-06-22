function movePortRow(this, dir, dialog)
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
        moveIsValid = gt(this.CurPortRow, 1.0);
        newRow = minus(this.CurPortRow, 1.0);
    case 'down'
        % 15 16
        moveIsValid = lt(this.CurPortRow, this.NumPortRows);
        newRow = plus(this.CurPortRow, 1.0);
    otherwise
        % 19 20
        error('Unhandled case');
    end % switch
    % 22 24
    % 23 24
    if moveIsValid
        paths = strread(this.PortPaths, '%s', 'delimiter', ';', 'whitespace', '');
        modes = eval(this.PortModes);
        times = strread(this.PortTimes(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 28 29
        signs = eval(this.PortSigns);
        fracs = strread(this.PortFracLengths(2.0:minus(end, 1.0)), '%s', 'delimiter', ',', 'whitespace', '');
        % 31 33
        % 32 33
        this.DisableList = true;
        % 34 36
        % 35 36
        ind = this.CurPortRow;
        other = newRow;
        % 38 40
        % 39 40
        this.CurPortRow = newRow;
        % 41 43
        % 42 43
        tmpPath = paths(ind);
        paths(ind) = paths(other);
        paths(other) = tmpPath;
        % 46 47
        tmpMode = modes(ind);
        modes(ind) = modes(other);
        modes(other) = tmpMode;
        % 50 51
        tmpTime = times(ind);
        times(ind) = times(other);
        times(other) = tmpTime;
        % 54 55
        tmpSign = signs(ind);
        signs(ind) = signs(other);
        signs(other) = tmpSign;
        % 58 59
        tmpFrac = fracs(ind);
        fracs(ind) = fracs(other);
        fracs(other) = tmpFrac;
        % 62 66
        % 63 66
        % 64 66
        % 65 66
        semi = cell(this.NumPortRows, 1.0);
        semi(:) = {';'};
        paths = strcat(semi, paths);
        paths = cat(2.0, paths{:});
        paths = paths(2.0:end);
        % 71 73
        % 72 73
        semi = cell(this.NumPortRows, 1.0);
        semi(:) = {','};
        times = strcat(semi, times);
        times = cat(2.0, times{:});
        times = horzcat('[', times(2.0:end), ']');
        % 78 80
        % 79 80
        semi = cell(this.NumPortRows, 1.0);
        semi(:) = {','};
        fracs = strcat(semi, fracs);
        fracs = cat(2.0, fracs{:});
        fracs = horzcat('[', fracs(2.0:end), ']');
        % 85 87
        % 86 87
        set(this, 'PortPaths', paths, 'PortModes', horzcat('[', sprintf('%d ', modes), ']'), 'PortTimes', times, 'PortSigns', horzcat('[', sprintf('%d ', signs), ']'), 'PortFracLengths', fracs);
        % 88 94
        % 89 94
        % 90 94
        % 91 94
        % 92 94
        % 93 94
        this.enableApplyButton(dialog);
        % 95 96
        this.DisableList = false;
    end % if
end % function
