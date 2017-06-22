function h = propsrc_hg_fig(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_HG_FIG;
    % 10 12
    if isempty(RPTGEN_PROPSRC_HG_FIG)
        RPTGEN_PROPSRC_HG_FIG = rptgen_hg.propsrc_hg_fig(varargin{:});
    end
    % 14 16
    h = RPTGEN_PROPSRC_HG_FIG;
end
