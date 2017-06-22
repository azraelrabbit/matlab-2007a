function place = getDefaultPlacement(hGroup)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    hChild = hGroup.down;
    if isempty(hChild)
        % 22 26
        % 23 26
        % 24 26
        place = 0.0;
    else
        maxPlace = -Inf;
            while not(isempty(hChild))
            t = hChild.ActualPlacement;
            if lt(maxPlace, t)
                maxPlace = t;
            end % if
            hChild = hChild.right;
        end % while
        place = plus(maxPlace, 1.0);
    end % if
end % function
