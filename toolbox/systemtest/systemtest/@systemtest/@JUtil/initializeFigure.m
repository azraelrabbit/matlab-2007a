function result = initializeFigure(result, testName, plotElementName)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    result.figurehandle = figure;
    result.javafigurehandle = get(result.figurehandle, 'javaFrame');
    result.javafigurehandle.setDesktopGroup(com.mathworks.toolbox.systemtest.studio.STDesktop.getInstance, 'Plots');
    % 13 15
    try
        set(result.figurehandle, 'WindowStyle', 'docked');
        % 16 18
    end % try
    % 18 20
    plotTitle = horzcat(testName, ': ', plotElementName, ': ', datestr(clock));
    % 20 22
    set(result.figurehandle, 'HandleVisibility', 'on');
    set(result.figurehandle, 'Name', plotTitle);
    set(result.figurehandle, 'Numbertitle', 'off');
    set(result.figurehandle, 'KeyPressFcn', ' ');
    % 25 28
    % 26 28
    set(datacursormode(result.figurehandle), 'Updatefcn', @systemtest.JUtil.plotElementDataCursorUpdateFCN);
