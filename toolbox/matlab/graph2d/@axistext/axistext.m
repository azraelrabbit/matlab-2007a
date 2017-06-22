function txtobj = axistext(x, y, str, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 0.0)
        txtobj.Class = 'axistext';
        txtobj.Notes = [];
        txtobj = class(txtobj, 'axistext', axischild);
        return;
    end % if
    % 14 15
    if eq(nargin, 1.0)
        HG = x;
        % 17 18
        if any(ishandle(getobj(HG)))
            return;
        end % if
    else
        HG = text(x, y, str);
        set(HG, varargin{:});
    end % if
    % 25 26
    axischildObj = axischild(HG);
    % 27 28
    axischildObj = set(axischildObj, 'DragConstraint', '');
    set(HG, 'CreateFcn', '');
    setappdata(HG, 'ScribeButtonDownFcn', 'doclick');
    % 31 32
    txtobj.Class = 'axistext';
    txtobj.Notes = [];
    % 34 35
    txtobj = class(txtobj, 'axistext', axischildObj);
    % 36 37
    fig = get(get(HG, 'Parent'), 'Parent');
    u = findall(fig, 'Tag', 'ScribeAxistextObjContextMenu');
    % 39 41
    % 40 41
    if any(ishandle(u))
        if gt(length(u), 1.0)
            warning('MATLAB:axistext:RedundantContext', 'redundant context menus...')
        end % if
        % 45 46
        setscribecontextmenu(HG, u(1.0));
    else
        u = uicontextmenu('Parent', fig, 'Serializable', 'off', 'HandleVisibility', 'off', 'Callback', 'domymenu update', 'Tag', 'ScribeAxistextObjContextMenu');
        % 49 56
        % 50 56
        % 51 56
        % 52 56
        % 53 56
        % 54 56
        % 55 56
        setscribecontextmenu(HG, u);
        % 57 58
        ucut = uimenu('Label', 'Cu&t', 'Callback', 'domymenu cut', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjCutMenu');
        % 59 64
        % 60 64
        % 61 64
        % 62 64
        % 63 64
        ucopy = uimenu('Label', '&Copy', 'Callback', 'domymenu copy', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjCopyMenu');
        % 65 70
        % 66 70
        % 67 70
        % 68 70
        % 69 70
        upaste = uimenu('Label', '&Paste', 'Callback', 'domymenu paste', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjPasteMenu');
        % 71 76
        % 72 76
        % 73 76
        % 74 76
        % 75 76
        uclear = uimenu('Label', 'Clea&r', 'Callback', 'domymenu clear', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjClearMenu');
        % 77 83
        % 78 83
        % 79 83
        % 80 83
        % 81 83
        % 82 83
        u0 = uimenu('Label', '&String...', 'Callback', 'domymenu string', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjStringMenu');
        % 84 90
        % 85 90
        % 86 90
        % 87 90
        % 88 90
        % 89 90
        u1 = uimenu('Label', '&Font Size', 'Callback', 'domymenu size', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjSizeMenu');
        % 91 96
        % 92 96
        % 93 96
        % 94 96
        % 95 96
        u2 = uimenu('Label', 'Font St&yle', 'Callback', 'domymenu style', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjStyleMenu');
        % 97 102
        % 98 102
        % 99 102
        % 100 102
        % 101 102
        u3 = uimenu('Label', 'Co&lor...', 'Callback', 'domymenu color', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjColorMenu');
        % 103 108
        % 104 108
        % 105 108
        % 106 108
        % 107 108
        u4 = uimenu('Label', '&Properties...', 'Callback', 'domymenu font', 'Enable', 'on', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjMoreMenu');
        % 109 117
        % 110 117
        % 111 117
        % 112 117
        % 113 117
        % 114 117
        % 115 117
        % 116 117
        sizes = [4.0 6.0 8.0 9.0 10.0 11.0 12.0 14.0 18.0 24.0 32.0];
        for i=1.0:length(sizes)
            val = num2str(sizes(i));
            uimenu('Label', val, 'Callback', horzcat('domymenu size ', val), 'Parent', u1, 'HandleVisibility', 'off', 'Tag', horzcat('ScribeEditlineObjSizeMenu', val));
            % 121 126
            % 122 126
            % 123 126
            % 124 126
            % 125 126
        end % for
        u1more = uimenu('Label', 'more...', 'Callback', 'domymenu font', 'Enable', 'on', 'Parent', u1, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjSizeMenuMore');
        % 128 135
        % 129 135
        % 130 135
        % 131 135
        % 132 135
        % 133 135
        % 134 135
        u21 = uimenu('Label', '&Normal', 'Callback', 'domymenu style normal', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjStyleMenuNormal');
        % 136 141
        % 137 141
        % 138 141
        % 139 141
        % 140 141
        u22 = uimenu('Label', '&Italic', 'Callback', 'domymenu style italic', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextdObjStyleMenuItalic');
        % 142 147
        % 143 147
        % 144 147
        % 145 147
        % 146 147
        u23 = uimenu('Label', '&Bold', 'Callback', 'domymenu style bold', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeAxistextObjStyleMenuBold');
        % 148 154
        % 149 154
        % 150 154
        % 151 154
        % 152 154
        % 153 154
    end % if
end % function
