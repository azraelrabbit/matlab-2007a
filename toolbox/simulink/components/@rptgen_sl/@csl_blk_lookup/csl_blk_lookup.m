function c = csl_blk_lookup(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkgName = 'rptgen_sl';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
    % 13 14
    c.isCapture = false;
    c.isResizeFigure = 'manual';
    c.isInline = false;
end % function
