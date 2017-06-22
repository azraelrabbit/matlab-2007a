function c = cud_summ_table(varargin)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    pkgName = 'rptgen_ud';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
