function [str, sizes] = getsurfnumber(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    gridVars = fieldnames(this.DataSet.testvector);
    gridSize = this.getGridSize;
    len = numel(gridSize);
    groupedlen = minus(numel(gridVars), len);
    % 13 15
    % 14 15
    numrealgriddims = zeros(1.0, plus(len, groupedlen));
    for i=1.0:len
        for j=1.0:gridSize(i)
            index = repmat({':'}, horzcat(1.0, len));
            index{i} = j;
            data = this.filteredindex(index{:});
            if any(data(:))
                numrealgriddims(i) = plus(numrealgriddims(i), 1.0);
            end % if
        end % for
    end % for
    % 26 28
    % 27 28
    for i=plus(len, 1.0):plus(len, groupedlen)
        numrealgriddims(i) = numrealgriddims(len);
    end % for
    % 31 33
    % 32 33
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        noneselected = true;
    else
        noneselected = false;
    end % if
    % 38 40
    % 39 40
    overall = prod(numrealgriddims(1.0:len));
    % 41 43
    % 42 43
    k = 1.0;
    sizes = zeros(minus(mpower(len, 2.0), len), 1.0);
    str = {};
    % 46 48
    % 47 48
    for i=1.0:plus(len, groupedlen)
        for j=1.0:plus(len, groupedlen)
            if ne(i, j)
                if noneselected
                    sizes(k, 1.0) = 0.0;
                    str(k, :) = horzcat(gridVars(i), gridVars(j), {'0'});
                else
                    sizes(k, 1.0) = mrdivide(mrdivide(overall, numrealgriddims(i)), numrealgriddims(j));
                    str(k, :) = horzcat(gridVars(i), gridVars(j), cellhorzcat(num2str(sizes(k, 1.0))));
                end % if
                k = plus(k, 1.0);
            end % if
        end % for
    end % for
end % function
