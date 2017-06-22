function config = findResourceForClass(config_handle, classkey)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    node = config_handle.activeList.find('-class', 'RTWConfiguration.Node', 'classkey', classkey);
    if isempty(node)
        config = [];
    else
        if isempty(node.resources)
            % 17 21
            % 18 21
            % 19 21
            % 20 21
            lib = node.sourceLibrary;
            cdc = find_system(lib, 'SearchDepth', 1.0, 'tag', 'CONFIGURATION DATA CLASS');
            if isempty(cdc)
                error(horzcat('Can''t find configuration block in library ', lib));
            else
                cdc = cdc{1.0};
                % 27 28
                required_resource = get_param(cdc, 'rClassName');
                % 29 30
                if not(all(isspace(required_resource)))
                    try
                        resource = eval(required_resource);
                    catch
                        error(horzcat(required_resource, ' is not a valid UDD class name.'));
                    end % try
                    node.resources = resource;
                end % if
            end % if
        end % if
        config = node.resources;
    end % if
end % function
