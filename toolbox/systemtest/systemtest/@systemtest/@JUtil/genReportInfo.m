function genReportInfo(genMode, varargin)
    % 1 27
    % 2 27
    % 3 27
    % 4 27
    % 5 27
    % 6 27
    % 7 27
    % 8 27
    % 9 27
    % 10 27
    % 11 27
    % 12 27
    % 13 27
    % 14 27
    % 15 27
    % 16 27
    % 17 27
    % 18 27
    % 19 27
    % 20 27
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    % 26 27
    switch genMode
    case 'GenerateModelLink'
        fid = varargin{1.0};
        modelName = varargin{2.0};
        hElem = varargin{3.0};
        localGenerateModelLink(fid, modelName, hElem);
    case 'PrintModel'
        modelName = varargin{1.0};
        jpgPath = varargin{2.0};
        hElem = varargin{3.0};
        localPrintModel(modelName, jpgPath, hElem);
    case 'PrintPlot'
        fid = varargin{1.0};
        hFig = varargin{2.0};
        imagePath = varargin{3.0};
        hElem = varargin{4.0};
        elemName = varargin{5.0};
        iterStr = varargin{6.0};
        localPrintPlot(fid, hFig, imagePath, hElem, elemName, iterStr);
    otherwise
        error('systemtest:genReportInfo:InvalidMode', 'Invalid report generation mode specified.');
        % 48 49
    end % switch
end % function
function localGenerateModelLink(fid, modelName, hElem)
    % 52 56
    % 53 56
    % 54 56
    % 55 56
    jpgFile = sprintf('SLElement%s.jpeg', hElem);
    % 57 59
    % 58 59
    fprintf(fid, '<h3> Model <a href="matlab:open_system(''%s'')">%s</a></h3>\n', modelName, modelName);
    % 60 62
    % 61 62
    fprintf(fid, '<br/>\n');
    fprintf(fid, '<p><img src="%s"></p>\n', jpgFile);
    fprintf(fid, '<hr>\n');
end % function
function localPrintModel(modelName, jpgPath, hElem)
    % 67 71
    % 68 71
    % 69 71
    % 70 71
    jpgFile = sprintf('SLElement%s.jpeg', hElem);
    % 72 75
    % 73 75
    % 74 75
    wasModelOpen = true;
    hSys = find_system('type', 'block_diagram', 'name', modelName);
    if isempty(hSys)
        wasModelOpen = false;
    else
        open_system(modelName);
    end % if
    % 82 84
    % 83 84
    get_param(modelName, 'PaperPosition');
    set_param(modelName, 'PaperOrientation', 'portrait');
    set_param(modelName, 'PaperPositionMode', 'manual');
    print(sprintf('-s%s', modelName), '-djpeg', sprintf('%s%s', jpgPath, jpgFile));
    % 88 90
    % 89 90
    if not(wasModelOpen)
        close_system(modelName, 0.0);
    end % if
end % function
function localPrintPlot(fid, hFig, imagePath, hElem, elemName, iterStr)
    % 95 99
    % 96 99
    % 97 99
    % 98 99
    imageName = sprintf('PlotElement%s%s.png', hElem, iterStr);
    imageName = strrep(imageName, ' ', '_');
    % 101 103
    % 102 103
    if ishandle(hFig)
        print(hFig, '-dpng', sprintf('%s%s', imagePath, imageName), '-r0');
        fprintf(fid, '<h4><u>%s</u></h4>\n', elemName);
        fprintf(fid, '<p><img src="%s"></p>\n', imageName);
    end % if
end % function
