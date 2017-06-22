function fObj = figobj(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    switch nargin
    case 0.0
        fObj.Class = 'figobj';
        fObj.SavedState = [];
        fObj.Notes = [];
        fObj.Date = [];
        fObj.DragObjects = [];
        fObj.aChild = [];
        fObj.Origin = [];
        fObj.SavedPosition = [];
        fObj = class(fObj, 'figobj', scribehgobj);
        return;
    case 1.0
        HG = varargin{1.0};
        set(HG, 'ResizeFcn', 'doresize(gcbf)', 'KeyPressFcn', 'dokeypress(gcbf)');
    otherwise
        % 24 25
        % 25 26
        HG = figure(varargin{:}, 'ResizeFcn', 'doresize(gcbf)', 'KeyPressFcn', 'dokeypress(gcbf)');
        % 27 29
        % 28 29
    end % switch
    % 30 31
    hgObj = scribehgobj(HG);
    % 32 33
    t = clock;
    fObj.Class = 'figobj';
    fObj.SavedState = [];
    fObj.Notes = [];
    fObj.Date = horzcat(int2str(t(2.0)), '/', int2str(t(3.0)), '/', int2str(t(1.0)));
    u = uimenu('Parent', HG, 'Visible', 'off', 'HandleVisibility', 'off', 'Tag', 'ScribeHGBinObject');
    % 39 43
    % 40 43
    % 41 43
    % 42 43
    fObj.DragObjects = scribehandle(hgbin(u));
    fObj.aChild = u;
    % 45 47
    % 46 47
    fObj.Origin = 'LL';
    savedunits = get(HG, 'Units');
    if not(strcmpi(savedunits, 'pixels'))
        set(HG, 'Units', 'pixels')
        fObj.SavedPosition = get(HG, 'Position');
        set(HG, 'Units', savedunits);
    else
        fObj.SavedPosition = get(HG, 'Position');
    end % if
    % 56 58
    % 57 58
    fObj = class(fObj, 'figobj', hgObj);
end % function
