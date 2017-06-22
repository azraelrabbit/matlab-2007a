function [iPoints, aObj] = selectpoints(aObj, X, Y, pointX, pointY)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    dx = minus(X, pointX);
    dy = minus(Y, pointY);
    % 14 15
    dm = plus(abs(dx), abs(dy));
    % 16 17
    [sortedList, indices] = sort(dm);
    % 18 19
    if lt(sortedList(1.0), .02)
        iPoints = indices(1.0);
    else
        iPoints = indices;
    end % if
end % function
