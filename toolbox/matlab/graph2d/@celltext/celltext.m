function A = celltext(theFrame, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        A.Class = 'celltext';
        A.HorizontalAlignment = [];
        A.VerticalAlignment = [];
        A.FontUnits = [];
        A.FontSize = [];
        A.CellPadding = [];
        A = class(A, 'celltext', axistext);
        return;
    end % if
    % 18 19
    pos = get(theFrame, 'Position');
    % 20 23
    % 21 23
    % 22 23
    x = plus(pos(1.0), mrdivide(pos(3.0), 2.0));
    y = plus(pos(2.0), mrdivide(pos(4.0), 2.0));
    % 25 26
    if eq(nargin, 1.0)
        t = text(x, y, '', 'Visible', 'off');
    else
        t = text(x, y, varargin{:}, 'Visible', 'off');
    end % if
    set(t, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Editing', 'on', 'Clipping', 'on', 'EraseMode', 'xor', 'ButtonDownFcn', 'doclick(gcbo)');
    % 32 39
    % 33 39
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    % 38 39
    A.Class = 'celltext';
    A.HorizontalAlignment = 'center';
    A.VerticalAlignment = 'middle';
    % 42 43
    axobj = getobj(get(t, 'Parent'));
    if not(isempty(axobj))
        zoomScale = get(axobj, 'ZoomScale');
    else
        zoomScale = 1.0;
    end % if
    % 49 50
    A.FontUnits = get(t, 'FontUnits');
    A.FontSize = get(t, 'FontSize');
    set(t, 'FontSize', mtimes(A.FontSize, zoomScale), 'Visible', 'on');
    % 53 55
    % 54 55
    A.CellPadding = .05;
    % 56 57
    axistextObj = axistext(t);
    A = class(A, 'celltext', axistextObj);
    Ah = scribehandle(A);
    theFrame.NewItem = scribehandle(A);
    % 61 62
    A = Ah.Object;
    % 63 66
    % 64 66
    % 65 66
    uic = getscribecontextmenu(t);
    % 67 68
    set(t, 'UIContextMenu', uic);
    menus = allchild(uic);
    colorMenu = findall(menus, 'Tag', 'ScribeAxistextObjColorMenu');
    % 71 72
    delete(horzcat(findall(menus, 'Tag', 'ScribeAxistextObjCutMenu'), findall(menus, 'Tag', 'ScribeAxistextObjCopyMenu'), findall(menus, 'Tag', 'ScribeAxistextObjPasteMenu'), findall(menus, 'Tag', 'ScribeAxistextObjClearMenu')));
    % 73 77
    % 74 77
    % 75 77
    % 76 77
    set(colorMenu, 'Callback', 'domethod(getobj(gco),''editcolor'')');
    % 78 79
    set(findall(allchild(uic), 'Tag', 'ScribeAxistextObjStringMenu'), 'Separator', 'off');
end % function
