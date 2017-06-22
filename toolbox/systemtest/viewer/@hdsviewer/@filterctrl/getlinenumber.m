function [str, sizes] = getlinenumber(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    depvarnames = fieldnames(this.DataSet.variable);
    indvarnames = fieldnames(this.DataSet.testvector);
    gridSize = this.getGridSize;
    len = numel(gridSize);
    totallen = plus(numel(depvarnames), len);
    groupedlen = minus(numel(indvarnames), len);
    numrealgriddims = zeros(1.0, plus(len, groupedlen));
    filterindex = this.filteredindex;
    % 18 20
    % 19 20
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
    % 30 32
    % 31 32
    for i=plus(len, 1.0):plus(len, groupedlen)
        numrealgriddims(i) = numrealgriddims(len);
    end % for
    % 35 37
    % 36 37
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        noneselected = true;
    else
        noneselected = false;
    end % if
    % 42 44
    % 43 44
    overall = prod(numrealgriddims(1.0:len));
    % 45 47
    % 46 47
    sizes = zeros(plus(len, groupedlen), 1.0);
    str = cell(plus(len, groupedlen), 2.0);
    if not(noneselected)
        for i=1.0:plus(len, groupedlen)
            sizes(i) = mrdivide(overall, numrealgriddims(i));
            str(i, :) = horzcat(indvarnames(i), cellhorzcat(num2str(sizes(i))));
        end % for
    else
        for i=1.0:plus(len, groupedlen)
            str(i, :) = horzcat(indvarnames(i), {'0'});
        end % for
    end % if
    % 59 61
    % 60 61
    for k=plus(plus(len, 1.0), groupedlen):plus(totallen, groupedlen)
        str(k, :) = horzcat(depvarnames(minus(minus(k, len), groupedlen)), cellhorzcat(num2str(prod(gridSize))));
    end % for
    % 64 66
    % 65 66
    str(plus(end, 1.0), :) = horzcat('*Auto*', cellhorzcat(num2str(sum(filterindex(:)))));
end % function
