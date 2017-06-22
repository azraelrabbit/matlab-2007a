function config = findConfigForClass(config_handle, classkey)
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
    node = config_handle.activeList.find('-class', 'RTWConfiguration.Node', 'classkey', classkey);
    if isempty(node)
        % 15 18
        % 16 18
        % 17 18
        config_handle.processModel;
        % 19 20
        node = config_handle.activeList.find('-class', 'RTWConfiguration.Node', 'classkey', classkey);
        if isempty(node)
            % 22 23
            error(horzcat('Can''t find node of class ', classkey));
        end % if
    end % if
    % 26 27
    if isempty(node)
        config = [];
    else
        config = node.data;
    end % if
end % function
