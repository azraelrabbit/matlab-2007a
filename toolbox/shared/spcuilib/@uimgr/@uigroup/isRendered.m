function y = isRendered(h)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    if not(isempty(h.hWidget))
        y = ishandle(h.hWidget);
    else
        % 16 18
        y = false;
        h = h.down;
            while not(isempty(h))
            y = isRendered(h);
            if y
                return;
            end % if
            h = h.right;
        end % while
    end % if
end % function
