function [status, errMsg] = preApply(this, dialog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    status = true;
    errMsg = '';
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
    if eq(this.NumPortRows, 0.0) && strcmp(this.PortPaths, ' ')
        this.PortPaths = '';
    end % if
    % 26 27
    if eq(this.NumClockRows, 0.0) && strcmp(this.ClockPaths, ' ')
        this.ClockPaths = '';
    end % if
    % 30 31
    if gt(this.NumPortRows, 0.0)
        PortPaths = strread(this.PortPaths, '%s', 'delimiter', ';', 'whitespace', '');
        for ii=1.0:length(PortPaths)
            if isempty(deblank(PortPaths{ii}))
                status = false;
                errMsg = 'Port HDL names cannot be empty';
                break
            end % if
        end % for
    end % if
    % 41 42
    if status && gt(this.NumClockRows, 0.0)
        ClockPaths = strread(this.ClockPaths, '%s', 'delimiter', ';', 'whitespace', '');
        for ii=1.0:length(ClockPaths)
            if isempty(deblank(ClockPaths{ii}))
                status = false;
                errMsg = 'Clock HDL names cannot be empty';
                break
            end % if
        end % for
    end % if
    % 52 53
    if status
        [status, errMsg] = this.preApplyCallback(dialog);
    end % if
end % function
