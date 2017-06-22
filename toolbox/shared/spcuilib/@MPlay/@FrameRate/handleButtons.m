function handleButtons(this, buttonStr)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    switch lower(buttonStr)
    case 'dropframescheckbox'
        % 9 16
        % 10 16
        % 11 16
        % 12 16
        % 13 16
        % 14 16
        % 15 16
        refresh(this.dialog);
        resetSize(this.dialog, 1.0)
    otherwise
        % 19 20
        error('unhandled button in frame rate dialog')
    end % switch
end % function
