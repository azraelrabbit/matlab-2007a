function [x_data, y_data, y_index, iteration, row_label, col_label] = utXNonGridYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    GridLengths = this.getGridSize;
    NumberOfGrid = numel(GridLengths);
    % 17 20
    % 18 20
    checkDependentVar(this, x);
    checkDependentVar(this, y);
    % 21 25
    % 22 25
    % 23 25
    if ~(iscell(this.DataSet.variable.(x{:})))
        % 25 27
        x_samplesize = size(this.DataSet.variable.(x{:}));
        % 27 29
        x_samplesize(1.0:NumberOfGrid) = [];
        if eq(length(x_samplesize), 1.0)
            x_samplesize = horzcat(x_samplesize, 1.0);
        else
            if isempty(x_samplesize)
                x_samplesize = [1.0 1.0];
            end
        end
    else
        x_samplesize = size(this.DataSet.variable.(x{:}){1.0});
    end
    % 39 41
    if ~(iscell(this.DataSet.variable.(y{1.0})))
        % 41 43
        y_samplesize = cellhorzcat(size(this.DataSet.variable.(y{1.0})));
        % 43 45
        y_samplesize{1.0}(1.0:NumberOfGrid) = [];
        % 45 47
        if eq(length(y_samplesize{1.0}), 1.0)
            y_samplesize{1.0} = horzcat(y_samplesize{1.0}, 1.0);
        else
            if isempty(y_samplesize{1.0})
                y_samplesize{1.0} = [1.0 1.0];
            end
        end
    else
        y_samplesize = cellhorzcat(size(this.DataSet.variable.(y{1.0}){1.0}));
    end
    % 56 58
    if ~(isequal(x_samplesize, y_samplesize{1.0}))
        error('filterctrl:utXNonGridYNonGrid:sizemis', 'X_Data must have the same size of Y_Data');
        % 59 61
    end
    % 61 70
    % 62 70
    % 63 70
    % 64 70
    % 65 70
    % 66 70
    % 67 70
    % 68 70
    untouched_gridindex = 1.0:NumberOfGrid;
    first_size = prod(x_samplesize);
    if eq(first_size(1.0), 1.0)
        untouched_nongridindex = 1.0:NumberOfGrid;
    else
        untouched_nongridindex = 1.0:plus(NumberOfGrid, 1.0);
    end
    % 76 80
    % 77 80
    % 78 80
    [untouched_gridindex, untouched_nongridindex_cell, junk1, junk2, row_index, col_index, marker_index, color_index] = utGetDiffVarIndex(this, 'Both', untouched_gridindex, cellhorzcat(untouched_nongridindex), 1.0, [], [], rowvar, colvar, markervar, colorvar);
    % 80 83
    % 81 83
    untouched_gridindex = untouched_gridindex(ne(untouched_gridindex, 0.0));
    tmp = untouched_nongridindex_cell{:};
    untouched_nongridindex = tmp(ne(tmp, 0.0));
    if gt(size(untouched_nongridindex, 1.0), 1.0)
        untouched_nongridindex = ctranspose(untouched_nongridindex);
    end
    % 88 91
    % 89 91
    if ~(isempty(row_index))
        row_data = this.getinddata(rowvar{:});
    end
    % 93 95
    if ~(isempty(col_index))
        col_data = this.getinddata(colvar{:});
    end
    % 97 100
    % 98 100
    cheese_index = this.getFilteredDomain;
    % 100 104
    % 101 104
    % 102 104
    absoluteindex = this.absoluteindex;
    % 104 107
    % 105 107
    for j=1.0:NumberOfGrid
        % 107 109
        grid_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
        % 109 111
        if ~(all(cheese_index{j}))
            grid_index{j} = cheese_index{j};
            absoluteindex = absoluteindex(grid_index{:});
        end
        % 114 116
        if ~(isempty(row_index)) && eq(j, row_index)
            row_data = row_data(cheese_index{j});
        end
        % 118 120
        if ~(isempty(col_index)) && eq(j, col_index)
            col_data = col_data(cheese_index{j});
        end
    end % for
    % 123 126
    % 124 126
    x_data = local_getData(this, x{:}, NumberOfGrid, GridLengths, cheese_index, untouched_gridindex, untouched_nongridindex, row_index, col_index, marker_index, color_index);
    % 126 128
    y_data = cellhorzcat(local_getData(this, y{1.0}, NumberOfGrid, GridLengths, cheese_index, untouched_gridindex, untouched_nongridindex, row_index, col_index, marker_index, color_index));
    % 128 134
    % 129 134
    % 130 134
    % 131 134
    % 132 134
    numDistinguishVar = minus(NumberOfGrid, length(untouched_gridindex));
    if gt(numDistinguishVar, 0.0)
        if gt(NumberOfGrid, 1.0)
            basic_iteration = permute(absoluteindex, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex));
        else
            basic_iteration = absoluteindex(:);
        end
        ind = repmat({':'}, horzcat(numDistinguishVar, 1.0));
        basic_iteration = permute(basic_iteration(ind{:}, :), horzcat(plus(numDistinguishVar, 1.0), 1.0:numDistinguishVar));
    else
        basic_iteration = absoluteindex(:);
    end
    % 145 149
    % 146 149
    % 147 149
    s = numel(y_data{1.0});
    if lt(numel(basic_iteration), s)
        basic_iteration = repmat(basic_iteration, horzcat(mrdivide(s, numel(basic_iteration)), 1.0));
    end
    iteration = cellhorzcat(basic_iteration);
    % 153 159
    % 154 159
    % 155 159
    % 156 159
    % 157 159
    y_index = local_yindex(row_index, col_index, marker_index, color_index);
    % 159 162
    % 160 162
    if isempty(row_index)
        row_label = {''};
    else
        row_label = local_label(row_data);
    end
    % 166 168
    if isempty(col_index)
        col_label = {''};
    else
        col_label = local_label(col_data);
    end
