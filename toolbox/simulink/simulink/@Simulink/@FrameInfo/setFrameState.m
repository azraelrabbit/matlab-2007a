function this = setFrameState(this, newState)
    % 1 3
    % 2 3
    this.State = newState;
    this = update(this);
end % function
