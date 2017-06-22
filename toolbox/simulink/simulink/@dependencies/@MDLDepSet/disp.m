function disp(obj)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    fprintf('MDLDepSet %dx%d\n', size(obj));
    for i=1.0:numel(obj)
        if obj(i).IsModel
            mdltype = 'model';
        else
            mdltype = 'library';
        end % if
        fprintf('    %s.mdl (%s)\n', obj(i).MDLName, mdltype);
        if isnumeric(obj(i).ReferencedModels)
            fprintf('        ReferencedModels: (not analyzed)\n');
        else
            fprintf('        ReferencedModels: %s\n', dependencies.csl(obj(i).ReferencedModels));
        end % if
        if isnumeric(obj(i).LinkedLibraries)
            fprintf('        LinkedLibraries: (not analyzed)\n');
        else
            fprintf('        LinkedLibraries: %s\n', dependencies.csl(obj(i).LinkedLibraries));
        end % if
        fprintf('        (%d FileState instances, %d FileReference instances, %d IncludePath instances)\n', numel(obj(i).AllFiles), numel(obj(i).AllReferences), numel(obj(i).AllIncludeDirs));
        % 28 29
        tb = obj(i).Toolboxes;
        if not(isa(tb, 'dependencies.ToolboxDetails'))
            tb = {};
        else
            tb = get(tb, 'Name');
        end % if
        fprintf('        Toolboxes: %s\n', dependencies.csl(tb));
    end % for
end % function
