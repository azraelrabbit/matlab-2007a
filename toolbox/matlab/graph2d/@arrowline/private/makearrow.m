function [fullh, h, arrowh, hscale, vscale] = makearrow(x, y, varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    switch nargin
    case 1.0
        redrawArrows(x);
        return;
    case 3.0
        % 11 14
        % 12 14
        fullline = x;
        lineHandle = y;
        arrowhead = varargin{1.0};
        fRebuild = 0.0;
    otherwise
        fRebuild = 1.0;
    end % switch
    % 20 23
    % 21 23
    aSize = 10.0;
    aStyle = 'Solid';
    % 24 26
    newVarargin = {};
    % 26 28
    if gt(nargin, 2.0) && fRebuild
        % 28 30
        ind1 = 1.0;
        ind2 = 1.0;
        % 31 33
            while le(ind1, length(varargin))
            % 33 35
            Param = varargin{ind1};
            if gt(length(varargin), ind1)
                Value = varargin{plus(ind1, 1.0)};
            else
                newVarargin{ind2} = Param;
                break
            end % if
            % 41 43
            switch lower(Param)
            case {'arrowsize','arrowsi'}
                aSize = Value;
            case {'arrowstyle','arrowst'}
                aStyle = Value;
            otherwise
                newVarargin{ind2} = Param;
                ind2 = plus(ind2, 1.0);
                newVarargin{ind2} = Value;
                ind2 = plus(ind2, 1.0);
            end % switch
            ind1 = plus(ind1, 2.0);
        end % while
    end % if
    % 56 59
    % 57 59
    if fRebuild
        % 59 61
        fullline = graph2d.arrow('XData', x, 'YData', y, 'CreateFcn', '', newVarargin{:});
        parentAxis = get(fullline, 'Parent');
        lineHandle = line(x, y, 'CreateFcn', '', newVarargin{:}, 'HandleVisibility', 'off');
        set(fullline, 'LineHandle', lineHandle);
    else
        set(lineHandle, 'HandleVisibility', 'off');
        parentAxis = get(fullline, 'Parent');
    end % if
    % 68 70
    setappdata(lineHandle, 'ScribeButtonDownFcn', 'doclick');
    setappdata(lineHandle, 'ScribeButtonDownHGObj', double(fullline));
    set(fullline, 'LineStyle', 'none');
    % 72 75
    % 73 75
    [vertScale, horizScale] = dataToPoints(parentAxis);
    % 75 78
    % 76 78
    [aX, aY] = buildArrow(lineHandle, fullline, horizScale, vertScale, aSize, aStyle);
    % 78 81
    % 79 81
    if fRebuild
        arrowhead = addArrow(aX, aY, lineHandle, fullline, aSize, aStyle);
    else
        % 83 85
        % 84 86
        arrowhead = addArrow(aX, aY, lineHandle, fullline, aSize, aStyle, arrowhead);
        % 86 88
    end % if
    % 88 90
    try
        set(handle(fullline), 'HeadHandle', arrowhead);
        % 91 93
    end % try
    % 93 97
    % 94 97
    % 95 97
    switch nargout
    case 2.0
        fullh = double(fullline);
        h = lineHandle;
    case 3.0
        fullh = double(fullline);
        h = lineHandle;
        arrowh = arrowhead;
    case 5.0
        fullh = double(fullline);
        h = lineHandle;
        arrowh = arrowhead;
        vscale = vertScale;
        hscale = horizScale;
    end % switch
end % function
function [vscale, hscale] = dataToPoints(axH)
    % 113 117
    % 114 117
    % 115 117
    oldUnits = get(axH, 'Units');
    set(axH, 'Units', 'points');
    Pos = get(axH, 'Position');
    set(axH, 'Units', oldUnits);
    vscale = mrdivide(1.0, Pos(4.0));
    hscale = mrdivide(1.0, Pos(3.0));
end % function
function [xt, yt] = buildArrow(lh, fh, hscale, vscale, ah, sty)
    % 124 127
    % 125 127
    if lt(nargin, 5.0)
        sty = 'solid';
    end % if
    % 129 131
    if lt(nargin, 4.0)
        ah = 16.0;
    end % if
    % 133 136
    % 134 136
    lw = get(lh, 'LineWidth');
    if iscell(lw)
        lw = lw{end};
    end % if
    % 139 142
    % 140 142
    ah = mrdivide(mtimes(ah, lw), 2.0);
    ah = max(ah, 6.0);
    % 143 145
    X = get(fh, 'XData');
    Y = get(fh, 'YData');
    % 146 148
    x1 = X(minus(end, 1.0));
    x2 = X(end);
    y1 = Y(minus(end, 1.0));
    y2 = Y(end);
    % 151 154
    % 152 154
    xl = mrdivide(minus(x2, x1), hscale);
    yl = mrdivide(minus(y2, y1), vscale);
    hy = mpower(plus(mpower(xl, 2.0), mpower(yl, 2.0)), .5);
    % 156 159
    % 157 159
    co = mrdivide(xl, hy);
    si = mrdivide(yl, hy);
    % 160 164
    % 161 164
    % 162 164
    hlx2 = minus(x2, mtimes(mtimes(ah, co), hscale));
    hly2 = minus(y2, mtimes(mtimes(ah, si), vscale));
    % 165 167
    set(lh, 'XData', horzcat(x1, hlx2), 'YData', horzcat(y1, hly2));
    % 167 170
    % 168 170
    aw = mtimes(ah, .66);
    % 170 173
    % 171 173
    if strcmpi(sty, 'solid') || strcmpi(sty, 'hollow')
        xt = horzcat(uminus(ah), uminus(ah), 0.0, uminus(ah), uminus(ah));
        yt = horzcat(0.0, mrdivide(aw, 2.0), 0.0, mrdivide(uminus(aw), 2.0), 0.0);
    else
        if strcmpi(sty, 'line')
            xt = horzcat(uminus(ah), 0.0, uminus(ah));
            yt = horzcat(mrdivide(aw, 2.0), 0.0, mrdivide(uminus(aw), 2.0));
        else
            error('MATLAB:makearrow:UnknownStyle', 'Unknown arrow style %s', sty);
        end % if
        % 182 185
        % 183 185
    end % if
    foo = mtimes(vertcat(horzcat(co, uminus(si)), horzcat(si, co)), vertcat(xt, yt));
    % 186 188
    xt = plus(mtimes(foo(1.0, :), hscale), x2);
    yt = plus(mtimes(foo(2.0, :), vscale), y2);
end % function
function redrawArrows(hscale, vscale)
    % 191 197
    % 192 197
    % 193 197
    % 194 197
    % 195 197
    if eq(nargin, 1.0)
        arrows = hscale;
    else
        arrows = findall(gcbf, 'Tag', 'ScribeArrowlineHead');
    end % if
    % 201 205
    % 202 205
    % 203 205
    for i=1.0:length(arrows)
        thisArrow = arrows(i);
        if lt(nargin, 2.0)
            % 207 209
            [vscale, hscale] = dataToPoints(get(thisArrow, 'Parent'));
        end % if
        ud = getappdata(thisArrow, 'ScribeArrowData');
        % 211 216
        % 212 216
        % 213 216
        % 214 216
        if not(any(ishandle(ud{1.0})))
            delete(thisArrow)
        else
            [aX, aY] = buildArrow(ud{1.0}, ud{4.0}, hscale, vscale, ud{2.0}, ud{3.0});
            set(thisArrow, 'xdata', aX, 'ydata', aY);
        end % if
    end % for
end % function
function arrowhead = addArrow(ax, ay, lh, fh, siz, sty, varargin)
    % 224 227
    % 225 227
    if eq(nargin, 7.0)
        fRebuild = 0.0;
        arrowhead = varargin{1.0};
    else
        fRebuild = 1.0;
    end % if
    % 232 234
    color = get(lh, 'color');
    parent = get(lh, 'Parent');
    if iscell(color)
        color = color{end};
    end % if
    % 238 241
    % 239 241
    if strcmpi(sty, 'solid') || strcmpi(sty, 'hollow')
        % 241 243
        if strcmpi(sty, 'hollow')
            fillColor = get(parent, 'Color');
        else
            fillColor = color;
        end % if
        % 247 249
        arrowProps = struct('XData', ax, 'YData', ay, 'FaceColor', fillColor, 'EdgeColor', color, 'Tag', 'ScribeArrowlineHead', 'CreateFcn', '', 'HandleVisibility', 'off', 'Parent', parent);
        % 249 258
        % 250 258
        % 251 258
        % 252 258
        % 253 258
        % 254 258
        % 255 258
        % 256 258
        if fRebuild
            arrowhead = patch(ax, ay, fillColor, arrowProps);
        else
            set(arrowhead, arrowProps);
        end % if
        setappdata(arrowhead, 'ScribeArrowData', cellhorzcat(lh, siz, sty, fh));
        setappdata(arrowhead, 'ScribeButtonDownHGObj', double(fh));
        setappdata(arrowhead, 'ScribeButtonDownFcn', 'doclick');
        % 265 267
        setappdata(arrowhead, 'NoDither', 'on');
    else
        if strcmpi(sty, 'line')
            % 269 271
            arrowProps = struct('XData', ax, 'YData', ay, 'Color', color, 'Tag', 'ScribeArrowlineHead', 'CreateFcn', '', 'Parent', parent);
            % 271 278
            % 272 278
            % 273 278
            % 274 278
            % 275 278
            % 276 278
            if fRebuild
                arrowhead = line(ax, ay, color, arrowProps);
            else
                set(arrowhead, arrowProps);
            end % if
            setappdata(arrowhead, 'ScribeArrowData', cellhorzcat(lh, siz, sty, fh));
            setappdata(arrowhead, 'ScribeButtonDownHGObj', fh);
            setappdata(arrowhead, 'ScribeButtonDownFcn', 'doclick');
        else
            % 286 288
            arrowhead = [];
            error('MATLAB:makearrow:StyleUnknown', 'Unknown arrow style %s', sty);
        end % if
    end % if
end % function
