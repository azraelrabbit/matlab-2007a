function makeLineImagemap(c, gm, lineInfo, id)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    points = lineInfo.Points;
    lineList = cell(minus(size(points, 1.0), 1.0), 3.0);
    for i=2.0:size(points, 1.0)
        x1 = points(minus(i, 1.0), 1.0);
        x2 = points(i, 1.0);
        y1 = points(minus(i, 1.0), 2.0);
        y2 = points(i, 2.0);
        % 21 22
        gm.addArea(getImagemapCoords(c, locBorder(x1, y1, x2, y2, 2.0)), id);
    end % for
    % 24 25
    branchLines = lineInfo.Branch;
    for i=1.0:length(branchLines)
        makeLineImagemap(c, gm, branchLines(i), id);
    end % for
end % function
function lineBox = locBorder(x1, y1, x2, y2, r)
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    % 35 36
    h = minus(y2, y1);
    w = minus(x2, x1);
    n = mrdivide(r, sqrt(max(plus(mpower(h, 2.0), mpower(w, 2.0)), 1.0)));
    % 39 40
    lineBox = horzcat(plus(minus(x1, mtimes(n, w)), mtimes(n, h)), minus(minus(y1, mtimes(n, h)), mtimes(n, w)), plus(plus(x2, mtimes(n, w)), mtimes(n, h)), minus(plus(y2, mtimes(n, h)), mtimes(n, w)), minus(plus(x2, mtimes(n, w)), mtimes(n, h)), plus(plus(y2, mtimes(n, h)), mtimes(n, w)), minus(minus(x1, mtimes(n, w)), mtimes(n, h)), plus(minus(y1, mtimes(n, h)), mtimes(n, w)));
    % 41 43
    % 42 43
end % function
