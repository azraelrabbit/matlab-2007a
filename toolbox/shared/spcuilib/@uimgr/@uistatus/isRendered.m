function y = isRendered(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    hWidget = h.hWidget;
    y = not(isempty(hWidget)) && ishandle(hWidget) && gt(hWidget.Index, 0.0);
end
