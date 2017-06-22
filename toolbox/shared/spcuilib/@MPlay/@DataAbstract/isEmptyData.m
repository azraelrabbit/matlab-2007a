function y = isEmptyData(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    y = eq(h.frameCols, 0.0) || eq(h.frameRows, 0.0);
end
