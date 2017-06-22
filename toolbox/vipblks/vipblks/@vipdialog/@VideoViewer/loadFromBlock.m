function loadFromBlock(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h.inputType = h.Block.inputType;
    h.imagePorts = h.Block.imagePorts;
    h.useColorMap = strcmpi(h.Block.useColorMap, 'on');
    h.colormapValue = h.Block.colormapValue;
    h.specRange = strcmpi(h.Block.specRange, 'on');
    h.minInputVal = h.Block.minInputVal;
    h.maxInputVal = h.Block.maxInputVal;
    h.FigPos = h.Block.FigPos;
    h.AxisZoom = strcmpi(h.Block.AxisZoom, 'on');
    h.trueSizedOnce = strcmpi(h.Block.trueSizedOnce, 'on');
end % function
