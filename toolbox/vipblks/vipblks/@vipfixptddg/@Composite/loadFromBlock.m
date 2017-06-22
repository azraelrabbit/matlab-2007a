function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.operation = h.Block.operation;
    h.bFacSrc = h.Block.bFacSrc;
    h.mFacSrc = h.Block.mFacSrc;
    h.bFactor = h.Block.bFactor;
    h.mFactor = h.Block.mFactor;
    h.source = h.Block.source;
    h.coordinates = h.Block.coordinates;
    % 16 17
    h.FixptDialog.loadFromBlock;
    % 18 20
    % 19 20
    h.FracLengthCache = h.Block.firstCoeffFracLength;
end % function
