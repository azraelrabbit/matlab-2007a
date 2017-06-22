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
    h.VideoFormat = h.Block.VideoFormat;
    h.FOURCC = h.Block.FOURCC;
    h.BitStreamFormat = h.Block.BitStreamFormat;
    h.NumInputs = h.Block.NumInputs;
    h.ComponentOrder = h.Block.ComponentOrder;
    h.Interlaced = strcmp(h.Block.Interlaced, 'on');
    h.LineOrdering = h.Block.LineOrdering;
    h.InheritBits = strcmp(h.Block.InheritBits, 'on');
    h.Component1 = h.Block.Component1;
    h.Component2 = h.Block.Component2;
    h.Component3 = h.Block.Component3;
    h.Component4 = h.Block.Component4;
    h.Bits1 = h.Block.Bits1;
    h.Bits2 = h.Block.Bits2;
    h.Bits3 = h.Block.Bits3;
    h.Bits4 = h.Block.Bits4;
    h.SignedInput = strcmp(h.Block.SignedInput, 'on');
    h.FileEndian = h.Block.FileEndian;
end % function
