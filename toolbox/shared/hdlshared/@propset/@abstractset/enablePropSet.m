function enablePropSet(h, varargin)
    % 1 16
    % 2 16
    % 3 16
    % 4 16
    % 5 16
    % 6 16
    % 7 16
    % 8 16
    % 9 16
    % 10 16
    % 11 16
    % 12 16
    % 13 16
    % 14 16
    % 15 16
    if gt(nargin, 1.0) && ischar(varargin{1.0})
        % 17 20
        % 18 20
        % 19 20
        name = varargin{1.0};
        if lt(nargin, 3.0)
            ena = true;
        else
            ena = varargin{2.0};
        end % if
        h.prop_set_enables(h.getPropSetIdx(name)) = ena;
    else
        % 28 31
        % 29 31
        % 30 31
        if lt(nargin, 2.0)
            ena = true;
        else
            ena = varargin{1.0};
        end % if
        h.prop_set_enables(:) = ena;
    end % if
end % function
