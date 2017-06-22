function varNamesChanged = sethds(this, h)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    varNamesChanged = false;
    % 9 11
    indVars = fieldnames(h.testvector);
    depVars = fieldnames(h.variable);
    % 12 15
    % 13 15
    this.GroupedVariables = {};
    this.DerivedVarExpressions = [];
    % 16 19
    % 17 19
    gridFreedomDegrees = numel(indVars);
    if isfield(h, 'metadata') && isfield(h.metadata, 'groupedvectors') && ~(isempty(isfield(h.metadata, 'groupedvectors')))
        this.GroupedVariables = h.metadata.groupedvectors;
        gridFreedomDegrees = plus(minus(gridFreedomDegrees, numel(this.GroupedVariables)), 1.0);
    end
    % 23 26
    % 24 26
    varNamesChanged = false;
    for keyword={'time','testruns','metadata','data','testrun'}
        % 27 29
        ind = find(strcmpi(indVars, keyword{1.0}));
        for k=1.0:length(ind)
            newName = sprintf('st_%s', indVars{ind(k)});
            j = 1.0;
            allVars = vertcat(indVars(:), depVars(:));
            while any(strcmpi(newName, allVars))
                newName = sprintf('st_%s%d', indVars{ind(k)}, j);
                j = plus(j, 1.0);
            end % while
            data = h.testvector.(indVars{ind(k)});
            h.testvector = rmfield(h.testvector, indVars{ind(k)});
            h.testvector.(newName) = data;
            indVars{ind(k)} = newName;
            varNamesChanged = true;
            % 42 45
            % 43 45
            ind_grouped = find(strcmp(this.GroupedVariables, indVars{ind(k)}));
            if ~(isempty(ind_grouped))
                this.GroupedVariables{ind_grouped(1.0)} = newName;
            end
        end % for
        % 49 51
        ind = find(strcmpi(depVars, keyword{1.0}));
        for k=1.0:length(ind)
            newName = sprintf('st_%s', depVars{ind(k)});
            j = 1.0;
            allVars = vertcat(indVars(:), depVars(:));
            while any(strcmpi(newName, allVars))
                newName = sprintf('st_%s%d', depVars{ind(k)}, j);
                j = plus(j, 1.0);
            end % while
            data = h.variable.(depVars{ind(k)});
            h.variable = rmfield(h.variable, depVars{ind(k)});
            h.variable.(newName) = data;
            depVars{ind(k)} = newName;
            varNamesChanged = true;
        end % for
    end % for
    % 66 71
    % 67 71
    % 68 71
    % 69 71
    if gridFreedomDegrees
        testvec = h.testvector.(indVars{1.0});
        % 72 79
        % 73 79
        % 74 79
        % 75 79
        % 76 79
        % 77 79
        if isvector(testvec)
            % 79 81
            if gt(length(testvec), 1.0)
                for k=1.0:length(depVars)
                    depvar = h.variable.(depVars{k});
                    s = size(depvar);
                    % 84 86
                    while eq(s(1.0), 1.0) && ge(length(s), 2.0)
                        s = s(2.0:end);
                    end % while
                    % 88 90
                    if isscalar(s)
                        s = horzcat(s, 1.0);
                    end
                    h.variable.(depVars{k}) = reshape(depvar, s);
                end % for
            else
                % 95 97
                for k=1.0:length(depVars)
                    depvar = h.variable.(depVars{k});
                    s = size(depvar);
                    % 99 101
                    if isequal(s(1.0:2.0), [1.0 1.0])
                        h.variable.(depVars{k}) = shiftdim(h.variable.(depVars{k}), 1.0);
                    end
                end % for
            end
        end
    end
    % 107 109
    this.dataset = h;
end
