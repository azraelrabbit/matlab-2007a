function twiddleClockTimeEdit(this, dialog)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch this.ClockModeEdit
    case 'Falling'
        dialog.setEnabled('ClockTimeEdit', 1.0);
    case 'Rising'
        dialog.setEnabled('ClockTimeEdit', 1.0);
    end % switch
end % function
