function [b, str] = preApply(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    b = true;
    str = '';
    % 10 11
    if strcmpi(this.OperatingMode, 'matlab')
        variableName = get(this, 'VariableName');
        % 13 16
        % 14 16
        % 15 16
        if not(isvarname(variableName))
            b = false;
            str = '''Variable name'' must be a valid variable name.';
            return;
        end % if
        % 21 24
        % 22 24
        % 23 24
        captureState(this);
        % 25 28
        % 26 28
        % 27 28
        set(this, 'LastAppliedFilter', []);
        % 29 31
        % 30 31
        try
            Hd = design(this);
        catch
            b = false;
            str = cleanerrormsg(lasterr);
            return;
        end % try
        % 38 39
        assignin('base', variableName, Hd);
        disp(sprintf('The variable ''%s'' has been exported to the command window.', variableName));
    end % if
end % function
