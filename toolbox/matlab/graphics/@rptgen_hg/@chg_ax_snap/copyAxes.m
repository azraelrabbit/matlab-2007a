function axFig = copyAxes(c, hAx)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    axFig = LocAxesFigure(hAx);
    LocCopyAxes(axFig, hAx);
function axFig = LocAxesFigure(hAx)
    % 10 14
    % 11 14
    % 12 14
    axFig = rptgen_hg.makeTempCanvas;
    sHandle = get(hAx, 'parent');
    % 15 18
    % 16 18
    orig.Units = get(sHandle, 'Units');
    orig.Position = get(sHandle, 'position');
    orig.Color = get(sHandle, 'color');
    orig.ColorMap = get(sHandle, 'colormap');
    orig.InvertHardcopy = get(sHandle, 'InvertHardcopy');
    orig.Renderer = get(sHandle, 'Renderer');
    orig.ShareColors = get(sHandle, 'ShareColors');
    % 24 26
    set(axFig, orig);
function LocCopyAxes(axFig, allAx)
    % 27 31
    % 28 31
    % 29 31
    allAx = copyobj(allAx, axFig);
    % 31 33
    set(vertcat(allAx, axFig), 'units', 'pixels');
    % 33 35
    numAx = length(allAx);
    % 35 37
    extentMatrix = ones(numAx, 4.0);
    for i=1.0:numAx
        extentMatrix(i, 1.0:4.0) = LocAxesExtent(allAx(i));
    end % for
    % 40 42
    minExtent = min(extentMatrix, [], 1.0);
    % 42 44
    border = 10.0;
    % 44 47
    % 45 47
    axPos = get(allAx, 'Position');
    if gt(numAx, 1.0)
        axPos = cat(1.0, axPos{:});
        axPos(:, 1.0) = plus(minus(axPos(:, 1.0), minExtent(1.0)), border);
        axPos(:, 2.0) = plus(minus(axPos(:, 2.0), minExtent(2.0)), border);
        axPos = num2cell(axPos, 2.0);
        posID = {'Position'};
    else
        posID = 'Position';
        axPos(:, 1.0) = plus(minus(axPos(:, 1.0), minExtent(1.0)), border);
        axPos(:, 2.0) = plus(minus(axPos(:, 2.0), minExtent(2.0)), border);
        posID = 'Position';
    end % if
    % 59 61
    set(allAx, posID, axPos);
    % 61 63
    maxExtent = max(extentMatrix, [], 1.0);
    % 63 65
    figSize = plus(minus(maxExtent(3.0:4.0), minExtent(1.0:2.0)), mtimes(2.0, border));
    % 65 67
    set(axFig, 'Position', horzcat(20.0, 20.0, figSize));
function axExtent = LocAxesExtent(axH)
    % 68 72
    % 69 72
    % 70 72
    axExtent = get(axH, 'OuterPosition');
    axExtent = horzcat(axExtent(1.0:2.0), plus(axExtent(1.0:2.0), axExtent(3.0:4.0)));
