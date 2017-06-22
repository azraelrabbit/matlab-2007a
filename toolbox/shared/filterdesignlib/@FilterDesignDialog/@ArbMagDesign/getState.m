function state = getState(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    state = get(this);
    state = rmfield(state, {'Path','ActiveTab','FixedPoint'});
    % 9 11
    for indx=1.0:10.0
        bandProp = sprintf('Band%d', indx);
        if isempty(this.(bandProp))
            break
        else
            state.(bandProp) = get(this.(bandProp));
        end
    end % for
end
