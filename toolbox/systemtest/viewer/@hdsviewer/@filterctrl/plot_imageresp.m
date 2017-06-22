function y_data = plot_imageresp(this, y, varargin)
    % 1 19
    % 2 19
    % 3 19
    % 4 19
    % 5 19
    % 6 19
    % 7 19
    % 8 19
    % 9 19
    % 10 19
    % 11 19
    % 12 19
    % 13 19
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    frameID = [];
    if ge(nargin, 3.0)
        frameID = varargin{1.0};
    end
    GridLengths = this.getGridSize;
    NumberOfGrid = numel(GridLengths);
    % 24 27
    % 25 27
    checkDependentVar(this, y);
    % 27 30
    % 28 30
    cheese_index = this.getFilteredDomain;
    % 30 33
    % 31 33
    if eq(length(GridLengths), 1.0)
        mask = NaN(GridLengths, 1.0);
    else
        mask = NaN(GridLengths);
    end
    mask(this.filteredindex) = 1.0;
    % 38 41
    % 39 41
    data = this.DataSet.variable.(y{:});
    % 41 44
    % 42 44
    dataDim = ndims(data);
    for j=1.0:NumberOfGrid
        abs_index = repmat({':'}, horzcat(1.0, dataDim));
        grid_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
        if ~(all(cheese_index{j}))
            abs_index{j} = cheese_index{j};
            grid_index{j} = cheese_index{j};
            data = data(abs_index{:});
            mask = mask(grid_index{:});
        end
    end % for
    % 54 58
    % 55 58
    % 56 58
    datasize = size(data);
    % 58 61
    % 59 61
    if isnumeric(data)
        data = permute(data, horzcat(plus(NumberOfGrid, 1.0):dataDim, 1.0:NumberOfGrid));
        if gt(length(datasize), NumberOfGrid)
            data = reshape(data, horzcat(datasize(plus(NumberOfGrid, 1.0):end), prod(datasize(1.0:NumberOfGrid))));
            y_data = permute(data, horzcat(plus(minus(dataDim, NumberOfGrid), 1.0), 1.0:minus(dataDim, NumberOfGrid)));
        else
            y_data = data;
        end
    else
        y_data = ctranspose(data(:));
    end
    mask = mask(:);
    % 72 75
    % 73 75
    index = [];
    for i=1.0:length(mask)
        if isnan(mask(i))
            index = horzcat(index, i);
        end
    end % for
    % 80 82
    is = repmat({':'}, horzcat(1.0, minus(dataDim, NumberOfGrid)));
    % 82 86
    % 83 86
    % 84 86
    if iscell(y_data)
        y_data(isnan(mask(:))) = [];
        % 87 90
        % 88 90
        if isa(y_data{1.0}, 'uint8')
            y_data = this.utCell2Mat(y_data, uint8(0.0));
        else
            y_data = this.utCell2Mat(y_data);
        end
        % 94 96
        y_data = permute(y_data, horzcat(2.0:ndims(y_data), 1.0));
    else
        y_data(isnan(mask(:)), is{:}) = [];
    end
    % 99 104
    % 100 104
    % 101 104
    % 102 104
    if eq(ndims(y_data), 5.0)
        is = repmat({':'}, horzcat(1.0, minus(ndims(y_data), 1.0)));
        if ~(isempty(frameID))
            if ~(isempty(setdiff(frameID, 1.0:size(y_data, ndims(y_data)))))
                errordlg('One or more of the specified frames is out of range', 'Test Results Viewer', 'modal')
                % 108 110
                y_data = [];
                return
            end
            y_data(is{:}, setdiff(1.0:size(y_data, ndims(y_data)), frameID)) = [];
        end
    else
        if lt(ndims(y_data), 5.0)
            if ~(isempty(frameID)) && ~(isequal(frameID, 1.0))
                errordlg('Frame is out of range', 'Test Results Viewer', 'modal')
                y_data = [];
            end
        end
    end
end
