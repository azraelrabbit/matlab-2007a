function propout = PrivateSetIncrement(eventSrc, eventData)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    if isnan(eventData) && not(isnan(eventSrc.Increment)) && gt(eventSrc.Length, 0.0)
        % 14 15
        error('TimeInfo:schema:nonans', 'The increment property cannot be assigned to NaN if the time vector is unformly sampled')
    else
        % 17 18
        if eq(eventData, 0.0)
            error('TimeInfo:schema:zeroin', 'The increment cannot be zero')
            % 20 21
        end % if
        propout = eventData;
    end % if
end % function
