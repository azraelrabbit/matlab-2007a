function [str, sizes] = gettsnumber(this)
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
    numrealgriddims = zeros(1.0, len);
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
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        noneselected = true;
    else
        noneselected = false;
    end % if
    % 33 35
    % 34 35
    overall = prod(numrealgriddims);
    % 36 38
    % 37 38
    sizes = zeros(len, 1.0);
    str = cell(len, 2.0);
    for i=1.0:plus(len, groupedlen)
        if noneselected
            sizes(i, 1.0) = 0.0;
            str(i, :) = {'Time','0'};
        else
            sizes(i, 1.0) = overall;
            str(i, :) = horzcat({'Time'}, cellhorzcat(num2str(overall)));
        end % if
    end % for
end % function
