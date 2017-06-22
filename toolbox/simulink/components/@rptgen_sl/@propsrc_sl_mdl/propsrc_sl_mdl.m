function h = propsrc_sl_mdl(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_SL_MDL;
    % 10 12
    if isempty(RPTGEN_PROPSRC_SL_MDL)
        RPTGEN_PROPSRC_SL_MDL = feval(horzcat('rptgen_sl.', mfilename));
    end
    % 14 16
    h = RPTGEN_PROPSRC_SL_MDL;
end
