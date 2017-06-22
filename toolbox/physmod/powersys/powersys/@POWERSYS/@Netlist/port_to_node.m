function node = port_to_node(nl, port)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    port_idx = find(eq(nl.ports, port));
    if ne(length(port_idx), 1.0)
        % 10 11
        node = nl.reservednode;
        nl.reservednode = plus(nl.reservednode, 1.0);
    else
        % 14 15
        % 15 16
        node = find(nl.portToNode(:, port_idx));
        node = minus(node, 1.0);
    end % if
end % function
