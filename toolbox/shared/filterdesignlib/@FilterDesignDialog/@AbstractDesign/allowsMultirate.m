function b = allowsMultirate(this)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if strcmpi(this.ImpulseResponse, 'fir')
        b = true;
    else
        if isempty(this.FDesign)
            b = false;
        else
            state = getState(this);
            if strcmpi(state.FilterType, 'single-rate')
                state.FilterType = 'Decimator';
            end % if
            hfdesign = getFDesign(this, state);
            b = not(isempty(designmethods(hfdesign, 'iir')));
        end % if
    end % if
end % function
