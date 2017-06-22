function ns = block_nodes(nl, block)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    block = get_param(block, 'Handle');
    blk_idx = find(eq(nl.elements, block));
    nsx = nl.nodes(blk_idx, :);
    ns = nsx{1.0};
end % function
