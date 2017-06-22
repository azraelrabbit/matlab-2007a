function h = findFigParent(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(ishandle(h))
        h = [];
    else
            while not(isempty(h))
            if strcmp(get(h, 'type'), 'figure')
                return;
            end % if
            h = get(h, 'parent');
        end % while
    end % if
end % function
