function addVars(obj, varnames)
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
    varnames = cellstr(varnames);
    m = dependencies.cellmember(obj.BaseRefs, varnames);
    if any(m)
        % 16 18
        % 17 18
        removednames = obj.BaseRefs(m);
        % 19 20
        obj.BaseRefs = obj.BaseRefs(not(m));
        obj.BaseRefTypes = obj.BaseRefTypes(not(m));
        obj.BaseRefLocs = obj.BaseRefLocs(not(m));
        % 23 24
        wasused = dependencies.cellmember(removednames, obj.UsedRefs);
        if any(wasused)
            c = removednames(wasused);
            for i=1.0:numel(c)
                % 28 30
                % 29 30
                warning('Simulink:dependencies:VariableNameFileName', 'A file named ''%s'' was already analyzed, but that name is also the name of a variable. This may cause dependencies to be identified wrongly', c{i});
                % 31 34
                % 32 34
                % 33 34
            end % for
        end % if
        % 36 37
        ispending = dependencies.cellmember(obj.PendingRefs, removednames);
        if any(ispending)
            % 39 40
            obj.PendingFiles = obj.PendingFiles(not(ispending));
            obj.PendingRefs = obj.PendingRefs(not(ispending));
        end % if
        % 43 44
        if not(isempty(obj.UnresolvedRefs))
            unresolvednames = get(obj.UnresolvedRefs, 'FileName');
            m = dependencies.cellmember(unresolvednames, removednames);
            if any(m)
                % 48 50
                % 49 50
                obj.UnresolvedRefs = obj.UnresolvedRefs(not(m));
            end % if
        end % if
    end % if
    % 54 55
    obj.BaseVars = unique(dependencies.cellcat(obj.BaseVars, varnames));
    % 56 57
    m = dependencies.cellmember(obj.ClassNames, varnames);
    if any(m)
        c = obj.ClassNames(m);
        for i=1.0:numel(c)
            warning('Simulink:dependencies:VariableNameClassName', 'Variable name ''%s'' is also the name of a class. This may cause dependencies to be identified wrongly', c{i});
            % 62 64
            % 63 64
        end % for
        % 65 66
        k = dependencies.cellmember(obj.ClassNames, obj.ScopedRefs);
        m = and(m, not(k));
        obj.ClassNames(m) = [];
    end % if
end % function
