function bool = pinrect(pts, rect)
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
    [i, j] = find(isnan(pts));
    bool = or(or(or(lt(pts(:, 1.0), rect(1.0)), gt(pts(:, 1.0), rect(2.0))), lt(pts(:, 2.0), rect(3.0))), gt(pts(:, 2.0), rect(4.0)));
    % 14 15
    bool = not(bool);
    bool(i) = 0.0;
end % function
