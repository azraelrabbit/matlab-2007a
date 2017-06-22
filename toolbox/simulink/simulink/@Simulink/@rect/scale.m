function slr = scale(slr, varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    switch nargin
    case 2.0
        scaleVector = varargin{1.0};
        if eq(length(scaleVector), 1.0)
            hScale = scaleVector(1.0);
            vScale = scaleVector(1.0);
        else
            hScale = scaleVector(1.0);
            vScale = scaleVector(2.0);
        end % if
    case 3.0
        % 21 23
        hScale = varargin{1.0};
        vScale = varargin{2.0};
    otherwise
        % 25 27
        error('Invalid number of input arguments to SCALE method');
        % 27 29
    end % switch
    % 29 31
    slr.left = mtimes(slr.left, hScale);
    slr.top = mtimes(slr.top, vScale);
    slr.right = mtimes(slr.right, hScale);
    slr.bottom = mtimes(slr.bottom, vScale);
