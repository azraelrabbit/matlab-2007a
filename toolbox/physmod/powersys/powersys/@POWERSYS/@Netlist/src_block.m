function block = src_block(nl, node)
    % 1 3
    % 2 3
    port = nl.src_port(node);
    block = get_param(port, 'Parent');
    block = nl.promote_block(block);
end % function
