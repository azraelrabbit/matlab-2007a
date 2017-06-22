function out = captureDialog(this, d, objH)
    % 1 9
    % 2 9
    % 3 9
    % 4 9
    % 5 9
    % 6 9
    % 7 9
    out = [];
    % 9 11
    if isempty(objH)
        this.status('No current object for snapshot');
        return;
    end % if
    % 14 18
    % 15 18
    % 16 18
    if isa(objH, 'Simulink.Block')
        % 18 25
        % 19 25
        % 20 25
        % 21 25
        % 22 25
        % 23 25
        openParameterDlg = true;
        if strcmp(objH.Mask, 'on')
            try
                open_system(objH.Handle, 'mask');
                openParameterDlg = false;
                % 29 32
                % 30 32
            end % try
        end % if
        % 33 35
        if openParameterDlg
            try
                open_system(objH.Handle, 'parameter');
            catch
                this.status('Unable to create dialog', 2.0);
                this.status(lasterr, 5.0);
                return;
            end % try
        end % if
        % 43 46
        % 44 46
        allDialogs = getOpenDialogs(DAStudio.ToolRoot);
        % 46 48
        dlgH = [];
        for i=1.0:length(allDialogs)
            if isa(allDialogs(i).getDialogSource, 'Simulink.SLDialogSource') && eq(allDialogs(i).getDialogSource.getBlock, objH)
                % 50 52
                dlgH = allDialogs(i);
                break
            end % if
        end % for
        % 55 57
        if isempty(dlgH)
            this.status('Unable to create dialog', 2.0);
            return;
        end % if
    else
        % 61 63
        try
            dlgH = DAStudio.Dialog(objH);
        catch
            % 65 67
            this.status('Unable to create dialog', 2.0);
            this.status(lasterr, 5.0);
            return;
        end % try
    end % if
    % 71 73
    if this.CaptureTabs
        dlgIm = DAStudio.imDialog.getIMWidgets(dlgH);
        out = this.traverseTabs(d, dlgH, dlgIm);
    end % if
    % 76 78
    if isempty(out)
        % 78 81
        % 79 81
        try
            out = this.gr_makeGraphic(d, dlgH);
        catch
            this.status('Unable to take snapshot', 2.0);
            this.status(lasterr, 5.0);
        end % try
    end % if
    % 87 89
    try
        delete(dlgH);
    end % try
