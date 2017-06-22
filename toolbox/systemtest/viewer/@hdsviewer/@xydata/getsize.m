function [s, numLinesPerAxes] = getsize(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    s = size(h.ydata);
    rcArraySize = horzcat(length(h.RowData), length(h.ColumnData));
    numLinesPerAxes = mrdivide(prod(s(2.0:end)), prod(rcArraySize));
end % function
