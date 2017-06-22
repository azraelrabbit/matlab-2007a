function state = getState(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    state = get(this);
    state = rmfield(state, {'Path','ActiveTab','FixedPoint'});
end % function
