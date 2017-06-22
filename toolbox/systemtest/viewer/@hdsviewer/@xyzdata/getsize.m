function [s, numSurfacesPerAxes] = getsize(h)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    s = size(h.zdata);
    rcArraySize = horzcat(length(h.RowData), length(h.ColumnData));
    numSurfacesPerAxes = mrdivide(prod(s(3.0:end)), prod(rcArraySize));
end % function
