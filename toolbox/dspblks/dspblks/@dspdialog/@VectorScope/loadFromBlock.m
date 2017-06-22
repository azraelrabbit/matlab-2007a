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
    h.Domain = h.Block.Domain;
    h.HorizSpan = h.Block.HorizSpan;
    % 12 14
    % 13 14
    h.AxisGrid = strcmpi(h.Block.AxisGrid, 'on');
    h.Memory = strcmpi(h.Block.Memory, 'on');
    h.FrameNumber = strcmpi(h.Block.FrameNumber, 'on');
    h.AxisLegend = strcmpi(h.Block.AxisLegend, 'on');
    h.AxisZoom = strcmpi(h.Block.AxisZoom, 'on');
    h.OpenScopeAtSimStart = strcmpi(h.Block.OpenScopeAtSimStart, 'on');
    h.OpenScopeImmediately = 0.0;
    h.FigPos = h.Block.FigPos;
    % 22 24
    % 23 24
    h.XUnits = h.Block.XUnits;
    h.XRange = h.Block.XRange;
    if isfield(get_param(h, 'ObjectParameters'), 'XLimit')
        h.XLimit = h.Block.XLimit;
        h.XMin = h.Block.XMin;
        h.XMax = h.Block.XMax;
    end % if
    h.XStart = h.Block.XStart;
    h.InheritXIncr = strcmpi(h.Block.InheritXIncr, 'on');
    h.XIncr = h.Block.XIncr;
    h.XLabel = h.Block.XLabel;
    h.YUnits = h.Block.YUnits;
    h.YMin = h.Block.YMin;
    h.YMax = h.Block.YMax;
    h.YLabel = h.Block.YLabel;
    % 39 41
    % 40 41
    h.LineDisables = h.Block.LineDisables;
    h.LineStyles = h.Block.LineStyles;
    h.LineMarkers = h.Block.LineMarkers;
    h.LineColors = h.Block.LineColors;
end % function
