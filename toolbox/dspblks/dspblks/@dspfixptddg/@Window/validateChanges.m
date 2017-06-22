function errmsg = validateChanges(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    errmsg = '';
    success = 1.0;
    % 12 15
    % 13 15
    % 14 15
    if strcmp(this.wintype, 'User defined') && this.OptParams
        addlargsstr = this.UserParams;
        try
            addlargs = evalin('base', addlargsstr);
            if not(iscell(addlargs))
                success = 0.0;
            end % if
        catch
            success = 0.0;
        end % try
    end % if
    if not(success)
        errmsg = 'Additional window function arguments must be specified in a cell array.';
    end % if
end % function
