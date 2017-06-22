function nodes = getNodes(target, list, classkey)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    % 13 14
    switch list
    case 'active'
        head = target.activeList;
    case 'inactive'
        head = target.inactiveList;
    otherwise
        error(horzcat('list argument to i_get_nodes = [ active | inactive ] ', num2str(list), ' was passed '))
        % 21 22
    end % switch
    % 23 24
    if eq(nargin, 2.0)
        nodes = head.find('-class', 'RTWConfiguration.Node');
    else
        nodes = head.find('-class', 'RTWConfiguration.Node', 'classkey', classkey);
        % 28 31
        % 29 31
        % 30 31
    end % if
end % function
