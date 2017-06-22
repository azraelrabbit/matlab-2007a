function h = loadobj(s)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h = Simulink.TimeseriesArray;
    if isstruct(s)
        if not(isfield(s, 'Data'))
            s.Data = [];
        end % if
        if not(isfield(s, 'GridFirst'))
            s.GridFirst = true;
        end % if
        h.LoadedData = s;
    else
        h = s;
    end % if
end % function
