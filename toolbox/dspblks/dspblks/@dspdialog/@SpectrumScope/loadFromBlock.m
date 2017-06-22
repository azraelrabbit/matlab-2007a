function loadFromBlock(h)
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
    h.UseBuffer = strcmpi(h.Block.UseBuffer, 'on');
    h.BufferSize = h.Block.BufferSize;
    h.Overlap = h.Block.Overlap;
    h.inpFftLenInherit = strcmpi(h.Block.inpFftLenInherit, 'on');
    h.FFTlength = h.Block.FFTlength;
    h.numAvg = h.Block.numAvg;
    h.wintypeSpecScope = h.Block.wintypeSpecScope;
    h.RsSpecScope = h.Block.RsSpecScope;
    h.betaSpecScope = h.Block.betaSpecScope;
    h.winsampSpecScope = h.Block.winsampSpecScope;
    % 22 24
    % 23 24
    h.AxisGrid = strcmpi(h.Block.AxisGrid, 'on');
    h.Memory = strcmpi(h.Block.Memory, 'on');
    h.FrameNumber = strcmpi(h.Block.FrameNumber, 'on');
    h.AxisLegend = strcmpi(h.Block.AxisLegend, 'on');
    h.AxisZoom = strcmpi(h.Block.AxisZoom, 'on');
    h.OpenScopeAtSimStart = strcmpi(h.Block.OpenScopeAtSimStart, 'on');
    h.OpenScopeImmediately = 0.0;
    h.FigPos = h.Block.FigPos;
    % 32 34
    % 33 34
    h.XUnits = h.Block.XUnits;
    h.XRange = h.Block.XRange;
    if isfield(get_param(h, 'ObjectParameters'), 'XLimit')
        h.XLimit = h.Block.XLimit;
        h.XMin = h.Block.XMin;
        h.XMax = h.Block.XMax;
    end % if
    h.InheritXIncr = strcmpi(h.Block.InheritXIncr, 'on');
    h.XIncr = h.Block.XIncr;
    % 43 44
    h.YUnits = h.Block.YUnits;
    h.YMin = h.Block.YMin;
    h.YMax = h.Block.YMax;
    h.YLabel = h.Block.YLabel;
    % 48 50
    % 49 50
    h.LineDisables = h.Block.LineDisables;
    h.LineStyles = h.Block.LineStyles;
    h.LineMarkers = h.Block.LineMarkers;
    h.LineColors = h.Block.LineColors;
end % function
