function [str, sizes] = getimagenumber(this)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    gridSize = this.getGridSize;
    len = numel(gridSize);
    % 11 13
    % 12 13
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
    % 24 26
    % 25 26
    if gt(sum(eq(numrealgriddims, 0.0)), 0.0)
        sizes = 0.0;
        str = {'0'};
    else
        sizes = prod(numrealgriddims);
        str = cellhorzcat(num2str(prod(numrealgriddims)));
    end % if
end % function
