function slr = rect(varargin)
    % 1 21
    % 2 21
    % 3 21
    % 4 21
    % 5 21
    % 6 21
    % 7 21
    % 8 21
    % 9 21
    % 10 21
    % 11 21
    % 12 21
    % 13 21
    % 14 21
    % 15 21
    % 16 21
    % 17 21
    % 18 21
    % 19 21
    slr = Simulink.rect;
    % 21 23
    switch nargin
    case 0.0
        % 24 26
        slr.left = 0.0;
        slr.top = 0.0;
        slr.right = 0.0;
        slr.bottom = 0.0;
    case 1.0
        % 30 33
        % 31 33
        r = varargin{1.0};
        if isa(r, 'Simulink.rect')
            slr = r;
        else
            LocalCheckArgs(r);
            % 37 39
            slr.left = r(1.0);
            slr.top = r(2.0);
            slr.right = r(3.0);
            slr.bottom = r(4.0);
        end % if
    case 2.0
        % 44 46
        p1 = varargin{1.0};
        p2 = varargin{2.0};
        r = horzcat(ctranspose(p1(:)), ctranspose(p2(:)));
        LocalCheckArgs(r);
        % 49 51
        slr.left = r(1.0);
        slr.top = r(2.0);
        slr.right = r(3.0);
        slr.bottom = r(4.0);
    case 4.0
        % 55 58
        % 56 58
        r = horzcat(varargin{:});
        LocalCheckArgs(varargin{:});
        % 59 61
        slr.left = r(1.0);
        slr.top = r(2.0);
        slr.right = r(3.0);
        slr.bottom = r(4.0);
    otherwise
        % 65 67
        LocalCheckArgs(varargin{:});
        % 67 69
    end % switch
function LocalCheckArgs(varargin)
    % 70 80
    % 71 80
    % 72 80
    % 73 80
    % 74 80
    % 75 80
    % 76 80
    % 77 80
    % 78 80
    if eq(length(varargin), 4.0)
        r = horzcat(varargin{:});
    else
        r = varargin{:};
    end % if
    % 84 86
    if ne(length(r), 4.0)
        error('The template rectangle must be a vector of length 4');
    end % if
