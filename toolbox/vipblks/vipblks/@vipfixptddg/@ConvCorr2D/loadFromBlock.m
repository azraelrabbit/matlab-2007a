function loadFromBlock(h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    h.outSize = h.Block.outSize;
    h.normalize = strcmpi(h.Block.normalize, 'on');
    % 11 12
    h.FixptDialog.loadFromBlock;
end % function
