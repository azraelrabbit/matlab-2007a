function port = src_port(nl, node, idx)
    % 1 3
    % 2 3
    node_i = plus(node, 1.0);
    k = find(nl.portToNode(node_i, :));
    port = nl.ports(k(idx));
end % function
