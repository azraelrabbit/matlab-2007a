function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    axistextObj = A.axistext;
    % 9 10
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'FontSize'
            val = A.FontSize;
        case 'Position'
            val = get(axistextObj, 'Extent');
        otherwise
            val = get(axistextObj, varargin{:});
        end % switch
    else
        val = get(axistextObj, varargin{:});
    end % if
end % function
