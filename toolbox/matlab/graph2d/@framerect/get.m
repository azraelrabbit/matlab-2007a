function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    theHGBin = A.hgbin;
    % 9 10
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'MaxLine'
            val = A.MaxLine;
        case 'MinLine'
            val = A.MinLine;
        case 'MinWidth'
            val = A.MinWidth;
        case 'Figure'
            HG = get(A, 'MyHGHandle');
            AX = get(HG, 'Parent');
            val = get(AX, 'Parent');
        case 'Axis'
            HG = get(A, 'MyHGHandle');
            val = get(HG, 'Parent');
        case 'Position'
            HG = get(A, 'MyHGHandle');
            X = get(HG, 'XData');
            Y = get(HG, 'YData');
            val = horzcat(min(X), min(Y), minus(max(X), min(X)), minus(max(Y), min(Y)));
        case 'MinX'
            HG = get(A, 'MyHGHandle');
            val = min(get(HG, 'XData'));
        case 'MaxX'
            HG = get(A, 'MyHGHandle');
            val = max(get(HG, 'XData'));
        case 'MinY'
            HG = get(A, 'MyHGHandle');
            val = min(get(HG, 'YData'));
        case 'MaxY'
            HG = get(A, 'MyHGHandle');
            val = max(get(HG, 'YData'));
        otherwise
            val = get(theHGBin, varargin{:});
        end % switch
    else
        val = get(theHGBin, varargin{:});
    end % if
end % function
