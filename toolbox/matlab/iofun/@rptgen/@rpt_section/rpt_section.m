function c = rpt_section(varargin)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    error('This class is abstract and can not be instantiated directly');
    % 10 12
    % 11 12
    pkgName = 'rptgen';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
