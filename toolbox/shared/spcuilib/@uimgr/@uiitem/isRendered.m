function y = isRendered(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hWidget = h.hWidget;
    if isjava(hWidget)
        y = isValid(hWidget);
    else
        y = not(isempty(hWidget)) && ishandle(hWidget);
    end
end
