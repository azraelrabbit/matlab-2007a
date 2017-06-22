function dlgMoveUp(this, dlgH)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    % 8 9
    if not(isa(dlgH, 'rptgen_sl.rpt_mdl_loop_options'))
        currOption = this.dlgCurrentOption;
    else
        currOption = dlgH;
        dlgH = [];
    end % if
    % 15 16
    if not(isempty(currOption))
        if moveUp(currOption) && not(isempty(dlgH))
            % 18 19
            this.DlgLoopListIdx = minus(this.DlgLoopListIdx, 1.0);
            dlgH.setWidgetValue('ModelList', this.DlgLoopListIdx);
            dlgH.refresh;
        end % if
    end % if
end % function
