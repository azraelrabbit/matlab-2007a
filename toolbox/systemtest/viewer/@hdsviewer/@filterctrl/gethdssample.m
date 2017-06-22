function samp = gethdssample(h, ind)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    GridSize = h.getGridSize;
    ndim = numel(GridSize);
    if isscalar(GridSize)
        GridSize = horzcat(GridSize, 1.0);
        gridind = localind2sub(GridSize, ind);
        gridind = gridind(1.0);
    else
        gridind = localind2sub(GridSize, ind);
    end
    % 15 18
    % 16 18
    vars = fieldnames(h.DataSet.variable);
    samp = struct;
    for k=1.0:length(vars)
        thisvar = h.DataSet.variable.(vars{k});
        if isempty(thisvar)
            samp.(vars{k}) = [];
        else
            s = size(thisvar);
            s = s(plus(ndim, 1.0):end);
            if isempty(s)
                s = [1.0 1.0];
            else
                if eq(length(s), 1.0)
                    s = horzcat(s, 1.0);
                end
            end
            if iscell(thisvar) && isequal(size(thisvar), GridSize)
                samp.(vars{k}) = cell2mat(thisvar(gridind{:}, :));
            else
                samp.(vars{k}) = reshape(thisvar(gridind{:}, :), s);
            end
        end
    end % for
    invars = fieldnames(h.DataSet.testvector);
    for k=1.0:length(invars)
        % 42 45
        % 43 45
        if any(strcmpi(invars{k}, h.GroupedVariables))
            griddim = gridind{end};
        else
            griddim = gridind{k};
        end
        rawvar = h.getinddata(invars{k});
        % 50 54
        % 51 54
        % 52 54
        if iscell(h.getinddata(invars{k})) && all(cellfun('isclass', h.DataSet.testvector.(invars{k}), 'double'))
            % 54 56
            samp.(invars{k}) = rawvar{griddim};
        else
            % 57 59
            if iscell(h.DataSet.testvector.(invars{k})) && all(cellfun('isclass', h.DataSet.testvector.(invars{k}), 'char'))
                % 59 61
                samp.(invars{k}) = rawvar{griddim};
            else
                samp.(invars{k}) = rawvar(griddim);
            end
        end
    end % for
end
function ind = localind2sub(siz, ndx)
    % 68 71
    % 69 71
    siz = double(siz);
    n = length(siz);
    ind = cell(n, 1.0);
    k = horzcat(1.0, cumprod(siz(1.0:minus(end, 1.0))));
    ndx = minus(ndx, 1.0);
    for i=n:-1.0:1.0
        v = plus(floor(mrdivide(ndx, k(i))), 1.0);
        ind{i} = v;
        ndx = rem(ndx, k(i));
    end % for
end
