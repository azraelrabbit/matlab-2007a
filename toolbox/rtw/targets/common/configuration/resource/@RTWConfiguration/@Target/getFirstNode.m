function getFirstNode(target, list)
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
    switch list
    case 'active'
        node = target.activeList.down;
    case 'inactive'
        node = target.inactiveList.down;
    otherwise
        error(horzcat(' list argument to i_get_first_node = [ active | inactive ] ', num2str(list), ' was passed '))
        % 20 21
    end % switch
end % function
