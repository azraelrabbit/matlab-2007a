function [x_data, y_data, y_index, iteration, row_label, col_label] = plot_lineresp_timeseries(this, x, y, rowvar, colvar, markervar, colorvar)
    % 1 28
    % 2 28
    % 3 28
    % 4 28
    % 5 28
    % 6 28
    % 7 28
    % 8 28
    % 9 28
    % 10 28
    % 11 28
    % 12 28
    % 13 28
    % 14 28
    % 15 28
    % 16 28
    % 17 28
    % 18 28
    % 19 28
    % 20 28
    % 21 28
    % 22 28
    % 23 28
    % 24 28
    % 25 28
    % 26 28
    gridVars = fieldnames(this.DataSet.testvector);
    gridSize = this.getGridSize;
    NumberOfY = length(y);
    % 30 34
    % 31 34
    % 32 34
    untouched_gridindex = 1.0:plus(length(gridVars), 1.0);
    [untouched_gridindex, junk1, junk2, junk3, row_index, col_index, marker_index, color_index] = utGetDiffVarIndex(this, 'GridOnly', untouched_gridindex, [], NumberOfY, [], [], rowvar, colvar, markervar, colorvar);
    % 35 39
    % 36 39
    % 37 39
    untouched_gridindex = untouched_gridindex(ne(untouched_gridindex, 0.0));
    % 39 42
    % 40 42
    if ~(isempty(row_index))
        row_data = this.getinddata(rowvar{1.0});
    end
    % 44 46
    if ~(isempty(col_index))
        col_data = this.getinddata(colvar{1.0});
    end
    % 48 51
    % 49 51
    cheese_index = this.getFilteredDomain;
    % 51 58
    % 52 58
    % 53 58
    % 54 58
    % 55 58
    % 56 58
    x_data = cell(NumberOfY, 1.0);
    y_data = cell(NumberOfY, 1.0);
    for i=1.0:NumberOfY
        % 60 62
        absoluteindex = this.absoluteindex;
        % 62 64
        if isscalar(gridSize)
            time = cell(horzcat(gridSize, 1.0));
            data = cell(horzcat(gridSize, 1.0));
        else
            time = cell(gridSize);
            data = cell(gridSize);
        end
        for j=1.0:prod(gridSize)
            if eq(this.filteredindex(j), true) && ~(isempty(this.DataSet.variable.(y{i}){j}))
                time(j) = cellhorzcat(this.DataSet.variable.(y{i}){j}.time);
                % 73 75
                data(j) = cellhorzcat(double(real(this.DataSet.variable.(y{i}){j}.data)));
            end
        end % for
        % 77 80
        % 78 80
        for j=1.0:numel(gridVars)
            grid_index = repmat({':'}, horzcat(1.0, numel(gridVars)));
            if ~(all(cheese_index{j}))
                grid_index{j} = cheese_index{j};
                data = data(grid_index{:});
                time = time(grid_index{:});
                absoluteindex = absoluteindex(grid_index{:});
            end
            if ~(isempty(row_index)) && eq(j, row_index)
                row_data = row_data(cheese_index{j});
            end
            if ~(isempty(col_index)) && eq(j, col_index)
                col_data = col_data(cheese_index{j});
            end
        end % for
        time = permute(time, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex));
        data = permute(data, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex));
        x_data(i) = cellhorzcat(time);
        y_data(i) = cellhorzcat(data);
    end % for
    iteration = permute(absoluteindex, horzcat(row_index, col_index, marker_index, color_index, untouched_gridindex));
    % 100 103
    % 101 103
    y_index = local_yindex(row_index, col_index, marker_index, color_index);
    % 103 106
    % 104 106
    if isempty(row_index)
        row_label = {''};
    else
        row_label = local_label(row_data);
    end
    % 110 113
    % 111 113
    if isempty(col_index)
        col_label = {''};
    else
        col_label = local_label(col_data);
    end
end
function y_index = local_yindex(row_index, col_index, marker_index, color_index)
    % 119 122
    % 120 122
    y_index = {};
    k = 1.0;
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
