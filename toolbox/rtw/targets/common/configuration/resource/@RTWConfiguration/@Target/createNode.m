function node = createNode(target, list, data, resources, sourceLibrary)
    % 1 18
    % 2 18
    % 3 18
    % 4 18
    % 5 18
    % 6 18
    % 7 18
    % 8 18
    % 9 18
    % 10 18
    % 11 18
    % 12 18
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    % 17 18
    node = RTWConfiguration.Node;
    % 19 30
    % 20 30
    % 21 30
    % 22 30
    % 23 30
    % 24 30
    % 25 30
    % 26 30
    % 27 30
    % 28 30
    % 29 30
    node.sourceLibrary = sourceLibrary;
    % 31 32
    switch list
    case 'active'
        target.connectNodeToActiveList(node);
    case 'inactive'
        target.connectNodeToInactiveList(node);
    otherwise
        error(horzcat('list argument to createNode = [ active | inactive ] ', num2str(list), ' was passed '))
        % 39 41
        % 40 41
    end % switch
    % 42 43
    node.data = data;
    node.resources = resources;
end % function
