function localize(r)
    % 1 14
    % 2 14
    % 3 14
    % 4 14
    % 5 14
    % 6 14
    % 7 14
    % 8 14
    % 9 14
    % 10 14
    % 11 14
    % 12 14
    rcArraySize = horzcat(length(r.Data.RowData), length(r.Data.ColumnData));
    [s, numElementsPerAxes] = getsize(r.Data);
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    if eq(length(r.Data.MarkerData), 1.0) && eq(r.Data.MarkerData, 0.0)
        % 21 23
        markers = {'none'};
        numMarkers = 1.0;
    else
        markers = repmat({'+','o','*','.','x','square','diamond','v','^','>','<','pentagram','hexagram'}, 1.0, ceil(mrdivide(length(r.Data.MarkerData), 13.0)));
        % 26 28
        numMarkers = length(r.Data.MarkerData);
        markers = markers(1.0:numMarkers);
    end % if
    % 30 33
    % 31 33
    markerCellArray = cell(length(markers), 1.0);
    for k=1.0:length(markers)
        markerCellArray{k} = repmat(markers(k), rcArraySize);
    end % for
    markerArray = cell(horzcat(rcArraySize, numElementsPerAxes));
    for k=1.0:numElementsPerAxes
        markerArray(:, :, k) = markerCellArray{plus(rem(minus(k, 1.0), numMarkers), 1.0)};
    end % for
    % 40 44
    % 41 44
    % 42 44
    axesColorOrder = get(double(r.View.AxesGrid.Parent), 'DefaultAxesColorOrder');
    if eq(length(r.Data.ColorData), 1.0) && eq(r.Data.ColorData, 0.0)
        % 45 47
        colors = axesColorOrder(eq(r.Parent.Waves, r), :);
        numColors = 1.0;
    else
        colors = repmat(axesColorOrder, ceil(mrdivide(length(r.Data.ColorData), size(axesColorOrder, 1.0))), 1.0);
        % 50 52
        numColors = length(r.Data.ColorData);
    end % if
    % 53 56
    % 54 56
    colorCellArray = cell(length(colors), 1.0);
    for k=1.0:size(colors, 1.0)
        colorCellArray{k} = repmat(cellhorzcat(colors(k, :)), rcArraySize);
    end % for
    colorArray = cell(horzcat(rcArraySize, numElementsPerAxes));
    for k=1.0:numElementsPerAxes
        colorArray(:, :, k) = colorCellArray{plus(rem(minus(k, 1.0), numColors), 1.0)};
    end % for
    % 63 68
    % 64 68
    % 65 68
    % 66 68
    if gt(length(r.Data.MarkerData), 1.0) && length(r.Data.ColorData)
        colorArray = reshape(colorArray, horzcat(mrdivide(numel(colorArray), length(r.Data.MarkerData)), length(r.Data.MarkerData)));
        colorArray = ctranspose(colorArray);
        colorArray = colorArray(:);
    end % if
    % 72 76
    % 73 76
    % 74 76
    grps = repmat(r.Group, 1.0, numElementsPerAxes);
    % 76 79
    % 77 79
    r.View.reset(grps);
    r.View.reparent(grps, markerArray(:), colorArray(:));
end % function
