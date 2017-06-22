function h = makeFigureTwoD(c, xVal, xName, yVal, yName, tVal, tName)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    if ne(length(xVal), size(tVal, 1.0))
        xVal = 1.0:size(tVal, 1.0);
        xName = horzcat(xName, ' [indices]');
    end
    % 9 11
    if ne(length(yVal), size(tVal, 2.0))
        yVal = 1.0:size(tVal, 2.0);
        yName = horzcat(yName, ' [indices]');
    end
    % 14 19
    % 15 19
    % 16 19
    % 17 19
    h = rptgen_hg.makeTempCanvas;
    set(h, 'Color', 'white', 'InvertHardcopy', 'off');
    % 20 22
    axHandle = axes('Parent', h, 'Box', 'off', 'Color', [1.0 1.0 1.0], 'Xgrid', 'on', 'Ygrid', 'on', 'Zgrid', 'on', 'ZlimMode', 'auto', 'XlimMode', 'auto', 'YlimMode', 'auto');
    % 22 32
    % 23 32
    % 24 32
    % 25 32
    % 26 32
    % 27 32
    % 28 32
    % 29 32
    % 30 32
    if strcmp(c.DoublePlotType, 'surfaceplot')
        try
            set(axHandle, 'View', [-37.5 30.0]);
            % 34 38
            % 35 38
            % 36 38
            surfHandle = surface(double(yVal), double(xVal), double(tVal), 'FaceColor', 'interp', 'Parent', axHandle);
            % 38 41
            % 39 41
            ok = logical(1);
        catch
            ok = logical(0);
        end % try
    else
        try
            plotHandles = plot(xVal, tVal, 'parent', axHandle);
            % 47 49
            legendLabels = cellstr(num2str(double(yVal(:))));
            % 49 51
            legend(plotHandles, legendLabels, -1.0);
            % 51 53
            ok = logical(1);
        catch
            ok = logical(0);
        end % try
    end
    % 57 59
    if ok
        axProp = struct('FontAngle', get(axHandle, 'FontAngle'), 'FontName', get(axHandle, 'FontName'), 'FontSize', get(axHandle, 'FontSize'), 'FontWeight', get(axHandle, 'FontWeight'));
        % 60 65
        % 61 65
        % 62 65
        % 63 65
        set(get(axHandle, 'xlabel'), 'Interpreter', 'none', axProp, 'String', xName);
        % 65 70
        % 66 70
        % 67 70
        % 68 70
        if strcmp(c.DoublePlotType, 'surfaceplot')
            set(get(axHandle, 'zlabel'), axProp, 'Interpreter', 'none', 'String', tName);
            % 71 74
            % 72 74
            set(get(axHandle, 'ylabel'), axProp, 'Interpreter', 'none', 'String', yName);
        else
            % 75 77
            % 76 78
            set(get(axHandle, 'ylabel'), axProp, 'Interpreter', 'none', 'String', tName);
            % 78 81
            % 79 81
        end
    else
        h = [];
    end
end
