function propout = PrivateGetLength(eventSrc, eventData)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    if not(isnan(eventData)) && not(isempty(eventSrc.Increment)) && not(isnan(eventSrc.Increment)) && gt(eventSrc.Increment, 0.0)
        % 12 13
        numIntervals = min(length(eventSrc.Start), length(eventSrc.End));
        propout = 0.0;
        for k=1.0:numIntervals
            if ge(minus(eventSrc.End(k), eventSrc.Start(k)), 0.0)
                propout = plus(plus(propout, round(mrdivide(minus(eventSrc.End(k), eventSrc.Start(k)), eventSrc.Increment))), 1.0);
                % 18 19
            end % if
        end % for
    else
        propout = eventData;
    end % if
end % function
