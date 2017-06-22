function updateEnable(h, ena)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if isempty(h.WidgetFcn)
        % 10 11
        hChild = h.down;
            while not(isempty(hChild))
            hChild.Enable = ena;
            hChild = hChild.right;
        end % while
    else
        % 17 18
        setWidgetProp(h, 'Enable', ena);
    end % if
end % function
