function nl = joint_nodes(nl, MasterNode, NodeToKill)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    Noeuds = nl.nodes;
    for j=1.0:size(nl.nodes, 1.0)
        indicesfound = find(eq(Noeuds{j}, NodeToKill));
        if not(isempty(indicesfound))
            Noeuds{j}(indicesfound) = MasterNode;
        end % if
    end % for
    nl.nodes = Noeuds;
end % function
