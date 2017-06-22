function c = rpt_mdl_loop_options(varargin)
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
    c = rptgen_sl.rpt_mdl_loop_options;
    % 12 13
    if gt(rem(length(varargin), 2.0), 0.0)
        connect(c, varargin{1.0}, 'up');
        varargin = varargin(2.0:end);
    end % if
    set(c, varargin{:});
end % function
