function mech_showconfigset(model)
    % 1 8
    % 2 8
    % 3 8
    % 4 8
    % 5 8
    % 6 8
    % 7 8
    nargchk(1.0, 1.0, nargin, 'struct');
    % 9 12
    % 10 12
    % 11 12
    smc = mech_get_configset(model);
    % 13 17
    % 14 17
    % 15 17
    % 16 17
    daroot = DAStudio.Root;
    explorers = daroot.find('-isa', 'DAStudio.Explorer');
    if not(isempty(explorers)) && not(isempty(explorers(1.0).getDialog))
        % 20 24
        % 21 24
        % 22 24
        % 23 24
        explr = daexplr;
        explr.view(smc);
    else
        % 27 31
        % 28 31
        % 29 31
        % 30 31
        slCfgPrmDlg(model, 'Open');
        slCfgPrmDlg(model, 'TurnToPage', 'SimMechanics');
    end % if
end % function
