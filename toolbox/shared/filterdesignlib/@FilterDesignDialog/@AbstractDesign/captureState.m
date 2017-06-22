function captureState(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    laState = getState(this);
    % 11 12
    set(this, 'LastAppliedState', laState);
    % 13 14
    if not(isempty(this.FixedPoint))
        captureState(this.FixedPoint);
    end % if
end % function
