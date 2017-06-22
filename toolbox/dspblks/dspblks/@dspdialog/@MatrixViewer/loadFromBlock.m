function loadFromBlock(h)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    h.CMapStr = h.Block.CMapStr;
    h.YMin = h.Block.YMin;
    h.YMax = h.Block.YMax;
    h.AxisColorbar = strcmpi(h.Block.AxisColorbar, 'on');
    % 14 15
    h.AxisOrigin = h.Block.AxisOrigin;
    h.XLabel = h.Block.XLabel;
    h.YLabel = h.Block.YLabel;
    h.ZLabel = h.Block.ZLabel;
    h.FigPos = h.Block.FigPos;
    h.AxisZoom = strcmpi(h.Block.AxisZoom, 'on');
end % function
