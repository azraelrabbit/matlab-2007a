function idx = createBody(h, bodyDataSrc, varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    h.initIfNeeded;
    % 9 12
    % 10 12
    % 11 12
    b = Aero.Body;
    if eq(nargin, 3.0)
        srcType = varargin{1.0};
        b.load(bodyDataSrc, srcType);
    else
        b.load(bodyDataSrc);
    end % if
    b.generatePatches(get(h.Figure, 'CurrentAxes'));
    h.Bodies{plus(end, 1.0)} = b;
    % 21 22
    idx = numel(h.Bodies);
    % 23 24
end % function
