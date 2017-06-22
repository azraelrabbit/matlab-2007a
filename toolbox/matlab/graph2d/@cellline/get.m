function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'LowerChild'
            val = A.LowerChild;
        case 'UpperChild'
            val = A.UpperChild;
        case 'Position'
            HG = get(A, 'MyHGHandle');
            xdata = get(HG, 'XData');
            ydata = get(HG, 'YData');
            minx = min(xdata);
            miny = min(ydata);
            maxx = max(xdata);
            maxy = max(ydata);
            val = horzcat(minx, miny, minus(maxx, minx), minus(maxy, miny));
        otherwise
            val = get(A.axischild, varargin{:});
        end % switch
    else
        val = get(A.axischild, varargin{:});
    end % if
end % function
