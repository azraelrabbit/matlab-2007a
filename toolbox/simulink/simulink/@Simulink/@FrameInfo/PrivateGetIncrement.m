function propout = PrivateGetIncrement(h, eventData)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if gt(h.Framesize, 0.0) && strcmp(h.State, 'Samples')
        propout = mrdivide(h.FrameIncrement, h.Framesize);
    else
        if strcmp(h.State, 'Frames')
            propout = h.FrameIncrement;
        else
            propout = NaN;
        end % if
    end % if
end % function
