function nl = bind_nodes(nl, node1, node2)
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
    node1_i = plus(node1, 1.0);
    node2_i = plus(node2, 1.0);
    % 15 19
    % 16 19
    % 17 19
    % 18 19
    a = nl.portToNode;
    a(node1_i, :) = or(a(node1_i, :), a(node2_i, :));
    a(node2_i, :) = [];
    nl.portToNode = a;
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    % 27 28
    if not(isempty(nl.nodes))
        a = nl.nodes;
        a(find(eq(a, node2))) = node1;
        nl.nodes = a;
    end % if
    % 33 38
    % 34 38
    % 35 38
    % 36 38
    % 37 38
    nl.check_nodes(mfilename);
end % function
