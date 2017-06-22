function loadFromBlock(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h.filename = h.Block.filename;
    loopingOnInBlock = logical(strcmp(h.Block.loopOrNot, 'on'));
    h.loopOrNot = true;
    if loopingOnInBlock
        h.numLoops = h.Block.numLoops;
    else
        h.numLoops = '1';
    end % if
    h.dataType = h.Block.dataType;
    h.outputEOF = logical(strcmp(h.Block.outputEOF, 'on'));
end % function
