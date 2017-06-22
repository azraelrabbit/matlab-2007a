function samp = getinstance(h)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    GridSize = h.getGridSize;
    ndim = length(GridSize);
    scalarGrid = false;
    if isscalar(GridSize)
        GridSize = horzcat(GridSize, 1.0);
        scalarGrid = true;
    end
    % 14 17
    % 15 17
    vars = fieldnames(h.DataSet.variable);
    samp = struct;
    for k=1.0:length(vars)
        thisvar = h.DataSet.variable.(vars{k});
        [varClass, I] = h.getVarClass(vars{k});
        if ~(isempty(varClass))
            gridind = localGetInd(GridSize, find(I, 1.0));
            if scalarGrid
                gridind = gridind(1.0);
            end
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
                if iscell(thisvar) && isequal(size(thisvar), h.getGridSize('array'))
                    samp.(vars{k}) = thisvar{gridind{:}};
                else
                    samp.(vars{k}) = reshape(thisvar(gridind{:}, :), s);
                end
            end
        else
            samp.(vars{k}) = [];
        end
    end % for
    invars = fieldnames(h.DataSet.testvector);
    for k=1.0:length(invars)
        rawvar = h.getinddata(invars{k});
        % 51 55
        % 52 55
        % 53 55
        if iscell(h.getinddata(invars{k})) && all(cellfun('isclass', h.DataSet.testvector.(invars{k}), 'double'))
            % 55 57
            samp.(invars{k}) = rawvar{1.0};
        else
            % 58 60
            if iscell(h.DataSet.testvector.(invars{k})) && all(cellfun('isclass', h.DataSet.testvector.(invars{k}), 'char'))
                % 60 62
                samp.(invars{k}) = rawvar{1.0};
            else
                samp.(invars{k}) = rawvar(1.0);
            end
        end
    end % for
end
function gridind = localGetInd(GridSize, ind)
    % 69 71
    if isscalar(GridSize)
        GridSize = horzcat(GridSize, 1.0);
        gridind = localind2sub(GridSize, ind);
        gridind = gridind(1.0);
    else
        gridind = localind2sub(GridSize, ind);
    end
end
function ind = localind2sub(siz, ndx)
    % 79 84
    % 80 84
    % 81 84
    % 82 84
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
