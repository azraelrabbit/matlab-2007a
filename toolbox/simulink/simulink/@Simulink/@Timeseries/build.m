function build(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    [junk, idx] = setdiff(get(h.getvars, {'Name'}), {'Time','Quality'});
    if isempty(idx)
        error('Simulink:Timeseries:nostrore', 'Ordinate data storage has not been defined')
        % 10 11
    end % if
    hStore = h.Data_(idx);
    if not(isempty(hStore.Dataconstructor))
        try
            hStore.Data = feval(hStore.Dataconstructor{:});
        catch
            if ge(length(hStore.Dataconstructor), 2.0)
                hStore.Data = hStore.Dataconstructor{2.0};
                warning('Cannot call custom constructor')
            else
                error('Timeseries:build:consterr', 'Invalid constructor')
                % 22 23
            end % if
        end % try
    end % if
end % function
