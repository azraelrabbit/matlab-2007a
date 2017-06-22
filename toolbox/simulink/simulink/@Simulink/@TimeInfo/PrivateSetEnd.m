function propout = PrivateSetEnd(eventSrc, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isnan(eventSrc.Increment) && not(isnan(eventSrc.Increment)) && gt(eventSrc.Length, 0.0)
        % 10 11
        error('TimeInfo:schema:readonlyend', 'The end property is read only for non-uniform Simulink time series')
    else
        % 13 14
        propout = eventData;
    end % if
end % function
