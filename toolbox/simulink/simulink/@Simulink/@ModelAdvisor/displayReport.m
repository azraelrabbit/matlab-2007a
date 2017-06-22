function displayReport(this, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    persistent hb;
    persistent a;
    % 8 10
    if gt(nargin, 1.0) && not(strcmp(varargin{1.0}, 'norefresh'))
        htmlfile = varargin{1.0};
    else
        htmlfile = this.AtticData.DiagnoseStartPage;
    end
    % 14 17
    % 15 17
    if not(strcmp(htmlfile, 'norefresh'))
        this.createLeftPane;
    end
    % 19 22
    % 20 22
    if this.NOBROWSER
        return
    end
    % 24 26
    Browser = this.AtticData.Browser;
    % 26 28
    switch Browser
    case 'java'
        hbClosed = 1.0;
        if isempty(hb)
            hbClosed = 1.0;
        else
            if not(hb.isShowing)
                hbClosed = 1.0;
            else
                hbClosed = 0.0;
            end
        end
        if hbClosed
            a = awtcreate('com.mathworks.mlwidgets.html.HTMLBrowserPanel');
            awtinvoke(a, 'addToolbar');
            awtinvoke(a, 'addStatusBar');
            hb = awtcreate('com.mathworks.mwswing.MJFrame');
            sfTk = hb.getToolkit;
            screenSize = sfTk.getScreenSize;
            height = screenSize.getHeight;
            width = screenSize.getWidth;
            height = floor(mrdivide(height, 1.5));
            width = floor(mrdivide(width, 1.5));
            awtinvoke(hb, 'setSize(II)', width, height);
            hb.getContentPane.add(a);
            icon = javax.swing.ImageIcon(fullfile(matlabroot, 'toolbox', 'matlab', 'icons', 'simulinkicon.gif'));
            image = icon.getImage;
            hb.setIconImage(image);
            awtinvoke(hb, 'setVisible(Z)', true);
        end
        hb.setTitle(horzcat('Model Advisor -- ', htmlfile));
        a.setCurrentLocation(htmlfile);
        hb.requestFocus;
        this.BrowserWindow = hb;
    case 'helpbrowser'
        helpview(htmlfile);
    otherwise
        helpview(htmlfile);
    end
end
