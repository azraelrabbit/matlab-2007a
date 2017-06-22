function c = csf_obj_loop(varargin)
    % 1 13
    % 2 13
    % 3 13
    % 4 13
    % 5 13
    % 6 13
    % 7 13
    % 8 13
    % 9 13
    % 10 13
    % 11 13
    % 12 13
    pkgName = 'rptgen_sf';
    c = feval(horzcat(pkgName, '.', mfilename));
    c.init(varargin{:});
end % function
