function dlgMoveDown(this, dlgH)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    if not(isa(dlgH, 'rptgen_sl.rpt_mdl_loop_options'))
        currOption = this.dlgCurrentOption;
    else
        currOption = dlgH;
        dlgH = [];
    end % if
    % 14 15
    if not(isempty(currOption))
        if moveDown(currOption) && not(isempty(dlgH))
            % 17 18
            this.DlgLoopListIdx = plus(this.DlgLoopListIdx, 1.0);
            dlgH.setWidgetValue('ModelList', this.DlgLoopListIdx);
            dlgH.refresh;
        end % if
    end % if
end % function
