function slr = offset(slr, varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    switch nargin
    case 2.0
        offVector = varargin{1.0};
        if eq(length(offVector), 1.0)
            hOffset = offVector(1.0);
            vOffset = offVector(1.0);
        else
            hOffset = offVector(1.0);
            vOffset = offVector(2.0);
        end % if
    case 3.0
        % 23 25
        hOffset = varargin{1.0};
        vOffset = varargin{2.0};
    otherwise
        % 27 29
        error('Invalid number of input arguments to OFFSET method');
    end % switch
    % 30 32
    slr.left = plus(slr.left, hOffset);
    slr.top = plus(slr.top, vOffset);
    slr.right = plus(slr.right, hOffset);
    slr.bottom = plus(slr.bottom, vOffset);
