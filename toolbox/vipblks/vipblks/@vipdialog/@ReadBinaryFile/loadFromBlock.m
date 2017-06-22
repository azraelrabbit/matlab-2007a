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
    h.loopOrNot = strcmp(h.Block.loopOrNot, 'on');
    if h.loopOrNot
        h.numLoops = h.Block.numLoops;
    else
        h.LoopOrNot = true;
        h.numLoops = '1';
    end % if
    h.VideoFormat = h.Block.VideoFormat;
    h.FOURCC = h.Block.FOURCC;
    h.BitStreamFormat = h.Block.BitStreamFormat;
    h.NumOutputs = h.Block.NumOutputs;
    h.ComponentOrder = h.Block.ComponentOrder;
    h.Interlaced = strcmp(h.Block.Interlaced, 'on');
    h.LineOrdering = h.Block.LineOrdering;
    h.Component1 = h.Block.Component1;
    h.Component2 = h.Block.Component2;
    h.Component3 = h.Block.Component3;
    h.Component4 = h.Block.Component4;
    h.Bits1 = h.Block.Bits1;
    h.Bits2 = h.Block.Bits2;
    h.Bits3 = h.Block.Bits3;
    h.Bits4 = h.Block.Bits4;
    h.Rows1 = h.Block.Rows1;
    h.Rows2 = h.Block.Rows2;
    h.Rows3 = h.Block.Rows3;
    h.Rows4 = h.Block.Rows4;
    h.Cols1 = h.Block.Cols1;
    h.Cols2 = h.Block.Cols2;
    h.Cols3 = h.Block.Cols3;
    h.Cols4 = h.Block.Cols4;
    h.YRows = h.Block.YRows;
    h.YCols = h.Block.YCols;
    h.Ts = h.Block.Ts;
    h.SignedOutput = strcmp(h.Block.SignedOutput, 'on');
    h.FileEndian = h.Block.FileEndian;
    h.OutputEOF = strcmp(h.Block.OutputEOF, 'on');
end % function
