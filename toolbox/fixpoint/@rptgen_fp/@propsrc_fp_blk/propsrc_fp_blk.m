function h = propsrc_fp_blk(varargin)
    % 1 10
    % 2 10
    % 3 10
    % 4 10
    % 5 10
    % 6 10
    % 7 10
    % 8 10
    persistent RPTGEN_PROPSRC_FP_BLK;
    % 10 12
    if isempty(RPTGEN_PROPSRC_FP_BLK)
        RPTGEN_PROPSRC_FP_BLK = feval(horzcat('rptgen_fp.', mfilename));
        % 13 15
        RPTGEN_PROPSRC_FP_BLK.PropertyListeners = makeModelChangeListener(rptgen_sl.appdata_sl, @changedModel);
        % 15 17
    end
    % 17 19
    h = RPTGEN_PROPSRC_FP_BLK;
end
function changedModel(hProp, eventData)
    % 21 27
    % 22 27
    % 23 27
    % 24 27
    % 25 27
    reset(rptgen_fp.propsrc_fp_blk);
end
