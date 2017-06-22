function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.separable = strcmpi(h.Block.separable, 'on');
    h.filtSrc = h.Block.filtSrc;
    h.filterMtrx = h.Block.filterMtrx;
    h.verticalFilter = h.Block.verticalFilter;
    h.horizontalFilter = h.Block.horizontalFilter;
    h.outSize = h.Block.outSize;
    h.padType = h.Block.padType;
    h.padSrc = h.Block.padSrc;
    h.padVal = h.Block.padVal;
    h.method = h.Block.method;
    % 19 20
    h.FixptDialog.loadFromBlock;
end % function
