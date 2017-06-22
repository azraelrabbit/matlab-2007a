function h = TimeseriesDataConstructor(inCell)
    % 1 4
    % 2 4
    % 3 4
    h = Simulink.TimeseriesDataConstructor;
    if gt(nargin, 0.0)
        h.Constructor = inCell;
    end % if
end % function
