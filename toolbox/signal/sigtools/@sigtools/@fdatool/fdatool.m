function h = fdatool
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
    h = sigtools.fdatool;
    % 14 17
    % 15 17
    set(h, 'sessionType', 'default');
    set(h, 'filename', 'untitled.fda');
    set(h, 'version', 1.1);
    set(h, 'LaunchedBySPTool', 0.0);
    % 20 22
    set(h, 'filterMadeBy', '');
    % 22 24
    addlistener(h, 'NewAnalysis', @newanalysis_eventcb, h);
end % function
function newanalysis_eventcb(hFDA, eventData)
    % 26 30
    % 27 30
    % 28 30
    h = gethandles(hFDA);
    analysisStr = get(eventData, 'Data');
    % 31 33
    hTitle = h.analysis.frame(2.0);
    origUnits = get(hTitle, 'units');
    set(hTitle, 'Units', 'Pixels');
    pos = get(hTitle, 'Position');
    pos(3.0) = largestuiwidth(cellhorzcat(analysisStr));
    set(hTitle, 'Position', pos, 'String', analysisStr, 'Units', origUnits);
    % 38 41
    % 39 41
    w = warning('off');
    % 41 43
    setzoomstate(hFDA.FigureHandle);
    % 43 45
    warning(w);
end % function
