function axobj = axisobj(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        axobj.Class = 'axisobj';
        axobj.Notes = [];
        axobj.FigObj = [];
        axobj.ZoomScale = [];
        axobj = class(axobj, 'axisobj', scribehgobj);
        return;
    end % if
    % 16 17
    if eq(nargin, 1.0)
        if isa(varargin{1.0}, 'axisobj')
            axobj = varargin{1.0};
            set(axobj, varargin{2.0:end});
            return;
        else
            ax = varargin{1.0};
        end % if
    else
        ax = varargin{1.0};
        % 27 28
        if any(ishandle(ax)) && strcmp(get(ax, 'type'), 'axes')
            set(ax, varargin{2.0:end});
        else
            ax = axes;
            set(ax, varargin{:});
        end % if
    end % if
    % 35 36
    fig = get(ax, 'Parent');
    HGObj = scribehgobj(ax);
    HGObj = set(HGObj, 'Draggable', 0.0);
    % 39 40
    LAddContextMenu(ax, fig);
    % 41 42
    axobj.Class = 'axisobj';
    axobj.Notes = [];
    axobj.FigObj = figobj(fig);
    axobj.ZoomScale = 1.0;
    % 46 47
    axobj = class(axobj, 'axisobj', HGObj);
    scribehandle(axobj);
end % function
function u = LAddContextMenu(HG, fig)
    % 51 52
    u = findall(fig, 'Tag', 'ScribeAxisObjContextMenu');
    % 53 55
    % 54 55
    if any(ishandle(u))
        % 56 57
        setscribecontextmenu(HG, u);
    else
        u = uicontextmenu('Parent', fig, 'Serializable', 'off', 'HandleVisibility', 'off', 'Callback', 'domymenu update', 'Tag', 'ScribeAxisObjContextMenu');
        % 60 66
        % 61 66
        % 62 66
        % 63 66
        % 64 66
        % 65 66
        setscribecontextmenu(HG, u);
        % 67 69
        % 68 69
        ucut = uimenu('Label', 'Cu&t', 'Callback', 'domymenu cut', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjCutMenu');
        % 70 75
        % 71 75
        % 72 75
        % 73 75
        % 74 75
        ucopy = uimenu('Label', '&Copy', 'Callback', 'domymenu copy', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjCopyMenu');
        % 76 81
        % 77 81
        % 78 81
        % 79 81
        % 80 81
        upaste = uimenu('Label', '&Paste', 'Callback', 'domymenu paste', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjPasteMenu');
        % 82 87
        % 83 87
        % 84 87
        % 85 87
        % 86 87
        uclear = uimenu('Label', 'Clea&r', 'Callback', 'domymenu clear', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjClearMenu');
        % 88 94
        % 89 94
        % 90 94
        % 91 94
        % 92 94
        % 93 94
        u1 = uimenu('Label', 'Show Legend', 'Callback', 'domymenu showlegend', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjShowLegendMenu');
        % 95 101
        % 96 101
        % 97 101
        % 98 101
        % 99 101
        % 100 101
        u2 = uimenu('Label', 'Lock Position', 'Callback', 'domymenu moveresize', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxisObjMoveResizeMenu');
        % 102 115
        % 103 115
        % 104 115
        % 105 115
        % 106 115
        % 107 115
        % 108 115
        % 109 115
        % 110 115
        % 111 115
        % 112 115
        % 113 115
        % 114 115
        u4 = uimenu('Label', 'Properties...', 'Callback', 'domymenu more', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxischildObjMoreMenu');
        % 116 122
        % 117 122
        % 118 122
        % 119 122
        % 120 122
        % 121 122
    end % if
end % function
