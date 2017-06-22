function val = get(A, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    HGObj = A.axischild;
    % 9 10
    if eq(nargin, 2.0)
        switch varargin{1.0}
        case 'XData'
            val = get(HGObj, 'Position');
            val = val(1.0);
        case 'YData'
            val = get(HGObj, 'Position');
            val = val(2.0);
        otherwise
            val = get(HGObj, varargin{:});
        end % switch
    else
        val = get(HGObj, varargin{:});
    end % if
end % function
