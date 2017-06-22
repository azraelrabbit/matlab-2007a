function h = propsrc_sl_annotation(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_SL_ANNOTATION;
    % 10 12
    if isempty(RPTGEN_PROPSRC_SL_ANNOTATION)
        RPTGEN_PROPSRC_SL_ANNOTATION = feval(mfilename('class'));
    end
    % 14 16
    h = RPTGEN_PROPSRC_SL_ANNOTATION;
end
