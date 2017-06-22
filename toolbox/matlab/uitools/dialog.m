function hDialog = dialog(varargin)
    % 1 36
    % 2 36
    % 3 36
    % 4 36
    % 5 36
    % 6 36
    % 7 36
    % 8 36
    % 9 36
    % 10 36
    % 11 36
    % 12 36
    % 13 36
    % 14 36
    % 15 36
    % 16 36
    % 17 36
    % 18 36
    % 19 36
    % 20 36
    % 21 36
    % 22 36
    % 23 36
    % 24 36
    % 25 36
    % 26 36
    % 27 36
    % 28 36
    % 29 36
    % 30 36
    % 31 36
    % 32 36
    % 33 36
    % 34 36
    if eq(rem(nargin, 2.0), 1.0)
        error('MATLAB:dialog:NeedParamPairs', 'Must have param/value pairs.');
    end % if
    % 38 41
    % 39 41
    dlgColor = get(0.0, 'defaultuicontrolbackgroundcolor');
    % 41 43
    dlgMenubar = 'none';
    backstore = 'off';
    btndown = 'if isempty(allchild(gcbf)), close(gcbf), end';
    colormap = [];
    dockctrls = 'off';
    handlevis = 'callback';
    inthandle = 'off';
    invhdcpy = 'off';
    numtitle = 'off';
    ppmode = 'auto';
    resize = 'off';
    visible = 'on';
    winstyle = 'modal';
    % 55 57
    extrapropval = varargin;
    % 57 59
    rmloc = [];
    % 59 61
    for lp=1.0:2.0:size(varargin, 2.0)
        switch lower(varargin{lp})
        case 'backingstore'
            backstore = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'buttondownfcn'
            btndown = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'colormap'
            colormap = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'color'
            dlgColor = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'dockcontrols'
            dockctrls = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'handlevisibility'
            handlevis = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'integerhandle'
            inthandle = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'inverthardcopy'
            invhdcpy = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'menubar'
            dlgMenubar = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'numbertitle'
            numtitle = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'paperpositionmode'
            ppmode = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'resize'
            resize = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'visible'
            visible = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        case 'windowstyle'
            winstyle = varargin{plus(lp, 1.0)};
            rmloc = vertcat(rmloc, horzcat(lp, plus(lp, 1.0)));
        end % switch
    end % for
    if not(isempty(rmloc))
        extrapropval(rmloc) = [];
    end % if
    hDialog = figure('BackingStore', backstore, 'ButtondownFcn', btndown, 'Color', dlgColor, 'Colormap', colormap, 'IntegerHandle', inthandle, 'InvertHardcopy', invhdcpy, 'HandleVisibility', handlevis, 'Menubar', dlgMenubar, 'NumberTitle', numtitle, 'PaperPositionMode', ppmode, 'Resize', resize, 'Visible', visible, 'WindowStyle', winstyle, 'DockControls', dockctrls, extrapropval{:});
end % function
