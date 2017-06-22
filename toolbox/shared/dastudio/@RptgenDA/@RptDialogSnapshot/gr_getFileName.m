function fName = gr_getFileName(c, dlgH, varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    r = rptgen.appdata_rg;
    % 12 14
    imgFormat = c.ImageFormat;
    if strcmp(imgFormat, 'auto')
        adRG = rptgen.appdata_rg;
        if strncmpi(adRG.RootComponent.Format, 'pdf', 3.0)
            imgFormat = 'bmp';
        else
            imgFormat = 'png';
        end % if
    end % if
    % 22 31
    % 23 31
    % 24 31
    % 25 31
    % 26 31
    % 27 31
    % 28 31
    % 29 31
    imFile = r.getImgName(imgFormat, 'dadlg');
    % 31 37
    % 32 37
    % 33 37
    % 34 37
    % 35 37
    tempFig = figure('HandleVisibility', 'off', 'menubar', 'none', 'CloseRequestFcn', 'set(gcbf,''Visible'',''off'');', 'units', 'pixels', 'position', [50.0 50.0 150.0 30.0], 'name', 'capture', 'NumberTitle', 'off', 'IntegerHandle', 'off');
    % 37 46
    % 38 46
    % 39 46
    % 40 46
    % 41 46
    % 42 46
    % 43 46
    % 44 46
    drawnow;
    % 46 50
    % 47 50
    % 48 50
    oldUnits = get(0.0, 'units');
    set(0.0, 'units', 'pixels');
    screenSize = get(0.0, 'screensize');
    set(0.0, 'units', oldUnits);
    % 53 56
    % 54 56
    show(dlgH);
    % 56 60
    % 57 60
    % 58 60
    figPos = get(tempFig, 'position');
    % 60 65
    % 61 65
    % 62 65
    % 63 65
    dlgPos = get(dlgH, 'position');
    dlgPos(1.0) = plus(minus(dlgPos(1.0), figPos(1.0)), 2.0);
    dlgPos(2.0) = plus(minus(minus(minus(screenSize(4.0), dlgPos(2.0)), dlgPos(4.0)), figPos(2.0)), 2.0);
    % 67 71
    % 68 71
    % 69 71
    if ispc
        isXP = java.awt.Toolkit.getDefaultToolkit.getDesktopProperty('win.xpstyle.themeActive');
        if not(isempty(isXP)) && all(isXP)
            % 73 76
            % 74 76
            dlgPos(2.0) = plus(dlgPos(2.0), 7.0);
        end % if
    end % if
    % 78 80
    try
        [x, map] = frame2im(getframe(tempFig, dlgPos));
    catch
        x = [];
        c.status('Error capturing image', 2.0);
        c.status(lasterr, 5.0);
    end % try
    % 86 88
    delete(tempFig);
    % 88 90
    if isempty(x)
        fName = '';
    else
        if not(isempty(map))
            x = ind2rgb(x, map);
        end % if
        imwrite(x, imFile.fullname, imgFormat);
        % 96 98
        imSize = size(x);
        c.RuntimeViewportSize = horzcat(imSize(2.0), imSize(1.0));
        % 99 103
        % 100 103
        % 101 103
        fName = imFile.relname;
    end % if
