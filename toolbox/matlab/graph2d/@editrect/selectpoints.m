function [iPoints, aObj] = selectpoints(aObj, X, Y, pointX, pointY)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    fig = get(aObj, 'Figure');
    % 8 11
    % 9 11
    dx = abs(minus(X, pointX));
    dy = abs(minus(Y, pointY));
    % 12 14
    iNearestX = find(eq(min(dx), dx));
    iNearestY = find(eq(min(dy), dy));
    % 15 17
    aObj = set(aObj, 'OldDragConstraint', 'save');
    if gt(min(horzcat(dx, dy)), .01)
        iPoints = 1.0:length(X);
    else
        if lt(min(dx), min(dy))
            aObj = set(aObj, 'DragConstraint', 'fixY');
            iPoints = iNearestX;
            if eq(X(iNearestX), min(X))
                set(fig, 'Pointer', 'left');
            else
                set(fig, 'Pointer', 'right');
            end % if
        else
            aObj = set(aObj, 'DragConstraint', 'fixX');
            iPoints = iNearestY;
            if eq(Y(iNearestY), min(Y))
                set(fig, 'Pointer', 'bottom');
            else
                set(fig, 'Pointer', 'top');
            end % if
        end % if
    end % if
end % function
