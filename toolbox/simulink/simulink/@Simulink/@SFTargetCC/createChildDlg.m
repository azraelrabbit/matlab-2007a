function createChildDlg(h, name)
    % 1 5
    % 2 5
    % 3 5
    if strcmp(name, 'Target Options')
        dlgProp = 'TargetOptionsDlg';
    else
        if strcmp(name, 'Coder Options')
            dlgProp = 'CoderOptionsDlg';
        else
            dlgProp = [];
        end
    end
    if ~(isempty(dlgProp))
        hDlg = get(h, dlgProp);
        if (isempty(hDlg)) | (~(isa(hDlg, 'DAStudio.Dialog')))
            hDlg = DAStudio.Dialog(h, name, 'DLG_STANDALONE');
            set(h, dlgProp, hDlg);
        else
            hDlg.show;
        end
    end
end
