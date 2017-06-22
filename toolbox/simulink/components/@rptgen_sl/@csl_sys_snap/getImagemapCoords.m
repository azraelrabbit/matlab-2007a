function pos = getImagemapCoords(c, pos)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    imSize = c.RuntimeViewportSize;
    boundBox = c.RuntimeBoundingBox;
    % 12 13
    if strncmpi(c.RuntimePaperOrientation, 'p', 1.0)
        % 14 15
        pos(1.0:2.0:minus(end, 1.0)) = round(mrdivide(mtimes(minus(pos(1.0:2.0:minus(end, 1.0)), boundBox(1.0)), imSize(1.0)), minus(boundBox(3.0), boundBox(1.0))));
        % 16 17
        pos(2.0:2.0:end) = round(mrdivide(mtimes(minus(pos(2.0:2.0:end), boundBox(2.0)), imSize(2.0)), minus(boundBox(4.0), boundBox(2.0))));
    else
        % 19 21
        % 20 21
        origPos = pos;
        pos(1.0:2.0:minus(end, 1.0)) = round(mrdivide(mtimes(minus(origPos(2.0:2.0:end), boundBox(1.0)), imSize(1.0)), minus(boundBox(4.0), boundBox(2.0))));
        % 23 24
        pos(2.0:2.0:end) = round(mrdivide(mtimes(minus(boundBox(3.0), origPos(1.0:2.0:minus(end, 1.0))), imSize(2.0)), minus(boundBox(3.0), boundBox(1.0))));
        % 25 26
    end % if
end % function