end
function y_index = local_yindex(row_index, col_index, marker_index, color_index)
    % 174 179
    % 175 179
    % 176 179
    % 177 179
    y_index = {[1.0]};
    k = 2.0;
    if isempty(row_index)
        y_index = horzcat(y_index, {[]});
    else
        y_index = horzcat(y_index, cellhorzcat(k));
        k = plus(k, 1.0);
    end
    if isempty(col_index)
        y_index = horzcat(y_index, {[]});
    else
        y_index = horzcat(y_index, cellhorzcat(k));
        k = plus(k, 1.0);
    end
    if isempty(marker_index)
        y_index = horzcat(y_index, {[]});
    else
        y_index = horzcat(y_index, cellhorzcat(k));
        k = plus(k, 1.0);
    end
    if isempty(color_index)
        y_index = horzcat(y_index, {[]});
    else
        y_index = horzcat(y_index, cellhorzcat(k));
    end
end
function label = local_label(data)
    % 205 208
    % 206 208
    label = cell(length(data), 1.0);
    if iscell(data)
        if all(cellfun('isreal', data))
            for i=1.0:length(data)
                label(i) = cellhorzcat(num2str(data{i}));
            end % for
        else
            if all(cellfun('islogical', data))
                for i=1.0:length(data)
                    if data{i}
                        label(i) = {'true'};
                    else
                        label(i) = {'false'};
                    end
                end % for
            else
                if all(cellfun('isclass', data, 'char'))
                    label = data;
                end
            end
        end
    else
        if isnumeric(data)
            for i=1.0:length(data)
                label(i) = cellhorzcat(num2str(data(i)));
            end % for
        else
            if islogical(data)
                for i=1.0:length(data)
                    if data(i)
                        label(i) = {'true'};
                    else
                        label(i) = {'false'};
                    end
                end % for
            end
        end
    end
end
function data = local_getData(this, var, NumberOfGrid, GridLengths, cheese_index, untouched_gridindex, untouched_nongridindex, row_index, col_index, marker_index, color_index)
    % 247 249
    if eq(length(GridLengths), 1.0)
        mask = NaN(GridLengths, 1.0);
    else
        mask = NaN(GridLengths);
    end
    mask(this.filteredindex) = 1.0;
    % 254 257
    % 255 257
    data = this.DataSet.variable.(var);
    if iscell(data)
        data = utCell2Mat(this, data);
    end
    nongrid_size = mrdivide(numel(data), prod(GridLengths));
    % 261 266
    % 262 266
    % 263 266
    % 264 266
    data = reshape(data, horzcat(GridLengths, prod(nongrid_size)));
    % 266 272
    % 267 272
    % 268 272
    % 269 272
    % 270 272
    if ~(isnumeric(data)) && ~(islogical(data))
        error('DATA results have to be either numeric or logical.');
    else
        data = real(data);
    end
    % 276 279
    % 277 279
    for j=1.0:NumberOfGrid
        abs_index = repmat({':'}, horzcat(1.0, ndims(data)));
        grid_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
        if ~(all(cheese_index{j}))
            abs_index{j} = cheese_index{j};
            grid_index{j} = cheese_index{j};
            data = data(abs_index{:});
            mask = mask(grid_index{:});
        end
    end % for
    % 288 291
    % 289 291
    if isequal(size(data), size(mask))
        data = times(mask, double(data));
    else
        % 293 295
        datasize = size(data);
        extra_dimensions = datasize(plus(NumberOfGrid, 1.0):end);
        abs_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
        for j=1.0:prod(extra_dimensions)
            data(abs_index{:}, j) = times(mask, data(abs_index{:}, j));
        end % for
    end
    % 301 307
    % 302 307
    % 303 307
    % 304 307
    % 305 307
    data = permute(data, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex, plus(NumberOfGrid, 1.0)));
    numDistinguishVar = minus(NumberOfGrid, length(untouched_gridindex));
    if gt(numDistinguishVar, 0.0)
        ind = repmat({':'}, horzcat(numDistinguishVar, 1.0));
        data = permute(data(ind{:}, :), horzcat(plus(numDistinguishVar, 1.0), 1.0:numDistinguishVar));
    else
        data = data(:);
    end
end
