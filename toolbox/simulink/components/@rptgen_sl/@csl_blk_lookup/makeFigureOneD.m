function h = makeFigureOneD(c, xData, xLabel, yData, yLabel)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    if ne(length(xData), length(yData))
        xData = 1.0:length(yData);
        xLabel = horzcat(xLabel, ' [indices]');
    end % if
    % 10 12
    h = rptgen_hg.makeTempCanvas;
    set(h, 'Color', 'white', 'InvertHardcopy', 'off', 'HandleVisibility', 'on');
    % 13 18
    % 14 18
    % 15 18
    % 16 18
    axHandle = axes('Parent', h, 'HandleVisibility', 'on', 'Box', 'on', 'Color', [1.0 1.0 1.0], 'XlimMode', 'auto', 'YlimMode', 'auto');
    % 18 25
    % 19 25
    % 20 25
    % 21 25
    % 22 25
    % 23 25
    ok = false;
    % 25 27
    switch c.SinglePlotType
    case 'lineplot'
        try
            lnHandle = line('Parent', axHandle, 'Xdata', xData, 'Ydata', yData, 'Color', [0.0 0.0 1.0], 'LineWidth', 2.0, 'Marker', '.');
            % 30 36
            % 31 36
            % 32 36
            % 33 36
            % 34 36
            ok = true;
        catch
            c.status(xlate('Unable to draw line.'), 2.0);
            c.status(lasterr, 5.0);
        end % try
    case 'barplot'
        try
            bar(double(xData), double(yData));
            ok = true;
        catch
            c.status(xlate('Unable to draw bar.'), 2.0);
            c.status(lasterr, 5.0);
        end % try
    otherwise
        c.status('Unrecognized plot type', 1.0);
    end % switch
    % 51 53
    set(h, 'HandleVisibility', 'off');
    % 53 55
    if ok
        axProp = struct('FontAngle', get(axHandle, 'FontAngle'), 'FontName', get(axHandle, 'FontName'), 'FontSize', get(axHandle, 'FontSize'), 'FontWeight', get(axHandle, 'FontWeight'));
        % 56 62
        % 57 62
        % 58 62
        % 59 62
        % 60 62
        set(get(axHandle, 'xlabel'), axProp, 'Interpreter', 'none', 'String', xLabel);
        % 62 65
        % 63 65
        set(get(axHandle, 'ylabel'), axProp, 'Interpreter', 'none', 'String', yLabel);
    else
        % 66 69
        % 67 69
        % 68 70
        h = [];
    end % if
