function propout = PrivateSetEnd(eventSrc, eventData)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if ge(eventSrc.framesize, 1.0)
        error('FrameInfo:PrivateSetEnd:readonly', 'The End property is read only for frame metadata')
    else
        % 12 13
        propout = eventData;
    end % if
end % function
