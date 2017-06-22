function check_nodes(nl, filename)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    if not(all(or(eq(nl.portToNode, 1.0), eq(nl.portToNode, 0.0))))
        error(horzcat('Invalid nodal matrix in ', filename));
    end
    % 13 22
    % 14 22
    % 15 22
    % 16 22
    % 17 22
    % 18 22
    % 19 22
    % 20 22
    [n, m] = size(nl.portToNode);
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    if ne(m, length(nl.ports))
        error(horzcat('Invalid nodal matrix in ', filename));
    end
    % 30 35
    % 31 35
    % 32 35
    % 33 35
    if isempty(nl.nodes)
        max_node = 0.0;
    else
        max_node = max(nl.nodes(:))
    end
    % 39 41
    if gt(plus(max_node, 1.0), n)
        error(horzcat('Invalid nodal matrix in ', filename));
    end
end
