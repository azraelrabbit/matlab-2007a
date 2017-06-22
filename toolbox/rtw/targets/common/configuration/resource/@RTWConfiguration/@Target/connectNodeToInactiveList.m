function connectNodeToInactiveList(target, node)
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
    if not(isempty(node.up))
        disconnect(node)
    end % if
    target.inactiveList.connect(node, 'down');
    if not(isempty(node.data))
        node.data.inactivate(node, target)
    end % if
end % function
