function c = cellcat(varargin)
    % 1 11
    % 2 11
    % 3 11
    % 4 11
    % 5 11
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    % 10 11
    n = sum(cellfun('prodofsize', varargin));
    c = cell(n, 1.0);
    count = 1.0;
    for i=1.0:nargin
        n = numel(varargin{i});
        c(count:minus(plus(count, n), 1.0)) = varargin{i}(:);
        count = plus(count, n);
    end % for
end % function
