function val = get(aBin, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    if eq(nargin, 2.0)
        switch lower(varargin{1.0})
        case 'items'
            val = aBin.Items;
            return;
        end % switch
    end % if
    % 14 16
    if gt(nargin, 1.0)
        val = get(aBin.scribehgobj, varargin{:});
    else
        val = get(aBin.scribehgobj);
    end % if
