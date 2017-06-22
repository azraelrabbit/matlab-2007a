function h = loadobj(s)
    % 1 3
    % 2 3
    h = Simulink.TimeseriesDataConstructor;
    if isstruct(s)
        if isfield(s, 'Constructor')
            h.Constructor = s.Constructor;
        end % if
        if isfield(s, 'Data')
            h.Data = s.Data;
        end % if
    else
        h = s;
    end % if
end % function
