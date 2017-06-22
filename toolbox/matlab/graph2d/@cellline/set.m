function A = set(A, varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    if eq(nargin, 3.0)
        switch varargin{1.0}
        case {'MinX','MaxX'}
            A = LUpdatePosition(A, 'x');
        case {'MinY','MaxY'}
            A = LUpdatePosition(A, 'y');
        case 'LowerChild'
            A.LowerChild = varargin{2.0};
            if isa(A.LowerChild, 'framerect')
                set(A.LowerChild, 'MaxLine', get(A, 'MyHandle'));
            end % if
        case 'UpperChild'
            A.UpperChild = varargin{2.0};
            if isa(A.UpperChild, 'framerect')
                set(A.UpperChild, 'MaxLine', get(A, 'MyHandle'));
            end % if
        otherwise
            axischildObj = A.axischild;
            A.axischild = set(axischildObj, varargin{:});
        end % switch
    else
        axischildObj = A.axischild;
        A.axischild = set(axischildObj, varargin{:});
    end % if
function A = LUpdatePosition(A, dim)
    % 34 39
    % 35 39
    % 36 39
    % 37 39
    myFrame = get(A, 'MyBin');
    framePos = get(myFrame, 'Position');
    % 40 42
    switch dim
    case 'x'
        if strcmp(A.Orientation, 'horizontal')
            A = set(A, 'XData', horzcat(framePos(1.0), plus(framePos(1.0), framePos(3.0))));
        end % if
    case 'y'
        if strcmp(A.Orientation, 'vertical')
            A = set(A, 'YData', horzcat(framePos(2.0), plus(framePos(2.0), framePos(4.0))));
        end % if
    end % switch
