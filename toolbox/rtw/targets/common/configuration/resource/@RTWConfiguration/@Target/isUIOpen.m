function status = isUIOpen(target)
    % 1 17
    % 2 17
    % 3 17
    % 4 17
    % 5 17
    % 6 17
    % 7 17
    % 8 17
    % 9 17
    % 10 17
    % 11 17
    % 12 17
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    frame = target.user_interface;
    if isempty(frame)
        % 19 20
        status = 0.0;
    else
        % 22 23
        if frame.isVisible
            % 24 25
            status = 1.0;
        else
            % 27 28
            status = 0.0;
        end % if
    end % if
end % function
