function [str, sizes] = getscatternumber(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    gridVars = fieldnames(this.DataSet.testvector);
    depVars = fieldnames(this.DataSet.variable);
    groupVars = this.GroupedVariables;
    if not(isempty(groupVars))
        len = plus(minus(numel(gridVars), numel(groupVars)), 1.0);
        groupedlen = minus(numel(groupVars), 1.0);
    else
        len = numel(gridVars);
        groupedlen = 0.0;
    end % if
    gridSize = this.getGridSize;
    numrealgriddims = zeros(1.0, len);
    filterindex = this.filteredindex;
    deplen = numel(depVars);
    % 24 26
    % 25 26
    for i=1.0:len
        for j=1.0:gridSize(i)
            index = repmat({':'}, horzcat(1.0, len));
            index{i} = j;
            data = filterindex(index{:});
            if any(data(:))
                numrealgriddims(i) = plus(numrealgriddims(i), 1.0);
            end % if
        end % for
    end % for
    % 36 38
    % 37 38
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        noneselected = true;
    else
        noneselected = false;
    end % if
    % 43 45
    % 44 45
    overall = prod(numrealgriddims);
    % 46 48
    % 47 48
    sizes = zeros(len, 1.0);
    str = cell(len, 2.0);
    if not(noneselected)
        for i=1.0:len
            sizes(i) = overall;
            str(i, :) = horzcat(gridVars(i), cellhorzcat(num2str(sizes(i))));
        end % for
        for i=plus(len, 1.0):plus(len, groupedlen)
            sizes(i) = overall;
            str(i, :) = horzcat(gridVars(i), cellhorzcat(num2str(sizes(len))));
        end % for
        for i=plus(plus(len, 1.0), groupedlen):plus(plus(len, deplen), groupedlen)
            sizes(i) = overall;
            str(i, :) = horzcat(depVars(minus(minus(i, len), groupedlen)), cellhorzcat(num2str(sizes(i))));
        end % for
    else
        for i=1.0:numel(gridVars)
            str(i, :) = horzcat(gridVars(i), {'0'});
        end % for
        for i=plus(numel(gridVars), 1.0):plus(numel(gridVars), numel(depVars))
            str(i, :) = horzcat(depVars(minus(i, numel(gridVars))), {'0'});
        end % for
    end % if
end % function
