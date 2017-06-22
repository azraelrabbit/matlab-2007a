function aObj = domove(aObj, x, y)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    figH = gcbf;
    oldFigUnits = get(figH, 'Units');
    oldAxUnits = get(A, 'Units');
    set(figH, 'Units', 'pixels');
    myFigPos = get(figH, 'Position');
    % 12 15
    % 13 15
    set(A, 'Units', 'pixels');
    pos = get(A, 'Position');
    % 16 19
    % 17 19
    set(figH, 'Units', oldFigUnits);
    set(0.0, 'Units', oldUnits);
    % 20 23
    % 21 23
    A = set(A, 'Units', oldAxUnits);
end % function
function hit = IsInRect(rect, pt)
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    rectBounds = vertcat(rect(1.0:2.0), plus(rect(1.0:2.0), rect(3.0:4.0)));
    % 30 32
    hit = and(ge(pt, rectBounds(1.0, :)), le(pt, rectBounds(2.0, :)));
end % function
