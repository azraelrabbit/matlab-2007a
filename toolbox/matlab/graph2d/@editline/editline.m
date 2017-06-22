function A = editline(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    switch nargin
    case 0.0
        A.Class = 'editline';
        A.blank = [];
        A = class(A, 'editline', axischild);
        return;
    case 1.0
        l = varargin{1.0};
    otherwise
        l = line(varargin);
    end % switch
    % 20 21
    if not(any(ishandle(l)))
        % 22 23
        error('MATLAB:editline:InvalidHandle', 'argument is not a valid HG handle');
    end % if
    % 25 26
    axischildObj = axischild(l);
    A.Class = 'editline';
    A.blank = 1.0;
    % 29 30
    A = class(A, 'editline', axischildObj);
    AH = scribehandle(A);
    % 32 33
    fig = ancestor(l, 'Figure');
    u = findall(fig, 'Tag', 'ScribeEditlineObjContextMenu');
    % 35 37
    % 36 37
    if any(ishandle(u))
        % 38 39
        setscribecontextmenu(l, u(1.0));
    else
        u = uicontextmenu('Parent', fig, 'Serializable', 'off', 'HandleVisibility', 'off', 'Callback', 'domymenu update', 'Tag', 'ScribeEditlineObjContextMenu');
        % 42 48
        % 43 48
        % 44 48
        % 45 48
        % 46 48
        % 47 48
        setscribecontextmenu(l, u);
        % 49 51
        % 50 51
        ucut = uimenu('Label', 'Cu&t', 'Callback', 'domymenu cut', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjCutMenu');
        % 52 57
        % 53 57
        % 54 57
        % 55 57
        % 56 57
        ucopy = uimenu('Label', '&Copy', 'Callback', 'domymenu copy', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjCopyMenu');
        % 58 63
        % 59 63
        % 60 63
        % 61 63
        % 62 63
        upaste = uimenu('Label', '&Paste', 'Callback', 'domymenu paste', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjPasteMenu');
        % 64 69
        % 65 69
        % 66 69
        % 67 69
        % 68 69
        uclear = uimenu('Label', 'Clea&r', 'Callback', 'domymenu clear', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjClearMenu');
        % 70 76
        % 71 76
        % 72 76
        % 73 76
        % 74 76
        % 75 76
        u1 = uimenu('Label', 'Line &Width', 'Callback', 'domymenu size', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjSizeMenu');
        % 77 83
        % 78 83
        % 79 83
        % 80 83
        % 81 83
        % 82 83
        u2 = uimenu('Label', 'Line &Style', 'Callback', 'domymenu style', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjStyleMenu');
        % 84 89
        % 85 89
        % 86 89
        % 87 89
        % 88 89
        u3 = uimenu('Label', 'Color...', 'Callback', 'domymenu color', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjColorMenu');
        % 90 96
        % 91 96
        % 92 96
        % 93 96
        % 94 96
        % 95 96
        u4 = uimenu('Label', 'Properties...', 'Callback', 'domymenu more', 'Separator', 'on', 'Parent', u, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjMoreMenu');
        % 97 104
        % 98 104
        % 99 104
        % 100 104
        % 101 104
        % 102 104
        % 103 104
        u10 = uimenu('Label', '0.5', 'Callback', 'domymenu size 0.5', 'Parent', u1, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjSizeMenu0.5');
        % 105 110
        % 106 110
        % 107 110
        % 108 110
        % 109 110
        sizes = [1.0 2.0 3.0 4.0 5.0 6.0 7.0 8.0 9.0 10.0];
        for i=1.0:length(sizes)
            val = num2str(sizes(i));
            uimenu('Label', val, 'Callback', horzcat('domymenu size ', val), 'Parent', u1, 'HandleVisibility', 'off', 'Tag', horzcat('ScribeEditlineObjSizeMenu', val));
            % 114 119
            % 115 119
            % 116 119
            % 117 119
            % 118 119
        end % for
        u1more = uimenu('Label', 'more...', 'Callback', 'domymenu more', 'Parent', u1, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjSizeMenuMore');
        % 121 128
        % 122 128
        % 123 128
        % 124 128
        % 125 128
        % 126 128
        % 127 128
        u21 = uimenu('Label', 'solid', 'Callback', 'domymenu style solid', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjStyleMenuSolid');
        % 129 134
        % 130 134
        % 131 134
        % 132 134
        % 133 134
        u22 = uimenu('Label', 'dash', 'Callback', 'domymenu style dash', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjStyleMenuDash');
        % 135 140
        % 136 140
        % 137 140
        % 138 140
        % 139 140
        u23 = uimenu('Label', 'dot', 'Callback', 'domymenu style dot', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjStyleMenuDot');
        % 141 146
        % 142 146
        % 143 146
        % 144 146
        % 145 146
        u24 = uimenu('Label', 'dash-dot', 'Callback', 'domymenu style dashdot', 'Parent', u2, 'HandleVisibility', 'off', 'Tag', 'ScribeEditlineObjStyleMenuDashDot');
        % 147 153
        % 148 153
        % 149 153
        % 150 153
        % 151 153
        % 152 153
    end % if
end % function
