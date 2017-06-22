function c = cfp_summ_table(varargin)
    % 1 7
    % 2 7
    % 3 7
    % 4 7
    % 5 7
    % 6 7
    pkgName = 'rptgen_fp';
    % 8 11
    % 9 11
    % 10 11
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
