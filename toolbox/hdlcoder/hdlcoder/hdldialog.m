function hdldialog(model)
    % 1 15
    % 2 15
    % 3 15
    % 4 15
    % 5 15
    % 6 15
    % 7 15
    % 8 15
    % 9 15
    % 10 15
    % 11 15
    % 12 15
    % 13 15
    error(nargchk(0.0, 1.0, nargin));
    if lt(nargin, 1.0)
        model = bdroot;
    end % if
    attachhdlcconfig(model);
    slCfgPrmDlg(model, 'Open');
    slCfgPrmDlg(model, 'TurnToPage', 'HDL Coder');
end % function
