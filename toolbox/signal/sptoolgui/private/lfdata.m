function [xdata, ydata] = lfdata(pos, labelhandles, lfs)
    % 1 22
    % 2 22
    % 3 22
    % 4 22
    % 5 22
    % 6 22
    % 7 22
    % 8 22
    % 9 22
    % 10 22
    % 11 22
    % 12 22
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    % 21 22
    N = length(pos);
    xdata = cell(N, 1.0);
    ydata = cell(N, 1.0);
    % 25 26
    ex = get(labelhandles, 'extent');
    if eq(N, 1.0)
        ex = num2cell(ex, 2.0);
    end % if
    % 30 31
    for i=1.0:N
        xdata(i) = num2cell(horzcat(pos{i}(1.0), pos{i}(3.0), pos{i}(3.0), plus(plus(ex{i}(1.0), ex{i}(3.0)), lfs), NaN, minus(ex{i}(1.0), lfs), pos{i}(1.0), pos{i}(1.0)), 2.0);
        % 33 34
        ydata(i) = num2cell(horzcat(pos{i}(2.0), pos{i}(2.0), pos{i}(4.0), pos{i}(4.0), NaN, pos{i}(4.0), pos{i}(4.0), pos{i}(2.0)), 2.0);
        % 35 36
    end % for
end % function
