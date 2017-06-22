function dlgstruct = getDialogSchema(h, name)
    % 1 5
    % 2 5
    % 3 5
    if strcmp(name, 'Target Options')
        dlgstruct = getTargetOptionsDlg(h, name);
    else
        if strcmp(name, 'Coder Options')
            dlgstruct = getCoderOptionsDlg(h, name);
        else
            dlgstruct = getTargetDlg(h, name);
        end % if
    end % if
end % function
