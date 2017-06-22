function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.nghbood = h.Block.nghbood;
    h.outSize = h.Block.outSize;
    h.padType = h.Block.padType;
    h.padSrc = h.Block.padSrc;
    h.padVal = h.Block.padVal;
    h.FixptDialog.loadFromBlock;
end % function
