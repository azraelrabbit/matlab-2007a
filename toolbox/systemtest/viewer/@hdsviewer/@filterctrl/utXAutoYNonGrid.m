function [x_data, y_data, y_index, iteration, row_label, col_label] = utXAutoYNonGrid(this, x, y, rowvar, colvar, markervar, colorvar)
    % 1 20
    % 2 20
    % 3 20
    % 4 20
    % 5 20
    % 6 20
    % 7 20
    % 8 20
    % 9 20
    % 10 20
    % 11 20
    % 12 20
    % 13 20
    % 14 20
    % 15 20
    % 16 20
    % 17 20
    % 18 20
    GridLengths = this.getGridSize;
    NumberOfGrid = numel(GridLengths);
    NumberOfY = length(y);
    % 22 25
    % 23 25
    checkDependentVar(this, y);
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    untouched_gridindex = 1.0:NumberOfGrid;
    % 32 34
    maxLength = zeros(1.0, NumberOfY);
    total_size = cell(1.0, NumberOfY);
    for i=1.0:NumberOfY
        % 36 38
        originalData = this.DataSet.variable.(y{i});
        % 38 40
        if iscell(originalData)
            % 40 42
            isDouble = cellfun('isclass', originalData(:), 'double');
            isLogical = cellfun('islogical', originalData(:));
            isNumeric = (((((((((((isDouble) | (isLogical)) | (cellfun('isclass', originalData(:), 'uint8'))) | (cellfun('isclass', originalData(:), 'int8'))) | (cellfun('isclass', originalData(:), 'uint16'))) | (cellfun('isclass', originalData(:), 'int8'))) | (cellfun('isclass', originalData(:), 'uint16'))) | (cellfun('isclass', originalData(:), 'uint32'))) | (cellfun('isclass', originalData(:), 'int32'))) | (cellfun('isclass', originalData(:), 'single'))) | (cellfun('isclass', originalData(:), 'int64'))) | (cellfun('isclass', originalData(:), 'uint64'));
            % 44 51
            % 45 51
            % 46 51
            % 47 51
            % 48 51
            % 49 51
            if ~(all(isNumeric))
                error('Y_DATA results have to be numeric or logical');
            end
            % 53 56
            % 54 56
            total_size{i} = cellfun('prodofsize', originalData);
            maxLength(i) = max(total_size{i}(:));
        else
            % 58 60
            if ~(isnumeric(originalData)) && ~(islogical(originalData))
                error('Y_DATA results have to be either numeric or logical');
            end
            maxLength(i) = mrdivide(numel(originalData), prod(GridLengths));
        end
    end % for
    % 65 68
    % 66 68
    [untouched_gridindex, junk, junk1, junk2, row_index, col_index, marker_index, color_index] = utGetDiffVarIndex(this, 'GridOnly', untouched_gridindex, [], NumberOfY, [], [], rowvar, colvar, markervar, colorvar);
    % 68 71
    % 69 71
    untouched_gridindex = untouched_gridindex(ne(untouched_gridindex, 0.0));
    % 71 74
    % 72 74
    if ~(isempty(row_index))
        row_data = this.getinddata(rowvar{1.0});
    end
    % 76 79
    % 77 79
    if ~(isempty(col_index))
        col_data = this.getinddata(colvar{1.0});
    end
    % 81 84
    % 82 84
    cheese_index = this.getFilteredDomain;
    % 84 87
    % 85 87
    y_data = cell(1.0, NumberOfY);
    for i=1.0:NumberOfY
        % 88 91
        % 89 91
        if eq(length(GridLengths), 1.0)
            mask = NaN(GridLengths, 1.0);
        else
            mask = NaN(GridLengths);
        end
        mask(this.filteredindex) = 1.0;
        % 96 99
        % 97 99
        absoluteindex = this.absoluteindex;
        % 99 102
        % 100 102
        originalData = this.DataSet.variable.(y{i});
        if iscell(originalData)
            data = NaN(horzcat(maxLength(i), GridLengths));
            tmp = cellfun('isclass', originalData(:), 'double');
            if ~(all(tmp))
                for j=1.0:prod(GridLengths)
                    data(1.0:total_size{1.0}(j), j) = double(originalData{j}(:));
                end % for
            else
                for j=1.0:prod(GridLengths)
                    data(1.0:total_size{1.0}(j), j) = originalData{j}(:);
                end % for
            end
            data = permute(data, horzcat(2.0:plus(NumberOfGrid, 1.0), 1.0));
        else
            if ~(isa(originalData, 'double'))
                originalData = double(originalData);
            end
            data = reshape(originalData, horzcat(GridLengths, maxLength(i)));
        end
        % 121 124
        % 122 124
        dataDim = ndims(data);
        for j=1.0:NumberOfGrid
            abs_index = repmat({':'}, horzcat(1.0, dataDim));
            grid_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
            if ~(all(cheese_index{j}))
                abs_index{j} = cheese_index{j};
                grid_index{j} = cheese_index{j};
                data = data(abs_index{:});
                mask = mask(grid_index{:});
                absoluteindex = absoluteindex(grid_index{:});
            end
            if ~(isempty(row_index)) && eq(j, row_index)
                row_data = row_data(cheese_index{j});
            end
            if ~(isempty(col_index)) && eq(j, col_index)
                col_data = col_data(cheese_index{j});
            end
        end % for
        % 141 144
        % 142 144
        if isequal(size(data), size(mask))
            data = times(mask, data);
        else
            % 146 148
            datasize = size(data);
            extra_dimensions = datasize(plus(NumberOfGrid, 1.0):end);
            abs_index = repmat({':'}, horzcat(1.0, NumberOfGrid));
            for j=1.0:prod(extra_dimensions)
                data(abs_index{:}, j) = times(mask, data(abs_index{:}, j));
            end % for
        end
        % 154 157
        % 155 157
        y_data{i} = real(permute(data, horzcat(plus(NumberOfGrid, 1.0), row_index, col_index, marker_index, color_index, untouched_gridindex)));
        x_data = ctranspose(1.0:cellfun('size', y_data(i), 1.0));
    end % for
    % 159 162
    % 160 162
    if gt(NumberOfGrid, 1.0)
        basic_iteration = permute(absoluteindex, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex));
    else
        basic_iteration = absoluteindex(:);
    end
    iteration = cell(1.0, NumberOfY);
    for i=1.0:NumberOfY
        % 168 170
        s = size(y_data{i});
        % 170 173
        % 171 173
        if eq(maxLength(i), 1.0)
            % 173 175
            iteration(i) = cellhorzcat(reshape(basic_iteration, horzcat(1.0, size(basic_iteration))));
        else
            s(end) = s(1.0);
            s(1.0:minus(end, 1.0)) = 1.0;
            iteration(i) = cellhorzcat(repmat(basic_iteration, s));
            iteration(i) = cellhorzcat(permute(iteration{i}, horzcat(ndims(iteration{i}), 1.0:minus(ndims(iteration{i}), 1.0))));
        end
    end % for
    % 182 185
    % 183 185
    y_index = local_yindex(row_index, col_index, marker_index, color_index);
    % 185 188
    % 186 188
    if isempty(row_index)
        row_label = {''};
    else
        row_label = local_label(row_data);
    end
    % 192 194
    if isempty(col_index)
        col_label = {''};
    else
        col_label = local_label(col_data);
    end
end
function y_index = local_yindex(row_index, col_index, marker_index, color_index)
    % 200 204
    % 201 204
    % 202 204
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
    % 230 233
    % 231 233
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
