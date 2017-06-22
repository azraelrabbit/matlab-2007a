function hout = copy(h)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    % 5 6
    hout = Simulink.FrameInfo;
    % 7 8
    set(hout, 'Framesize', h.Framesize, 'FrameStart', h.FrameStart, 'FrameEnd', h.FrameEnd, 'FrameIncrement', h.FrameIncrement);
    % 9 11
    % 10 11
end % function
