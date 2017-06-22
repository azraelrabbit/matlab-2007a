function direct = linedir(layout)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(layout(1.0, 2.0), layout(2.0, 2.0))
        % 10 12
        if lt(layout(1.0, 1.0), layout(2.0, 1.0))
            direct = 0.0;
        else
            direct = 2.0;
        end % if
    else
        if eq(layout(1.0, 1.0), layout(2.0, 1.0))
            if lt(layout(1.0, 2.0), layout(2.0, 2.0))
                direct = 1.0;
            else
                direct = 3.0;
            end % if
        else
            % 24 26
            direct = -1.0;
        end % if
    end % if
end % function
