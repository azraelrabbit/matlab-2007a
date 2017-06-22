function errors = plothandler(tobj, plotRows, plotObjs, filename, varargin)
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
    try
        if ischar(tobj)
            if isempty(tobj)
                tobj = 'current';
            end
            tobj = localGetDataFromMATFile(filename, tobj);
        end
        % 20 22
        figureTitle = '';
        if eq(nargin, 5.0)
            figureTitle = varargin{1.0};
        end
        % 25 28
        % 26 28
        createdFigure = false;
        errors = {};
        count = 1.0;
        % 30 33
        % 31 33
        activePlots = 0.0;
        for i=1.0:plotRows.size
            nextPlotRow = plotRows.elementAt(minus(i, 1.0));
            if eq(nextPlotRow.getActive, true)
                activePlots = plus(activePlots, 1.0);
            end
        end % for
        % 39 42
        % 40 42
        if eq(activePlots, 0.0)
            return
        end
        % 44 47
        % 45 47
        if gt(activePlots, 0.0) && isempty(tobj.Data)
            errors{plus(end, 1.0)} = horzcat('There is no data to plot. The SimBiology model must contain', sprintf('\n'), 'reactions and/or rules and must be logging at least one species', sprintf('\n'), 'and/or parameter.');
            % 48 51
            % 49 51
            return
        end
        % 52 55
        % 53 55
        for i=1.0:plotRows.size
            % 55 57
            nextPlotRow = plotRows.elementAt(minus(i, 1.0));
            nextPlotObj = plotObjs.elementAt(minus(i, 1.0));
            % 58 61
            % 59 61
            try
                b = localplot(tobj, nextPlotRow, nextPlotObj);
                % 62 65
                % 63 65
                if eq(b, true)
                    createdFigure = true;
                    count = plus(count, 1.0);
                    if ~(isempty(figureTitle))
                        title(figureTitle, 'Interpreter', 'none');
                    end
                end
            catch
                msg = lasterr;
                index = find(eq(double(msg), 10.0));
                errors{plus(end, 1.0)} = horzcat('Figure ', num2str(i), ': ', msg(plus(index, 1.0):end));
            end % try
        end % for
        % 77 79
        drawnow;
    catch
        % 80 83
        % 81 83
        errors = {};
    end % try
end
function out = localplot(tobj, nextPlotRow, nextPlotObj)
    % 86 89
    % 87 89
    out = false;
    % 89 92
    % 90 92
    if eq(nextPlotRow.getActive, false)
        return
    end
    % 94 97
    % 95 97
    x = nextPlotRow.getXArgs;
    y = nextPlotRow.getYArgs;
    plotBehavior = nextPlotRow.getLocation;
    % 99 102
    % 100 102
    x = strread(x, '%s', 'delimiter', ',');
    y = strread(y, '%s', 'delimiter', ',');
    % 103 106
    % 104 106
    plotTypeObject = nextPlotRow.getPlotTypeObject;
    if isempty(x) && eq(plotTypeObject.getXArgsNeeded, true)
        error('X Arguments must be specified.');
    end
    % 109 111
    if isempty(y) && eq(plotTypeObject.getYArgsNeeded, true)
        error('Y Arguments must be specified.');
    end
    % 113 116
    % 114 116
    try
        % 116 119
        % 117 119
        switch plotBehavior
        case 0.0
            hFigureHandle = figure;
            set(hFigureHandle, 'NumberTitle', 'off');
            set(hFigureHandle, 'Name', horzcat(nextPlotRow.getName, ' - Figure ', num2str(hFigureHandle)));
            dcm_obj = datacursormode(hFigureHandle);
            set(dcm_obj, 'UpdateFcn', @localDataTip)
        case 1.0
            hFigureHandle = gcf;
            hold('on');
        case 2.0
            hFigureHandle = gcf;
            hold('off');
        end
        code = char(nextPlotObj.getPlotCode);
        eval(code);
        % 134 137
        % 135 137
        drawnow;
        jf = get(hFigureHandle, 'JavaFrame');
        if ~(isempty(jf)) && usejava('desktop')
            desktop = com.mathworks.toolbox.simbio.desktop.SystemsBiologyDesktop.getInstance;
            jf.setDesktopGroup(desktop, 'Figures');
        end
        % 142 144
        set(hFigureHandle, 'Visible', 'on');
        % 144 146
        drawnow;
    catch
        if ne(plotBehavior, 1.0)
            close(hFigureHandle);
        end
        rethrow(lasterror)
    end % try
    % 152 154
    out = true;
end
function obj = localGetDataFromMATFile(matfile, varname)
    % 156 160
    % 157 160
    % 158 160
    varname = genvarname(varname);
    cmd = horzcat('load(''', matfile, ''',''', varname, ''');');
    obj = evalin('base', cmd);
    obj = obj.(varname);
end
function txt = localDataTip(obj, event_obj)
    % 165 169
    % 166 169
    % 167 169
    pos = get(event_obj, 'Position');
    hLine = get(event_obj, 'Target');
    tag = get(hLine, 'Tag');
    % 171 173
    if isempty(tag)
        txt = cellhorzcat(horzcat('X: ', num2str(pos(1.0))), horzcat('Y: ', num2str(pos(2.0))));
    else
        % 175 177
        txt = cellhorzcat(horzcat('Name: ', tag), horzcat('X: ', num2str(pos(1.0))), horzcat('Y: ', num2str(pos(2.0))));
        % 177 180
        % 178 180
    end
end
