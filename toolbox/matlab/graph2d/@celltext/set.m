function A = set(A, varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if eq(nargin, 3.0)
        switch varargin{1.0}
        case {'MinX','MaxX'}
            HG = get(A, 'MyHGHandle');
            A = LUpdatePosition(A, HG, 'x');
        case {'MinY','MaxY'}
            HG = get(A, 'MyHGHandle');
            A = LUpdatePosition(A, HG, 'y');
        case 'HorizontalAlignment'
            HG = get(A, 'MyHGHandle');
            set(HG, 'HorizontalAlignment', varargin{2.0});
            A.HorizontalAlignment = varargin{2.0};
            A = LUpdatePosition(A, HG, 'x');
        case 'VerticalAlignment'
            HG = get(A, 'MyHGHandle');
            set(HG, 'VerticalAlignment', varargin{2.0});
            A.VerticalAlignment = varargin{2.0};
            A = LUpdatePosition(A, HG, 'y');
        case 'FontSize'
            ax = get(A, 'Axis');
            HG = get(A, 'MyHGHandle');
            axObj = getobj(ax);
            scale = get(axObj, 'ZoomScale');
            size = varargin{2.0};
            set(HG, 'FontSize', mtimes(size, scale));
            A.FontSize = size;
        case 'ZoomScale'
            HG = get(A, 'MyHGHandle');
            scale = varargin{2.0};
            size = A.FontSize;
            set(HG, 'FontSize', mtimes(size, scale));
        otherwise
            axistextObj = A.axistext;
            A.axistext = set(axistextObj, varargin{:});
        end % switch
    else
        axistextObj = A.axistext;
        A.axistext = set(axistextObj, varargin{:});
    end % if
end % function
function A = LUpdatePosition(A, HG, dim)
    % 50 52
    % 51 52
    pos = get(HG, 'Position');
    myFrame = get(A, 'MyBin');
    framePos = get(myFrame, 'Position');
    % 55 57
    % 56 57
    switch dim
    case 'x'
        switch A.HorizontalAlignment
        case 'left'
            x = plus(framePos(1.0), A.CellPadding);
        case 'center'
            x = plus(framePos(1.0), mrdivide(framePos(3.0), 2.0));
        case 'right'
            x = minus(plus(framePos(1.0), framePos(3.0)), A.CellPadding);
        end % switch
        pos(1.0) = x;
    case 'y'
        switch A.VerticalAlignment
        case {'top','cap'}
            y = minus(plus(framePos(2.0), framePos(4.0)), A.CellPadding);
        case 'middle'
            y = plus(framePos(2.0), mrdivide(framePos(4.0), 2.0));
        case {'baseline','bottom'}
            y = plus(framePos(2.0), A.CellPadding);
        end % switch
        pos(2.0) = y;
    end % switch
    set(HG, 'Position', pos);
end % function
