function propout = PrivateSetIncrement(eventSrc, eventData)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    if ge(eventSrc.framesize, 1.0)
        error('FrameInfo:PrivateSetIncrement:readonly', 'The increment property is read only for frame based time series')
    else
        % 9 10
        propout = eventData;
    end % if
end % function
