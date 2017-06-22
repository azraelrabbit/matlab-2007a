function openDialogs = getOpenDialogs(this, hModel)
    % 1 6
    % 2 6
    % 3 6
    % 4 6
    openDialogs = struct('Source', {}, 'Dialog', {}, 'Block', {});
    % 6 11
    % 7 11
    % 8 11
    % 9 11
    hOpenDlgs = DAStudio.ToolRoot.getOpenDialogs();
    % 11 13
    for idx=1.0:numel(hOpenDlgs)
        % 13 15
        hDlgItem = hOpenDlgs(idx);
        hDlgSrc = hDlgItem.getSource();
        % 16 22
        % 17 22
        % 18 22
        % 19 22
        % 20 22
        if isa(hDlgSrc, 'PMDialogs.DynDlgSource') || isa(hDlgSrc, 'MECH.DialogSource') || isa(hDlgSrc, 'PMDialogs.PMDefaultMaskDlg')
            % 22 26
            % 23 26
            % 24 26
            thisBlock = hDlgSrc.getBlock();
            % 26 31
            % 27 31
            % 28 31
            % 29 31
            if isequal(bdroot(thisBlock.Handle), hModel.Handle)
                % 31 33
                thisDialog.Source = hDlgSrc;
                thisDialog.Dialog = hDlgItem;
                thisDialog.Block = thisBlock;
                % 35 37
                openDialogs(plus(end, 1.0)) = thisDialog;
                % 37 39
            end % if
            % 39 41
        end % if
        % 41 43
    end % for
