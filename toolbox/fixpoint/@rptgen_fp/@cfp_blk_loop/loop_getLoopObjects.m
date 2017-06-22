function hList = loop_getLoopObjects(c)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    hList = getLoopBlocks(c, 'MaskType', '^Fixed-Point ');
end % function
