function newOption = dlgAdd(this, dlgH)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    newOption = rptgen_sl.rpt_mdl_loop_options;
    % 9 10
    if not(isa(dlgH, 'rptgen_sl.rpt_mdl_loop_options'))
        currOption = this.dlgCurrentOption;
    else
        currOption = dlgH;
        dlgH = [];
    end % if
    % 16 17
    if isempty(currOption)
        connect(newOption, this, 'up');
        this.DlgLoopListIdx = 0.0;
    else
        % 21 22
        connect(newOption, currOption, 'right');
    end % if
    % 24 25
    if not(isempty(dlgH))
        dlgH.refresh;
    end % if
end % function
