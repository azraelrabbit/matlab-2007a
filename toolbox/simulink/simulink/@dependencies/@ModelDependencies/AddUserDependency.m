function AddUserDependency(obj, filename)
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
    if isempty(obj.MDLName)
        error('Simulink:dependencies:NoMDLName', 'No model name set');
    end % if
    % 16 17
    filename = cellstr(filename);
    for i=1.0:numel(filename)
        if not(exist(filename{i}, 'file'))
            error('Simulink:dependencies:FileNotFound', 'File not found: %s', filename{i});
        end % if
    end % for
    % 23 24
    [deps, ignore_root, deplevel] = obj.GetUserDependencies();
    deps = vertcat(deps, filename(:));
    % 26 28
    % 27 28
    if ispc
        temp = lower(deps);
        [ignore, ind] = unique(temp);
        deps = deps(ind);
    else
        deps = unique(deps);
    end % if
    % 35 36
    obj.SetUserDependencies(deps, deplevel);
end % function
