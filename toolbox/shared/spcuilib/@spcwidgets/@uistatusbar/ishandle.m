function y = ishandle(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    y = not(isempty(h.hWidget)) && ishandle(h.hWidget);
end
