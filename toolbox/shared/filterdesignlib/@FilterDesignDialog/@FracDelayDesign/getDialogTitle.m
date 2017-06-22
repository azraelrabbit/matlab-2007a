function dialogTitle = getDialogTitle(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(this.OperatingMode, 'Simulink')
        dialogTitle = 'Fractional Delay Filter';
    else
        dialogTitle = 'Fractional Delay Design';
    end % if
end % function
