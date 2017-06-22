function c = cud_name(varargin)
    % 1 12
    % 2 12
    % 3 12
    % 4 12
    % 5 12
    % 6 12
    % 7 12
    % 8 12
    % 9 12
    % 10 12
    % 11 12
    pkgName = 'rptgen_ud';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
