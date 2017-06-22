function handleStruct = sigbuilder_beveled_frame(fig, pos, style, frameH)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    if lt(nargin, 3.0)
        style = 'NarrowTrans';
    end % if
    % 13 14
    if lt(nargin, 4.0)
        frameH = [];
    end % if
    % 17 18
    switch style
    case 'NarrowTrans'
        isWide = 0.0;
        isOpaque = 0.0;
    case 'NarrowOpaq'
        isWide = 0.0;
        isOpaque = 1.0;
    case 'WideTrans'
        isWide = 1.0;
        isOpaque = 0.0;
    case 'WideOpaq'
        isWide = 1.0;
        isOpaque = 1.0;
    end % switch
    % 32 34
    % 33 34
    lineWidth = 1.0;
    lineHeight = 1.0;
    % 36 37
    DefaultUIColor = [.502 .502 .502];
    FocusColor = [.502 .502 .502];
    NormalColor = [0.0 0.0 0.0];
    AntiqueWhite = [1.0 .9608 .8842];
    DropColor = [0.0 0.0 0.0];
    DragColor = [.502 .502 .502];
    IcedColor = [.725 .725 .725];
    White = [1.0 1.0 1.0];
    Black = [0.0 0.0 0.0];
    Light = [.725 .725 .725];
    LightGrey = [.9 .9 .9];
    Dark = [.502 .502 .502];
    % 49 53
    % 50 53
    % 51 53
    % 52 53
    figUnits = get(fig, 'Units');
    switch figUnits
    case 'points'
        % 56 57
        screenUnits = get(0.0, 'Units');
        set(0.0, 'Units', 'points');
        pointSize = get(0.0, 'ScreenSize');
        set(0.0, 'Units', 'pixels');
        pixelsSize = get(0.0, 'ScreenSize');
        set(0.0, 'Units', screenUnits);
        % 63 64
        pixels2points = rdivide(pointSize, pixelsSize);
        pixels2points = mean(pixels2points(3.0:4.0));
        % 66 67
        lineWidth = mtimes(lineWidth, pixels2points);
        lineHeight = mtimes(lineHeight, pixels2points);
    case 'pixels'
    otherwise
        % 71 72
        error('Units must be pixels or points');
    end % switch
    % 74 77
    % 75 77
    % 76 77
    leftOuter = horzcat(pos(1.0), pos(2.0), lineWidth, pos(4.0));
    % 78 82
    % 79 82
    % 80 82
    % 81 82
    topOuter = horzcat(pos(1.0), minus(plus(pos(2.0), pos(4.0)), lineHeight), pos(3.0), lineHeight);
    % 83 87
    % 84 87
    % 85 87
    % 86 87
    bottomOuter = horzcat(plus(pos(1.0), lineWidth), pos(2.0), minus(pos(3.0), lineWidth), lineHeight);
    % 88 92
    % 89 92
    % 90 92
    % 91 92
    rightOuter = horzcat(minus(plus(pos(1.0), pos(3.0)), lineWidth), pos(2.0), lineWidth, minus(pos(4.0), lineHeight));
    % 93 98
    % 94 98
    % 95 98
    % 96 98
    % 97 98
    leftInner = horzcat(plus(pos(1.0), lineWidth), plus(pos(2.0), lineHeight), lineWidth, minus(pos(4.0), mtimes(2.0, lineHeight)));
    % 99 103
    % 100 103
    % 101 103
    % 102 103
    topInner = horzcat(plus(pos(1.0), lineWidth), minus(plus(pos(2.0), pos(4.0)), mtimes(2.0, lineHeight)), minus(pos(3.0), mtimes(2.0, lineWidth)), lineHeight);
    % 104 108
    % 105 108
    % 106 108
    % 107 108
    bottomInner = horzcat(plus(pos(1.0), mtimes(2.0, lineWidth)), plus(pos(2.0), lineHeight), minus(pos(3.0), mtimes(3.0, lineWidth)), lineHeight);
    % 109 113
    % 110 113
    % 111 113
    % 112 113
    rightInner = horzcat(minus(plus(pos(1.0), pos(3.0)), mtimes(2.0, lineWidth)), plus(pos(2.0), lineHeight), lineWidth, minus(pos(4.0), mtimes(3.0, lineHeight)));
    % 114 118
    % 115 118
    % 116 118
    % 117 118
    if isWide
        framePos = plus(plus(pos, mtimes([2.0 0.0 -4.0 0.0], lineWidth)), mtimes([0.0 2.0 0.0 -4.0], lineHeight));
        outerDark = Black;
        outerLight = Light;
    else
        framePos = plus(plus(pos, mtimes([1.0 0.0 -2.0 0.0], lineWidth)), mtimes([0.0 1.0 0.0 -2.0], lineHeight));
        outerDark = Dark;
        outerLight = White;
    end % if
    % 127 129
    % 128 129
    if isOpaque
        if not(isempty(frameH))
            handleStruct.frame = frameH;
            set(frameH, 'BackgroundColor', LightGrey, 'ForegroundColor', LightGrey, 'Units', figUnits, 'Position', framePos, 'Style', 'frame');
        else
            % 134 138
            % 135 138
            % 136 138
            % 137 138
            % 138 139
            handleStruct.frame = uicontrol('Parent', fig, 'BackgroundColor', LightGrey, 'ForegroundColor', LightGrey, 'Units', figUnits, 'Position', framePos, 'Style', 'frame');
            % 140 145
            % 141 145
            % 142 145
            % 143 145
            % 144 145
        end % if
        % 146 147
    end % if
    % 148 149
    handleStruct.left = uicontrol('Parent', fig, 'BackgroundColor', outerDark, 'Units', figUnits, 'Position', leftOuter, 'Style', 'text');
    % 150 155
    % 151 155
    % 152 155
    % 153 155
    % 154 155
    handleStruct.top = uicontrol('Parent', fig, 'BackgroundColor', outerDark, 'Units', figUnits, 'Position', topOuter, 'Style', 'text');
    % 156 162
    % 157 162
    % 158 162
    % 159 162
    % 160 162
    % 161 162
    handleStruct.right = uicontrol('Parent', fig, 'BackgroundColor', outerLight, 'Units', figUnits, 'Position', rightOuter, 'Style', 'text');
    % 163 168
    % 164 168
    % 165 168
    % 166 168
    % 167 168
    handleStruct.bottom = uicontrol('Parent', fig, 'BackgroundColor', outerLight, 'Units', figUnits, 'Position', bottomOuter, 'Style', 'text');
    % 169 175
    % 170 175
    % 171 175
    % 172 175
    % 173 175
    % 174 175
    if isWide
        % 176 177
        handleStruct.leftInner = uicontrol('Parent', fig, 'BackgroundColor', Dark, 'Units', figUnits, 'Position', leftInner, 'Style', 'text');
        % 178 183
        % 179 183
        % 180 183
        % 181 183
        % 182 183
        handleStruct.topInner = uicontrol('Parent', fig, 'BackgroundColor', Dark, 'Units', figUnits, 'Position', topInner, 'Style', 'text');
        % 184 190
        % 185 190
        % 186 190
        % 187 190
        % 188 190
        % 189 190
        handleStruct.rightInner = uicontrol('Parent', fig, 'BackgroundColor', White, 'Units', figUnits, 'Position', rightInner, 'Style', 'text');
        % 191 196
        % 192 196
        % 193 196
        % 194 196
        % 195 196
        handleStruct.bottomInner = uicontrol('Parent', fig, 'BackgroundColor', White, 'Units', figUnits, 'Position', bottomInner, 'Style', 'text');
        % 197 201
        % 198 201
        % 199 201
        % 200 201
    end % if
end % function
