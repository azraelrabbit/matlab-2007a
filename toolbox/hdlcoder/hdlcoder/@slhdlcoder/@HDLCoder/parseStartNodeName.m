function systemName = parseStartNodeName(this, inputSystem)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    inputModel = strtok(inputSystem, '/');
    openSystems = find_system('flat');
    % 9 10
    if any(strcmp(openSystems, inputModel))
        systemName = inputSystem;
    else
        if isempty(bdroot)
            error(hdlcodererrormsgid('noopenmodels'), 'There are no models open; could not find subsystem ''%s''', inputSystem);
            % 15 16
        end % if
        % 17 18
        systemName = horzcat(bdroot, '/', inputSystem);
        % 19 20
        if isempty(find_system(bdroot, 'name', inputSystem))
            error(hdlcodererrormsgid('systemnotfound'), 'Could not find subsystem ''%s'' in the model ''%s''', inputSystem, bdroot);
            % 22 23
        end % if
        % 24 25
    end % if
end % function
