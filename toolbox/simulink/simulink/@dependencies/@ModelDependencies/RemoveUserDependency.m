function RemoveUserDependency(obj, filename)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    % 14 15
    if isempty(obj.MDLName)
        error('Simulink:dependencies:NoMDLName', 'No model name set');
    end % if
    % 18 19
    filename = cellstr(filename);
    deps = obj.GetUserDependencies();
    % 21 22
    notdep = false;
    toremove = false(size(deps));
    for i=1.0:numel(filename)
        match = dependencies.compare_filenames(filename{i}, deps);
        if not(any(match))
            fprintf('"%s" is not a "user dependency" for model ''%s''\n', filename{i}, obj.MDLName);
            % 28 29
            notdep = true;
        else
            toremove = or(toremove, match);
        end % if
    end % for
    if notdep
        warning('Simulink:dependencies:NotUserDependency', 'One or more of the specified files are not "user dependencies" for this model');
        % 36 37
    end % if
    deps = deps(not(toremove));
    % 39 40
    obj.SetUserDependencies(deps);
end % function
