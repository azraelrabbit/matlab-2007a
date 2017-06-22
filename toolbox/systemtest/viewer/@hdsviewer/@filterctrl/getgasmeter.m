function [selectedgridpoints, totalgridpoints] = getgasmeter(this)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    selectedgridpoints = sum(this.filteredindex(:));
    gridSize = this.getGridSize;
    if not(isempty(gridSize))
        totalgridpoints = prod(gridSize);
    else
        totalgridpoints = 0.0;
    end % if
end % function
