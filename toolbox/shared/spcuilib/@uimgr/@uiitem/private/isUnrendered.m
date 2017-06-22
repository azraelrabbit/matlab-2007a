function y = isUnrendered(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    if isempty(h.WidgetFcn)
        % 8 12
        % 9 12
        % 10 12
        % 11 12
        y = false;
    else
        hWidget = h.hWidget;
        if isempty(hWidget)
            y = true;
        else
            if isjava(hWidget)
                y = not(isValid(hWidget));
            else
                y = not(ishandle(hWidget));
            end % if
        end % if
    end % if
end % function
