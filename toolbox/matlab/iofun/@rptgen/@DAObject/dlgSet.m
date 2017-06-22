function w = dlgSet(this, w, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    for i=1.0:2.0:minus(length(varargin), 1.0)
        w.(varargin{i}) = varargin{plus(i, 1.0)};
    end % for
end
