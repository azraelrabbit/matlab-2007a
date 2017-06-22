function deleteBlocks(blocksToDelete)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    for i=1.0:length(blocksToDelete)
        delete_block(blocksToDelete(i));
    end % for
end % function
