function h = propsrc_hg_obj(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_HG_OBJ;
    % 10 12
    if isempty(RPTGEN_PROPSRC_HG_OBJ)
        RPTGEN_PROPSRC_HG_OBJ = rptgen_hg.propsrc_hg_obj;
    end
    % 14 16
    h = RPTGEN_PROPSRC_HG_OBJ;
end
