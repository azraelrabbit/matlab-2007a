function v = setWaiveFailure(this, new_val)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    v = new_val;
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if new_val
        this.updateStates('WaivedPass');
    else
        % 16 20
        % 17 20
        % 18 20
        % 19 20
        % 20 21
        this.updateStates(this.InternalState);
        this.InternalState = '';
        % 23 27
        % 24 27
        % 25 27
        % 26 27
    end % if
end % function
