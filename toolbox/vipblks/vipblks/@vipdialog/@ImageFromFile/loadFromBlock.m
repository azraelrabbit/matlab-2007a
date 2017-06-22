function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.FileName = h.Block.FileName;
    h.Ts = h.Block.Ts;
    h.OutPortLabels = h.Block.OutPortLabels;
    h.ImageDataType = h.Block.ImageDataType;
    h.Signed = strcmpi(h.Block.Signed, 'on');
    h.WordLength = h.Block.WordLength;
    h.sdImageDataType = h.Block.sdImageDataType;
    h.FractionLengthMode = h.Block.FractionLengthMode;
    h.FractionLength = h.Block.FractionLength;
    h.imagePorts = h.Block.imagePorts;
end % function
