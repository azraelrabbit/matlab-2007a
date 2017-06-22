function visibleBlock = drive_getvisibleblock(blockHandle)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    thisHandle = get_param(blockHandle, 'Handle');
    [blocks, parents] = drive_generatehierarchy(blockHandle);
    visibleBlockIndex = find(eq(blocks, thisHandle));
    % 16 18
    % 17 18
        while ne(parents(visibleBlockIndex), 0.0)
        visibleBlockIndex = parents(visibleBlockIndex);
    end % while
    % 21 22
    visibleBlock = getfullname(blocks(visibleBlockIndex));
end % function
