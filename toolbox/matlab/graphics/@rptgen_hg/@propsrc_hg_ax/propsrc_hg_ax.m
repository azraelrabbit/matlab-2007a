function h = propsrc_hg_ax(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_HG_AX;
    % 10 12
    if isempty(RPTGEN_PROPSRC_HG_AX)
        RPTGEN_PROPSRC_HG_AX = rptgen_hg.propsrc_hg_ax;
    end
    % 14 16
    h = RPTGEN_PROPSRC_HG_AX;
end
