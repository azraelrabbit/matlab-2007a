function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.inType = h.Block.inType;
    h.imagePorts = h.Block.imagePorts;
    h.mode = h.Block.mode;
    h.inVerticesSrc = h.Block.inVerticesSrc;
    h.outVerticesSrc = h.Block.outVerticesSrc;
    h.inVertices = h.Block.inVertices;
    h.outVertices = h.Block.outVertices;
    h.inRectFull = h.Block.inRectFull;
    h.rectSizeSrc = h.Block.rectSizeSrc;
    h.rectSize = h.Block.rectSize;
    h.inPtsInvalid = h.Block.inPtsInvalid;
    h.outSize = h.Block.outSize;
    h.outROI = h.Block.outROI;
    h.method = h.Block.method;
    h.factor = h.Block.factor;
    h.fillVal = h.Block.fillVal;
    h.interpolation = h.Block.interpolation;
    h.inVerticesValid = strcmpi(h.Block.inVerticesValid, 'on');
    h.outVerticesValid = strcmpi(h.Block.outVerticesValid, 'on');
    % 28 29
    h.FixptDialog.loadFromBlock;
end % function
