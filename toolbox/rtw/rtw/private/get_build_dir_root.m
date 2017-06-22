function y = get_build_dir_root(iModelHandle)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    y = '';
    try
        % 9 10
        if not(isempty(find_system('SearchDepth', 0.0, 'type', 'block_diagram', 'Name', iModelHandle))) || not(isempty(find_system('SearchDepth', 0.0, 'type', 'block_diagram', 'Handle', iModelHandle)))
            % 11 12
            y = get_param(iModelHandle, 'RTWBuildDirRoot');
        end % if
    catch
        y = '';
    end % try
    % 17 18
    if isempty(y)
        y = pwd;
    end % if
end % function
