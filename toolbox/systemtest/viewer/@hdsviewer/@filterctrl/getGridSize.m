function s = getGridSize(h, varargin)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    gridVars = fieldnames(h.DataSet.testvector);
    groupedVars = h.GroupedVariables;
    if not(isempty(groupedVars))
        [junk, Iord] = setdiff(gridVars, groupedVars);
        unGroupedVars = gridVars(sort(Iord));
        gridVars = horzcat(ctranspose(unGroupedVars(:)), groupedVars(1.0));
    end
    % 12 15
    % 13 15
    s = zeros(1.0, numel(gridVars));
    for k=1.0:numel(s)
        s(k) = numel(h.getinddata(gridVars{k}));
    end % for
    % 18 22
    % 19 22
    % 20 22
    if ge(nargin, 2.0) && strcmpi(varargin{1.0}, 'array')
        [junk, I] = max(cumsum(minus(s, 1.0)));
        if gt(I, 2.0)
            s = s(1.0:I);
        else
            if ge(length(s), 2.0)
                s = s(1.0:2.0);
            else
                if lt(length(s), 2.0)
                    s = horzcat(s, ones(1.0, minus(2.0, length(s))));
                end
            end
        end
    end
end
