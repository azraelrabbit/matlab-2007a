function c = cml_variable(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    % 9 10
    pkgName = 'rptgen';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
