function frameflag = isframe(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    frameflag = isa(h.TimeInfo, 'Simulink.FrameInfo');
end % function
